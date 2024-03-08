CREATE OR REPLACE PROCEDURE sp_musteri_ekle(
    p_ad_soyad VARCHAR,
    p_tc_kimlik_no CHAR(11),
    p_dogum_yeri VARCHAR,
    p_dogum_tarihi DATE,
    p_risk_limiti NUMERIC
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO musteriler(ad_soyad, tc_kimlik_no, dogum_yeri, dogum_tarihi, risk_limiti)
    VALUES (p_ad_soyad, p_tc_kimlik_no, p_dogum_yeri, p_dogum_tarihi, p_risk_limiti);
END;
-- ek olarak burada ROLLBACK kullanabilirim 
$$;
