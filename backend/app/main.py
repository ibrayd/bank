from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from sqlmodel import Session, select
from jose import JWTError, jwt

from .database import engine, init_db
from .models.user import User, UserCreate
from .core.security import verify_password, get_password_hash, create_access_token
from .core.config import get_settings

init_db()
settings = get_settings()
app = FastAPI(title=settings.app_name)

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


def get_session():
    with Session(engine) as session:
        yield session


def get_current_user(
    token: str = Depends(oauth2_scheme),
    session: Session = Depends(get_session),
):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(
            token, settings.secret_key, algorithms=[settings.algorithm]
        )
        username: str | None = payload.get("sub")
        if username is None:
            raise credentials_exception
    except JWTError:
        raise credentials_exception
    user = session.exec(select(User).where(User.username == username)).first()
    if user is None:
        raise credentials_exception
    return user


@app.post("/token")
def login(
    form_data: OAuth2PasswordRequestForm = Depends(),
    session: Session = Depends(get_session),
):
    user = session.exec(select(User).where(User.username == form_data.username)).first()
    if not user or not verify_password(form_data.password, user.hashed_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
        )
    access_token = create_access_token({"sub": user.username, "role": user.role})
    return {"access_token": access_token, "token_type": "bearer"}


@app.post("/register")
def register(user_in: UserCreate, session: Session = Depends(get_session)):
    existing = session.exec(select(User).where(User.username == user_in.username)).first()
    if existing:
        raise HTTPException(status_code=400, detail="User already exists")
    user = User(
        username=user_in.username,
        email=user_in.email,
        role=user_in.role,
        hashed_password=get_password_hash(user_in.password),
    )
    session.add(user)
    session.commit()
    session.refresh(user)
    return {"id": user.id, "username": user.username}


@app.get("/")
def read_root():
    return {"message": "Lab Management System"}


@app.get("/me")
def read_me(current_user: User = Depends(get_current_user)):
    return {
        "id": current_user.id,
        "username": current_user.username,
        "email": current_user.email,
        "role": current_user.role,
    }
