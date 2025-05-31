# Lab Management System

Bu depo, FastAPI ve React kullanarak gelistirilecek bir Laboratuvar Yönetim Sistemi icin temel bir iskelet sunar.

## Docker Compose ile Calistirma

Projeyi calistirmak icin docker-compose kullanabilirsiniz:

```bash
docker-compose up --build
```

Backend FastAPI 8000 portunda, Frontend ise 3000 portunda calisir.

## Backend
- Python 3.11 ve FastAPI
- JWT tabanli kimlik dogrulama
- SQLModel ile PostgreSQL veritabani
- `/register` ile kullanici kaydi
- `/token` ile giris yapip JWT alimi
- `/me` endpointi ile mevcut kullaniciyi goruntuleme

## Frontend
- React + Vite + Tailwind CSS
- Basit karsilama sayfasi

Daha gelismis ozellikler icin kod genisletilebilir.
