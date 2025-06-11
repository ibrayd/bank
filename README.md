# Lab Management System

Bu depo, FastAPI ve React kullanarak gelistirilecek bir Laboratuvar Yonetim Sistemi icin temel bir iskelet sunar.

## Docker Compose ile Calistirma

Projeyi calistirmak icin docker-compose kullanabilirsiniz:

```bash
docker-compose up --build
```

Backend FastAPI 8000 portunda, Frontend ise 3000 portunda calisir.

### Kullanici Kaydi ve Giris

Kayit icin `/register` endpoint'ine asagidaki JSON verisini gonderin:

```json
{
  "username": "alice",
  "email": "alice@example.com",
  "password": "secret",
  "role": "student"
}
```

`/token` endpoint'ine `username` ve `password` alanlarini gondererek JWT token alabilirsiniz. Donen `access_token` degerini `Authorization: Bearer <token>` seklinde kullanin.

`/me` endpoint'i gecerli token ile oturum acmis kullaniciyi dondurur.

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
