CREATE OR REPLACE PROCEDURE sp_hesap_olustur(
    p_musteri_id INTEGER,
    p_hesap_adi VARCHAR,
    p_hesap_numarasi VARCHAR,
    p_iban CHAR(26),
    p_durum BOOLEAN
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO hesaplar(musteri_id, hesap_adi, hesap_numarasi, iban, durum)
    VALUES (p_musteri_id, p_hesap_adi, p_hesap_numarasi, p_iban, p_durum);
END;
$$;
