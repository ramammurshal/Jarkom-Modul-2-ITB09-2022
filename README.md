# Jarkom-Modul-2-ITB09-2022
Laporan Resmi Praktikum Jaringan Komunikasi Modul 2

---

## Anggota Kelompok
Nama | NRP
--- | ---
Rama Muhammad Murshal | 5027201041
Satrio Kamil Widhiwoso | 5027201051
Fairuz Azhar Auzan | 5027201059

## Daftar Isi
- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)
- [Soal 7](#soal-7)
- [Soal 8](#soal-8)

---

## Pengantar Soal
Twilight (〈黄昏 (たそがれ) 〉, <Tasogare>) adalah seorang mata-mata yang berasal dari negara Westalis. Demi menjaga perdamaian antara Westalis dengan Ostania, Twilight dengan nama samaran Loid Forger (ロイド・フォージャー, Roido Fōjā) di bawah organisasi WISE menjalankan operasinya di negara Ostania dengan cara melakukan spionase, sabotase, penyadapan dan kemungkinan pembunuhan. Berikut adalah peta dari negara Ostania:

![Topologi jaringan](./images/topologi.png)

## Soal 1
WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet.

### Jawaban Soal 1
#### a. `Ostania` sebagai Router
![Command bashrc Ostania](./images/soal-1/a-ostania-bashrc.PNG)

![Network config WISE](./images/soal-1/a-ostania-network.PNG)

#### b. `WISE` sebagai DNS Master
![Command bashrc Wise](./images/soal-1/b-wise-bashrc.PNG)

![Network config WISE](./images/soal-1/a-wise-network.PNG)

#### c. `Berlint` sebagai DNS Slave
![Command bashrc Berlint](./images/soal-1/c-berlint-bashrc.PNG)

![Network config Berlint](./images/soal-1/c-berlint-network.PNG)

#### d. `Eden` sebagai Web Server
![Command bashrc Eden](./images/soal-1/d-eden-bashrc.PNG)

![Network config Eden](./images/soal-1/d-eden-network.PNG)

#### e. `SSS` sebagai Client
![Command bashrc SSS](./images/soal-1/e-sss-bashrc.PNG)

![Network config SSS](./images/soal-1/e-sss-network.PNG)

#### f. `Garden` sebagai Client
![Command bashrc Garden](./images/soal-1/f-garden-bashrc.PNG)

![Network config Garden](./images/soal-1/f-garden-network.PNG)

## Soal 2
Untuk mempermudah mendapatkan informasi mengenai misi dari Handler, bantulah Loid membuat website utama dengan akses wise.yyy.com dengan alias www.wise.yyy.com pada folder wise.

### Jawaban Soal 2
Pertama-tama, kita buat domain pada `/etc/bind/named.conf.local` pada `Wise`.

![Named conf local wise soal 2](./images/soal-2/a-named-conf-local.PNG)

Kemudian, pada folder `/etc/bind` kita buat folder dengan nama `wise` yang di dalamnya kita buat lagi file `wise.itb09.com`. Selanjutnya, isi dari file tersebut adalah:

![wise.itb09.com soal 2](./images/soal-2/b-wise-itb09-com.PNG)

Kemudian, kita restart bind9 pada `Wise` menggunakan command `service bind9 restart`. Setelah itu, pastikan bahwa nameserver pada client `SSS` dan `Garden` mengarah pada IP `Wise`. Lalu, kita sisa testing apakah client `SSS` dan `Garden` sudah dapat terkoneksi dengan domain yang baru kita.

#### Contoh testing dari `SSS`

![Ping wise dari SSS soal 2](./images/soal-2/c-ping-sss-wise.PNG)

![Ping www wise dari SSS soal 2](./images/soal-2/d-ping-sss-www-wise.PNG)

![Host -t CNAME no 2](./images/soal-2/g-host-t-cname-sss.PNG)

## Soal 3
Setelah itu ia juga ingin membuat subdomain eden.wise.yyy.com dengan alias www.eden.wise.yyy.com yang diatur DNS-nya di WISE dan mengarah ke Eden.

### Jawaban Soal 3
Pertama-tama, kita edit file `/etc/bind/wise/wise.itb09.com` menjadi seperti berikut:

![wise itb09 com soal 3](./images/soal-3/a-wise-itb09-com.PNG)

Kemudian, kita restart bind9 `wise` menggunakan command `service bind9 restart`. Lalu, kita testing apakah subdomain yang barusan kita buat sudah berhasil berjalan.

#### Contoh testing dari `SSS`

![Ping eden dari sss soal 3](./images/soal-3/b-ping-eden.PNG)

![Ping www eden dari sss soal 3](./images/soal-3/c-ping-www-eden.PNG)

![Host -t A soal 3](./images/soal-3/d-host-t-a-cname.PNG)

![Host -t CNAME soal 3](./images/soal-3/e-host-t-cname.PNG)

## Soal 4
Buat juga reverse domain untuk domain utama.

### Jawaban Soal 4
Pada server `Wise`, kita lakukan edit pada `/etc/bind/named.conf.local` menjadi sebagai berikut:

![Named conf local soal 4](./images/soal-4/a-named-conf-local.PNG)

Kemudian kita lakukan konfigurasi pada file `/etc/bind/wise/3.49.10.in-addr.arpa` menjadi sebagai berikut:

![In addr arpa soal 4](./images/soal-4/b-in-addr-arpa.PNG)

Kemudian, kita lakukan testing pada server `SSS`

![Testing soal 4](./images/soal-4/c-testing.PNG)

## Soal 5
Agar dapat tetap dihubungi jika server WISE bermasalah, buatlah juga Berlint sebagai DNS Slave untuk domain utama.

### Pembahasan Soal 5
Pertama-tama, kita lakukan konfigurasi pada `/etc/bind/named.conf.local` pada server `Wise` menjadi sebagai berikut:

![Named conf local wise soal 5](./images/soal-5/a-name-conf-local-wise.PNG)

Kemudian, pada server `Wise`, kita restart server menggunakan perintah `service bind9 restart`.

Lalu, pada server `Berlint`, kita lakukan konfigurasi pada `/etc/bind/named.conf.local` menjadi sebagai berikut:

![Named conf local berlint soal 5](./images/soal-5/b-name-conf-local-berlint.PNG)

Lalu, restart server `Berlint` menggunakan `service bind9 restart`.

Selanjutnya, kita matikan service bind9 pada `Wise` menggunakan command `service bind9 stop`:

![Off server wise](./images/soal-5/c-off-wise.PNG)

Lalu testing pada server client `SSS`:

![Testing pada server client sss soal 5](./images/soal-5/d-testing-from-wise.PNG)

## Soal 6
