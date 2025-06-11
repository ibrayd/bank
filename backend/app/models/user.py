from sqlmodel import SQLModel, Field
from typing import Optional

class User(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    username: str
    email: str


class UserCreate(SQLModel):
    username: str
    email: str
    password: str
    role: str = "student"
    email: str


class UserCreate(SQLModel):
    username: str
    email: str
    password: str
    role: str = "student"
    email: str
    hashed_password: str
    role: str = "student"  # or 'professor'


class UserCreate(SQLModel):
    username: str
    email: str
    password: str
    role: str = "student"
