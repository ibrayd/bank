CREATE OR REPLACE PROCEDURE sp_kart_tanimla(
    p_hesap_id INTEGER,
    p_musteri_id INTEGER,
    p_kart_numarasi CHAR(16),
    p_gecerlilik_ay_yil CHAR(5),
    p_ccv_kodu CHAR(3),
    p_kart_tipi VARCHAR,
    p_aktif_mi BOOLEAN,
    p_limit NUMERIC DEFAULT NULL
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO kartlar(hesap_id, musteri_id, kart_numarasi, gecerlilik_ay_yil, ccv_kodu, kart_tipi, aktif_mi, kredi_limiti)
    VALUES (p_hesap_id, p_musteri_id, p_kart_numarasi, p_gecerlilik_ay_yil, p_ccv_kodu, p_kart_tipi, p_aktif_mi, p_limit);
END;
$$;
