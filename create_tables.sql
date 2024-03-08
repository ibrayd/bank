
-- Müşteriler Tablosu
CREATE TABLE musteriler (
    id SERIAL PRIMARY KEY,
    ad_soyad VARCHAR(100) NOT NULL,
    tc_kimlik_no CHAR(11) UNIQUE NOT NULL,
    dogum_yeri VARCHAR(50) NOT NULL,
    dogum_tarihi DATE NOT NULL,
    risk_limiti NUMERIC(15,2) NOT NULL DEFAULT 10000
);

-- Hesaplar Tablosu
CREATE TABLE hesaplar (
    id SERIAL PRIMARY KEY,
    musteri_id INTEGER NOT NULL,
    hesap_adi VARCHAR(50) NOT NULL,
    hesap_numarasi VARCHAR(20) UNIQUE NOT NULL,
    iban CHAR(26) UNIQUE NOT NULL,
    hesap_acilis_tarihi TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    durum BOOLEAN NOT NULL DEFAULT true,
    FOREIGN KEY (musteri_id) REFERENCES musteriler (id) ON DELETE CASCADE
);

-- Kartlar Tablosu
CREATE TABLE kartlar (
    id SERIAL PRIMARY KEY,
    hesap_id INTEGER,
    musteri_id INTEGER NOT NULL,
    kart_numarasi CHAR(16) UNIQUE NOT NULL,
    gecerlilik_ay_yil CHAR(5) NOT NULL,
    ccv_kodu CHAR(3) NOT NULL,
    kart_tipi VARCHAR(20) NOT NULL CHECK (kart_tipi IN ('Hesap Kartı', 'Kredi Kartı')), -- 'Hesap Kartı' veya 'Kredi Kartı'
    aktif_mi BOOLEAN NOT NULL DEFAULT true,
    kredi_limiti NUMERIC(15,2), -- Sadece kredi kartları için
    FOREIGN KEY (hesap_id) REFERENCES hesaplar (id) ON DELETE SET NULL,
    FOREIGN KEY (musteri_id) REFERENCES musteriler (id) ON DELETE CASCADE
);

-- İşlemler Tablosu
CREATE TABLE islemler (
    id SERIAL PRIMARY KEY,
    kart_id INTEGER NOT NULL,
    islem_turu VARCHAR(50) NOT NULL,
    tutar NUMERIC(15,2) NOT NULL,
    aciklama VARCHAR(100),
    islem_tarihi TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kart_id) REFERENCES kartlar (id) ON DELETE CASCADE
);