CREATE PROCEDURE p_doviz_kur(
    @arg_tarih utsdt,
    @arg_banka_id utn19
)
AS
BEGIN
    CREATE TABLE #temp_doviz_kur(
        doviz_kur_id numeric(19,0) NULL,
        tarih smalldatetime NULL,
        banka_id numeric(19,0) NULL,
        doviz_id numeric(19,0) NULL,
        alis numeric(19,6) NULL,
        satis numeric(19,6) NULL,
        ef_alis numeric(19,6) NULL,
        ef_satis numeric(19,6) NULL,
        parite numeric(19,6) NULL,
        duzeltilmez_kod smallint NULL,
        giren_user numeric(9,0) NULL,
        giris_tarih smalldatetime NULL,
        duzelten_user numeric(9,0) NULL,
        duzelten_tarih smalldatetime NULL,
        delete_user numeric(9,0) NULL,
        cc_getir_tip tinyint NULL
    );

    INSERT INTO #temp_doviz_kur
    SELECT
        0,
        @arg_tarih,
        @arg_banka_id,
        d.doviz_id,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    FROM doviz d;

    IF EXISTS(
        SELECT 1 
        FROM doviz_kur DK
        WHERE DK.tarih = @arg_tarih
        AND DK.banka_id = @arg_banka_id
    )
    BEGIN
        UPDATE #temp_doviz_kur
        SET doviz_kur_id = DK.doviz_kur_id,
            doviz_id = DK.doviz_id,
            alis = DK.alis,
            satis = DK.satis,
            ef_alis = DK.ef_alis,
            ef_satis = DK.ef_satis,
            parite = DK.parite,
            duzeltilmez_kod = DK.duzeltilmez_kod,
            giris_tarih = DK.giris_tarih,
            giren_user = DK.giren_user,
            duzelten_tarih = DK.duzelten_tarih,
            delete_user = DK.delete_user,
            cc_getir_tip = -1
        FROM doviz_kur DK
        WHERE DK.tarih = @arg_tarih
        AND DK.banka_id = @arg_banka_id
        AND DK.doviz_id = #temp_doviz_kur.doviz_id;
    END;

    SELECT * 
    FROM #temp_doviz_kur
    ORDER BY #temp_doviz_kur.doviz_id;
END;