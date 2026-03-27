🚀 API HRD Tahir

API ini dibuat menggunakan Laravel untuk mendukung sistem HR Management seperti manajemen user, karyawan, dan autentikasi menggunakan JWT.

📦 Persiapan Database
Jalankan XAMPP atau Laragon.
Buat database baru dengan nama:
sistem_hr
Import file database yang ada di folder:
db/sistem_hr.sql
Pastikan proses import database berhasil.
⚙️ Instalasi Project

Masuk ke folder project API:

cd api_hrd_tahir

Install dependency Laravel menggunakan Composer:

composer install

atau gunakan:

composer install --ignore-platform-reqs

jika ada masalah versi PHP

🔧 Konfigurasi Environment

Buat file .env di dalam folder api_hrd_tahir.

Isi file .env seperti berikut:

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
🔑 Generate Laravel Key

Jalankan perintah berikut untuk membuat APP_KEY:

php artisan key:generate
🔐 Generate JWT Secret

API ini menggunakan JWT Authentication, jalankan perintah berikut:

php artisan jwt:secret
▶️ Menjalankan Server

Jalankan server Laravel:

php artisan serve

Server akan berjalan di:

http://127.0.0.1:8000
