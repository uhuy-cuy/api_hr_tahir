---

# 🚀 API HRD Tahir

API ini dibuat menggunakan **Laravel** untuk mendukung sistem HR Management seperti manajemen user, karyawan, dan autentikasi menggunakan JWT.

---
### Clone Repository

```bash
git clone https://github.com/uhuy-cuy/api_hr_tahir.git
```
## 📦 Persiapan Database

1. Jalankan **XAMPP** atau **Laragon**.
2. Buat database baru dengan nama:

```bash
sistem_hr
```

3. Import file database yang ada di folder:

```bash
db/sistem_hr.sql
```

4. Pastikan proses import database berhasil.

---

## ⚙️ Instalasi Project

Masuk ke folder project API:

```bash
cd api_hrd_tahir
```

Install dependency Laravel menggunakan Composer:

```bash
composer install
```

atau gunakan:

```bash
composer install --ignore-platform-reqs
```

*jika ada masalah versi PHP*

---

## 🔧 Konfigurasi Environment

Buat file `.env` di dalam folder `api_hrd_tahir`.

Isi file `.env` seperti berikut:

```env
APP_KEY=

APP_NAME=Laravel
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=sistem_hr
DB_USERNAME=root
DB_PASSWORD=
```

---

## 🔑 Generate Laravel Key

Jalankan perintah berikut untuk membuat `APP_KEY`:

```bash
php artisan key:generate
```

---

## 🔐 Generate JWT Secret

API ini menggunakan JWT Authentication, jalankan perintah berikut:

```bash
php artisan jwt:secret
```

---

## ▶️ Menjalankan Server

Jalankan server Laravel:

```bash
php artisan serve
```

Server akan berjalan di:

```
http://127.0.0.1:8000
```

---
