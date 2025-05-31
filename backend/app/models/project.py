from sqlmodel import SQLModel, Field, Relationship
from typing import Optional, List

class Project(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    title: str
    description: Optional[str] = None
    tasks: List['Task'] = Relationship(back_populates='project')

class Task(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    title: str
    description: Optional[str] = None
    status: str = "pending"
    project_id: Optional[int] = Field(default=None, foreign_key="project.id")
    assignee_id: Optional[int] = Field(default=None, foreign_key="user.id")

    project: Optional[Project] = Relationship(back_populates='tasks')
