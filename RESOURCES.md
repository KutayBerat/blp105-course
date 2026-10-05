# Kaynaklar

Hiçbirini baştan sona okumak zorunda değilsin. Her haftanın README'sinde o haftayla ilgili 1-2 bağlantı ayrıca var, burası tam liste.

## Ana ders kitabı

Silberschatz, Korth, Sudarshan, *Database System Concepts*, 7. baskı, McGraw-Hill, 2019. Yazarların resmi sitesinde (db-book.com) içindekiler, örnek veritabanları ve tarayıcı içi bir SQL çalıştırma aracı ücretsiz: https://www.db-book.com/

## PostgreSQL resmi dokümantasyonu

Dönem boyunca en çok başvuracağın kaynak, https://www.postgresql.org/docs/current/ üzerinden, konuya göre:

| Konu | Sayfa |
|---|---|
| Querying a Table (SELECT, WHERE) | https://www.postgresql.org/docs/current/tutorial-select.html |
| Joins Between Tables | https://www.postgresql.org/docs/current/tutorial-join.html |
| Aggregate Functions | https://www.postgresql.org/docs/current/tutorial-agg.html |
| Updates / Deletions | https://www.postgresql.org/docs/current/tutorial-update.html , https://www.postgresql.org/docs/current/tutorial-delete.html |
| Views | https://www.postgresql.org/docs/current/tutorial-views.html |
| Foreign Keys | https://www.postgresql.org/docs/current/tutorial-fk.html |
| Transactions | https://www.postgresql.org/docs/current/tutorial-transactions.html |
| Window Functions | https://www.postgresql.org/docs/current/tutorial-window.html |
| Data Definition (DDL) | https://www.postgresql.org/docs/current/ddl.html |
| Data Manipulation (DML) | https://www.postgresql.org/docs/current/dml.html |
| WITH Queries (CTE) | https://www.postgresql.org/docs/current/queries-with.html |
| JSON Types | https://www.postgresql.org/docs/current/datatype-json.html |
| Indexes | https://www.postgresql.org/docs/current/indexes.html |
| Using EXPLAIN | https://www.postgresql.org/docs/current/using-explain.html |
| Database Roles | https://www.postgresql.org/docs/current/user-manag.html |
| Row Security Policies | https://www.postgresql.org/docs/current/ddl-rowsecurity.html |

## Uygulama ve pratik

- SQLBolt, 18 adımlık interaktif SQL dersi, tarayıcıda çalışır: https://sqlbolt.com/
- PGExercises, tek bir örnek veri seti üzerinde kategorilere ayrılmış sorular: https://pgexercises.com/
- SQL Murder Mystery, bir cinayeti SQL sorgularıyla çözüyorsun, JOIN pratiği için iyi bir ısınma: https://mystery.knightlab.com/

## İleri okuma

- Markus Winand, *Use The Index, Luke*, indeksleme ve sorgu performansı üzerine ücretsiz bir site, PostgreSQL dahil: https://use-the-index-luke.com/
- CMU 15-445, Intro to Database Systems, açık ders materyalleri: https://15445.courses.cs.cmu.edu/

## Araçlar

- Mermaid ERD sözdizimi, ERD'ni markdown içinde çizip GitHub'da otomatik render ettirmek için: https://mermaid.js.org/syntax/entityRelationshipDiagram.html
- pgvector, PostgreSQL için vektör benzerlik araması eklentisi (L2, kosinüs, iç çarpım mesafeleri, HNSW ve IVFFlat indeksleri): https://github.com/pgvector/pgvector
- GitHub Docs: https://docs.github.com/

Bu liste sabit değil. Bir şeyi anlamanı kolaylaştıran başka bir kaynak bulursan bir Issue aç, listeye ekleyelim.
