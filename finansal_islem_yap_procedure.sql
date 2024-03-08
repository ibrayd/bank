CREATE OR REPLACE PROCEDURE sp_finansal_islem_yap(
    p_kart_id INTEGER,
    p_islem_turu VARCHAR,
    p_tutar NUMERIC,
    p_aciklama VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO islemler(kart_id, islem_turu, tutar, aciklama, islem_tarihi)
    VALUES (p_kart_id, p_islem_turu, p_tutar, p_aciklama, CURRENT_TIMESTAMP);

END;
$$;
