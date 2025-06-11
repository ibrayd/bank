# Lab Management System



- JWT tabanli kimlik dogrulama
- /register, /token ve /me endpoint'leri


### Ornek Kullanım

Kullanici kaydetmek icin:

```bash
curl -X POST http://localhost:8000/register \
  -H 'Content-Type: application/json' \
  -d '{"username": "alice", "email": "a@example.com", "password": "secret", "role": "student"}'
```

Giris yapip token almak icin:

```bash
curl -X POST http://localhost:8000/token \
  -d 'username=alice&password=secret' \
  -H 'Content-Type: application/x-www-form-urlencoded'
```

Token ile oturum acmis kullaniciyi almak icin:

```bash
curl http://localhost:8000/me \
  -H "Authorization: Bearer YOUR_TOKEN"
```

```bash
curl -X POST http://localhost:8000/register \
    -H "Content-Type: application/json" \
    -d '{"username": "alice", "email": "alice@example.com", "password": "secret", "role": "student"}'
```

### Giris Yapma

```bash
curl -X POST http://localhost:8000/token \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "username=alice&password=secret"
```

### Kimligi Dogrulanmis Kullanici

```bash
curl http://localhost:8000/me -H "Authorization: Bearer <TOKEN>"
```

### Kayit ve Giris Ornekleri

Kullanici kaydi icin:

```bash
curl -X POST http://localhost:8000/register \
  -H "Content-Type: application/json" \
  -d '{"username": "demo", "email": "demo@example.com", "password": "secret", "role": "student"}'
```

Giris yapip token almak icin:

```bash
curl -X POST http://localhost:8000/token \
  -F "username=demo" -F "password=secret"
```

Alinan JWT token ile oturum acmis kullaniciyi almak icin:

```bash
curl http://localhost:8000/me -H "Authorization: Bearer <TOKEN>"
```

## Kullanici Kayit ve Giris

Kullanici kaydi icin ornek istek:

```bash
curl -X POST http://localhost:8000/register \
  -H "Content-Type: application/json" \
  -d '{"username": "alice", "email": "alice@example.com", "password": "secret", "role": "student"}'
```

Giris yapmak icin:

```bash
curl -X POST http://localhost:8000/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=alice&password=secret"
```

Donen `access_token` degeri Authorization basliginda `Bearer` olarak gonderilerek `/me` uzerinden mevcut kullanici bilgileri alinabilir:

```bash
curl http://localhost:8000/me -H "Authorization: Bearer <token>"
```
- JWT tabanli kimlik dogrulama

### Kayit Olma
```bash
curl -X POST http://localhost:8000/register \
  -H "Content-Type: application/json" \
  -d '{"username":"alice","email":"alice@example.com","password":"secret","role":"student"}'
```

### Giris Yapma
```bash
curl -X POST http://localhost:8000/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d 'username=alice&password=secret'
```
Sonucunda `access_token` doner.

### Kimligimi Dogrula
```bash
curl http://localhost:8000/me -H "Authorization: Bearer <TOKEN>"
```

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
