from pydantic import BaseSettings

class Settings(BaseSettings):
    app_name: str = "Lab Management System"
    secret_key: str = "CHANGE_ME"
    algorithm: str = "HS256"
    access_token_expire_minutes: int = 60
    database_url: str = "postgresql+psycopg2://postgres:postgres@db:5432/postgres"

    class Config:
        env_file = ".env"

def get_settings() -> Settings:
    return Settings()
