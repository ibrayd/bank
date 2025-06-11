# Lab Management System


## Kullanici Kayit ve Giris

Bir kullanici olusturmak icin `/register` endpoint'ini kullanin:

```bash
curl -X POST http://localhost:8000/register \
  -H "Content-Type: application/json" \
  -d '{"username": "alice", "email": "alice@example.com", "password": "secret", "role": "student"}'
```

Giris yapmak icin `/token` endpoint'ine kullanici adi ve sifre gonderin:

```bash
curl -X POST http://localhost:8000/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=alice&password=secret"
```

Token'i kullanarak oturum acmis kullaniciyi `/me` ile gorebilirsiniz:

```bash
curl http://localhost:8000/me -H "Authorization: Bearer <TOKEN>"
```
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
