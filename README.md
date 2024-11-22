# T-SQL
T-SQL
1. Table (Tablo):
Veritabanındaki en temel veri depolama yapısıdır. Tablo, belirli bir düzenle ve sütunlarla organize edilmiş verilerin saklandığı bir yapıdır. Her sütun bir veri türüyle tanımlanır ve satırlar bu sütunların verilerini içerir.
Örneğin, bir Doviz tablosu şunları içerebilir:

[doviz_id] (int)
[ad] (nvarchar)
[doviz_kod] (varchar)

2-Trigger, 
bir tabloda belirli olaylar meydana geldiğinde (INSERT, UPDATE veya DELETE) otomatik olarak çalışan bir T-SQL kod bloğudur. Genellikle veri tutarlılığını sağlamak veya otomatik işlemler yapmak için kullanılır.
Örnek:
Bir doviz tablosunda, eklenen doviz tipi ve doviz miktarları otomatik olarak bir log tablosuna yazan bir trigger olabilir.

3. Stored Procedure (Saklı Yordam):
Sık kullanılan bir işlem için yazılan, tekrar tekrar çağrılabilir T-SQL komut bloğudur.
Prosedürler, işlemleri hızlandırır, yönetimi kolaylaştırır ve kod tekrarını önler. Parametre alabilir ve işlem sonucunda veri döndürebilir.


Tablo: Veri depolamak için kullanılır.
Trigger: Tablo üzerinde gerçekleşen olaylara tepki olarak otomatik çalışan kod.
Prosedür: Tekrar eden işlemleri düzenlemek için yazılan ve gerektiğinde çağrılan kod bloğu.
Bu üç araç, veritabanı yönetimi ve veri işleme süreçlerini kolaylaştırır ve optimize eder. 
