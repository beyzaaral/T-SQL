CREATE TRIGGER tdiu_doviz_kur ON doviz_kur
WITH ENCRYPTION
FOR DELETE, INSERT, UPDATE
AS
DECLARE
    @tarih datetime,
    @banka_no tinyint,
    @doviz_no tinyint,
    @alis numeric(18,5),
    @satis numeric(18,5),
    @ef_alis numeric(18,5),
    @ef_satis numeric(18,5),
    @parite numeric(18,5),
    @duzeltilmez_kod numeric(18,5),
    @giren_user numeric(6,0),
    @giris_tarih smalldatetime,
    @duzelten_user numeric(6,0),
    @duzeltme_tarih smalldatetime,
    @sirket_kod tinyint,
    @profile_names varchar(100),
    @is_recipientemail varchar(500),
    @is_message_text nvarchar(max),
    @is_ccrecipientemail nvarchar(max),
    @is_message varchar(255)

DECLARE
    @ll_mailitem_id int,
    @tarih_now datetime,
    @zaman int

SET @tarih_now = GETDATE()
SET @zaman = DATEPART(hour, @tarih_now)
SET @is_recipientemail = 'deneme@deneme.com'
SET @is_ccrecipientemail = 'deneme@deneme.com'

SET @firma = (SELECT TOP 1 ISNULL(firma_id,1) FROM firma)

IF NOT EXISTS (SELECT 1 FROM doviz_kur WHERE CONVERT(datetime,tarih) = @tarih_now)
BEGIN
    SET @profile_names = (SELECT TOP 1 ISNULL(ad,'') FROM parametre WHERE firma_id = @firma_id)

    IF EXISTS (SELECT 1 FROM msdb.dbo.sysmail_profile WHERE RTRIM(LTRIM(name)) = RTRIM(LTRIM(@profile_names)))
    BEGIN
        IF @profile_names <> ''
        BEGIN
            EXEC @ll_mailitem_id = msdb.dbo.sp_send_dbmail
                @recipients = @is_recipientemail,
                @body_format = 'HTML',
                @body = @is_message_text,
                @sensitivity = 'Personal',
                @importance = 'HIGH',
                @copy_recipients = @is_ccrecipientemail,
                @subject = @is_message,
                @profile_name = @profile_names
        END
    END
END
GO