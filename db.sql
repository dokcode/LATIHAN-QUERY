CREATE DATABASE db_iqbal
\l
\c db_iqbal;

-- struktur tabel
-- one-to-one 
CREATE TYPE jekel as enum ('laki-laki', 'perempuan')
CREATE TYPE coding as enum ('fullstack web', 'fullstack mobile', 'QA', 'frontend developer reactjs', 'backend developer expressjs')

CREATE TABLE talent_pijar (id_talent SERIAL PRIMARY KEY, nama varchar(255), batch INT, program coding, jenis_kelamin jekel)

CREATE TABLE komputer (id_komp SERIAL PRIMARY KEY, ram varchar(255), processor varchar(255), memory varchar(255), vga varchar(255), nip INT, constraint fk_talent foreign key (id_talent) references talent_pijar(id_talent))



-- one-to-many 
CREATE TYPE agm as enum ('islam', 'protestan', 'khatolik', 'hindu', 'budha', 'konghucu')

CREATE TABLE tempat_ibadah (id_tempat SERIAL PRIMARY KEY, nama varchar(255), agama agm, jumlah_jamaah INT)
CREATE TABLE jamaah (id_jamaah SERIAL PRIMARY KEY, nama_jamaah varchar(255), umur_jamaah INT, jenis_kelamin jekel, id_tempat INT, constraint fk_tempat foreign key (id_tempat) references tempat_ibadah(id_tempat))



-- many-to-many
CREATE TABLE distributor (id_distributor SERIAL PRIMARY KEY, nama_distributor varchar(255), alamat varchar(255), jumlah_pendapata INT)
CREATE TABLE pasok (id_pasok SERIAL PRIMARY KEY, CONSTRAINT fk_dis FOREIGN KEY (id_distributor) REFERENCES distributor (id_distributor), CONSTRAINT fk_book FOREIGN KEY (id_buku) REFERENCES buku (id_buku), jumlah INT, tanggal date)

CREATE TYPE sts as enum ('admin1', 'admin2', 'admin3')

CREATE TABLE kasir (id_kasir SERIAL PRIMARY KEY, nama varchar(255), alamat varchar(255), telepon INT, statuss sts, username varchar(255), passwordd varchar(255))
CREATE TABLE penjualan (id penjualan SERIAL PRIMARY KEY, CONSTRAINT fk_book FOREIGN KEY (id_buku) REFERENCES buku (id_buku), CONSTRAINT fk_kasir FOREIGN KEY (id_kasir) REFERENCES kasir (id_kasir), jumlah INT, total INT, tanggal date )

CREATE TABLE buku (id_buku SERIAL PRIMARY KEY, judul varchar(255), nisbn varchar(255), penulis	varchar(255), penerbit	varchar(255), tahun INT, stok INT, harga_jual INT)



--CRUD TABLE talent_pijar
-- INSERT
insert into talent_pijar ( nama , batch , program , jenis_kelamin ) values ( 'iqbal', 8, 'fullstack web', 'laki-laki')
insert into talent_pijar ( nama , batch , program , jenis_kelamin) values ( 'dhimas', 8, 'fullstack web', 'laki-laki')
insert into talent_pijar ( nama , batch , program , jenis_kelamin) values ( 'ilham', 8, 'fullstack web', 'laki-laki')
insert into talent_pijar ( nama , batch , program , jenis_kelamin) values ( 'aldo', 8, 'fullstack web', 'laki-laki')

--READ
SELECT nama, program FROM talent_pijar

-- UPDATE 
update talent_pijar set program = 'frontend developer reactjs' where id_talent = 1

-- DELETE 
delete from talent_pijar where nama = 'iqbal';
DROP TABLE talent_pijar

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE komputer
-- INSERT
insert into komputer ( ram, processor, memory, vga) values ( '8gb', 'intel caleron', '500HDD', 'NVDIA')
insert into komputer ( ram, processor, memory, vga) values ( '4gb', 8, 'intel caleron', '250SSD', 'NVDIA')
insert into komputer ( ram, processor, memory, vga) values ( '12gb', 8, 'intel caleron', '250SSD', 'NVDIA')
insert into komputer ( ram, processor, memory, vga) values ( '4gb', 8, 'intel caleron', '250SSD', 'NVDIA')

--READ
SELECT * FROM komputer
SELECT ram, processor FROM komputer

-- UPDATE 
update komputer set ram = 'frontend developer reactjs' where id_komp = 1

-- DELETE 
delete from komputer where vga = '500HDD'
DROP TABLE komputer


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE tempat_ibadah
-- INSERT
insert into tempat_ibadah ( nama, agama, jumlah_jamaah ) values ( 'mesjid nurul huda', 'islam', '500HDD', 1000)
insert into tempat_ibadah ( nama, agama, jumlah_jamaah ) values ( 'greja xsx', 'protestan', 500)
insert into tempat_ibadah ( nama, agama, jumlah_jamaah ) values ( 'greja kdnfds', 'khatolik' 300)
insert into tempat_ibadah ( nama, agama, jumlah_jamaah ) values ( 'kuil ahdca', 'budha', 100)

--READ
SELECT * FROM tempat_ibadah
SELECT nama, agama FROM tempat_ibadah

-- UPDATE 
update tempat_ibadah set nama = 'mesjid al-aqsa' where id_komp = 1

-- DELETE 
delete from tempat_ibadah where nama = 'kuil ahdca'
DROP TABLE tempat_ibadah


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE jamaah
-- INSERT
insert into jamaah ( nama_jamaah, umur_jamaah, jenis_kelamin ) values ( 'iqbal', 23, 'laki-laki')
insert into jamaah ( nama_jamaah, umur_jamaah, jenis_kelamin ) values ( 'ilham', 21, 'laki-laki')
insert into jamaah ( nama_jamaah, umur_jamaah, jenis_kelamin ) values ( 'house', 22, 'laki-laki')
insert into jamaah ( nama_jamaah, umur_jamaah, jenis_kelaminh ) values ( 'alif ahdca', 32, 'laki-laki')

--READ
SELECT * FROM jamaah
SELECT nama_jamaah, umur_jamaah FROM jamaah

-- UPDATE 
update jamaah set nama_jamaah = 'edo' where id_komp = 1

-- DELETE 
delete from jamaah where nama_jamaah = 'edo'
DROP TABLE jamaah




--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE distributor
-- INSERT
insert into distributor ( nama_distributor, alamat, jumlah_pendapata ) values ( 'iqbal', 'jambi', 3000000)
insert into distributor ( nama_distributor, alamat, jumlah_pendapata  ) values ( 'ilham', 'jogja', 4000000)
insert into distributor ( nama_distributor, alamat, jumlah_pendapata  ) values ( 'house', 'makassar', 5000000)
insert into distributor ( nama_distributor, alamat, jumlah_pendapata  ) values ( 'alif ahdca', 'jawa timur', 5000000)

--READ
SELECT * FROM distributor
SELECT nama_distributor, alamat FROM distributor

-- UPDATE 
update distributor set nama_distributor = 'edo' where id_komp = 1

-- DELETE 
delete from distributor where nama_distributor = 'edo'
DROP TABLE distributor



--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE pasok
insert into pasok ( jumlah ) values ( 2)
insert into pasok ( jumlah ) values ( 5)
insert into pasok ( jumlah  ) values ( 7)
insert into pasok ( jumlah ) values ( 9)

--READ
SELECT * FROM pasok
SELECT jumlah FROM pasok

-- UPDATE 
update pasok set jumlah = 10  where id_pasok = 1

-- DELETE 
delete from pasok where jumlah = 10
DROP TABLE pasok




--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE pasok
insert into kasir (  nama , alamat,  telepon , statuss , username , passwordd ) values ('iqbal', 'jambi', 085356263, 'admin1', 'iqbal24', 'dbjsdd3')
insert into kasir ( nama , alamat,  telepon , statuss , username , passwordd ) values ('alif', 'jakarta', 0853562634, 'admin3', 'alif24', 'dbjsdd3e')

--READ
SELECT * FROM kasir
SELECT statuss FROM kasir

-- UPDATE 
update kasir set statuss = 'admin2'  where id_kasir = 1

-- DELETE 
delete from kasir where statuss = 'admin2'
DROP TABLE kasir




--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE penjualan
insert into penjualan ( jumlah , total) values (3, 100000)
insert into penjualan ( jumlah , total ) values (4, 500000)

--READ
SELECT * FROM penjualan
SELECT jumlah FROM penjualan

-- UPDATE 
update penjualan set jumlah = 3  where id_kasir = 1

-- DELETE 
delete from penjualan where jumlah = 3
DROP TABLE penjualan



--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CRUD TABLE buku
insert into buku ( judul , nisbn , penulis	, penerbit	, tahun , stok , harga_jual ) values ('aku padamu', '82eg373782', 'iqbal', 'cv.iqbal buku', 2014, 100, 100000 )
insert into buku ( judul , nisbn , penulis	, penerbit	, tahun , stok , harga_jual  ) values ('belajar logic', '82eg373782c', 'edo', 'cv.iqbal buku', 2019, 300, 100000)

--READ
SELECT * FROM buku
SELECT judul FROM buku

-- UPDATE 
update buku set  judul = 'belajar coding'  where id_buku = 1

-- DELETE 
delete from buku where penulis = 'cv.iqbal buku'
DROP TABLE buku