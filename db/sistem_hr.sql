-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2026 at 01:03 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensis`
--

CREATE TABLE `absensis` (
  `id_absensi` bigint UNSIGNED NOT NULL,
  `id_karyawan` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `status` enum('hadir','izin','sakit','alpha') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hadir',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absensis`
--

INSERT INTO `absensis` (`id_absensi`, `id_karyawan`, `tanggal`, `jam_masuk`, `jam_keluar`, `status`, `created_at`) VALUES
(5, 17, '2026-03-11', NULL, NULL, 'izin', '2026-03-11 10:15:10'),
(14, 4, '2026-03-12', '10:20:13', '10:20:16', 'hadir', '2026-03-12 03:20:14'),
(15, 17, '2026-03-12', '10:57:35', '10:57:37', 'hadir', '2026-03-12 03:57:35'),
(16, 10, '2026-03-12', '12:10:51', '12:19:46', 'hadir', '2026-03-12 05:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cutis`
--

CREATE TABLE `cutis` (
  `id_cuti` bigint UNSIGNED NOT NULL,
  `id_karyawan` bigint UNSIGNED NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `jenis_cuti` enum('tahunan','sakit','khusus') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tahunan',
  `alasan` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cutis`
--

INSERT INTO `cutis` (`id_cuti`, `id_karyawan`, `tanggal_mulai`, `tanggal_selesai`, `jenis_cuti`, `alasan`, `status`, `created_at`, `approved_at`, `approved_by`) VALUES
(1, 17, '2026-03-11', '2026-03-19', 'tahunan', 'sakit', 'pending', '2026-03-11 09:35:55', '2026-03-12 07:10:41', 17),
(2, 17, '2026-03-19', '2026-03-27', 'sakit', 'testes', 'pending', '2026-03-11 09:50:03', NULL, NULL),
(17, 1, '2026-03-26', '2026-03-29', 'tahunan', 'liburan', 'pending', '2026-03-12 03:08:52', NULL, NULL),
(18, 2, '2026-03-11', '2026-03-12', 'sakit', 'sakit', 'pending', '2026-03-12 03:09:30', NULL, NULL),
(19, 3, '2026-03-31', '2026-04-02', 'khusus', 'Menikah', 'ditolak', '2026-03-12 03:10:13', '2026-03-12 04:47:23', 17),
(20, 4, '2026-03-11', '2026-03-14', 'khusus', 'Liburan ke bali', 'disetujui', '2026-03-12 03:10:54', '2026-03-03 04:41:35', 17),
(22, 10, '2026-03-15', '2026-03-16', 'khusus', 'Liburan', 'pending', '2026-03-12 05:20:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departemens`
--

CREATE TABLE `departemens` (
  `id_departemen` bigint UNSIGNED NOT NULL,
  `nama_departemen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departemens`
--

INSERT INTO `departemens` (`id_departemen`, `nama_departemen`, `created_at`) VALUES
(1, 'HR', '2026-03-11 06:43:36'),
(2, 'Finance', '2026-03-11 06:43:36'),
(3, 'IT', '2026-03-11 06:43:36'),
(4, 'Marketing', '2026-03-11 06:43:36'),
(5, 'Sales', '2026-03-11 06:43:36'),
(6, 'Produksi', '2026-03-11 06:43:36'),
(7, 'R&D', '2026-03-11 06:43:36'),
(8, 'Legal', '2026-03-11 06:43:36'),
(9, 'Customer Service', '2026-03-11 06:43:36'),
(10, 'Logistik', '2026-03-11 06:43:36');

-- --------------------------------------------------------

--
-- Table structure for table `jabatans`
--

CREATE TABLE `jabatans` (
  `id_jabatan` bigint UNSIGNED NOT NULL,
  `nama_jabatan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jabatans`
--

INSERT INTO `jabatans` (`id_jabatan`, `nama_jabatan`, `created_at`) VALUES
(1, 'Direktur', '2026-03-11 06:35:52'),
(2, 'Manager', '2026-03-11 06:35:52'),
(3, 'Supervisor', '2026-03-11 06:35:52'),
(4, 'HR Manager', '2026-03-11 06:35:52'),
(5, 'Staff HR', '2026-03-11 06:35:52'),
(6, 'Staff IT', '2026-03-11 06:35:52'),
(7, 'Programmer', '2026-03-11 06:35:52'),
(8, 'Finance Manager', '2026-03-11 06:35:52'),
(9, 'Staff Finance', '2026-03-11 06:35:52'),
(10, 'Admin', '2026-03-11 06:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawans`
--

CREATE TABLE `karyawans` (
  `id_karyawan` bigint UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_jabatan` bigint UNSIGNED DEFAULT NULL,
  `id_departemen` bigint UNSIGNED DEFAULT NULL,
  `status` enum('aktif','non-aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawans`
--

INSERT INTO `karyawans` (`id_karyawan`, `nama`, `nik`, `email`, `phone`, `id_jabatan`, `id_departemen`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Andi Pratama', '3174010101010001', 'andi.pratama@email.com', '081234567001', 1, 1, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(2, 'Budi Santoso', '3174010101010002', 'budi.santoso@email.com', '081234567002', 2, 1, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(3, 'Citra Lestari', '3174010101010003', 'citra.lestari@email.com', '081234567003', 3, 2, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(4, 'Dedi Kurniawan', '3174010101010004', 'dedi.kurniawan@email.com', '081234567004', 2, 2, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(5, 'Eka Saputra', '3174010101010005', 'eka.saputra@email.com', '081234567005', 4, 3, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(6, 'Fitri Handayani', '3174010101010006', 'fitri.handayani@email.com', '081234567006', 3, 3, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(7, 'Gilang Ramadhan', '3174010101010007', 'gilang.ramadhan@email.com', '081234567007', 1, 2, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(8, 'Hendra Wijaya', '3174010101010008', 'hendra.wijaya@email.com', '081234567008', 4, 1, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(9, 'Intan Permata', '3174010101010009', 'intan.permata@email.com', '081234567009', 3, 2, 'aktif', '2026-03-11 06:12:14', '2026-03-11 06:12:14'),
(10, 'Joko Susilo', '3174010101010010', 'joko.susilo@email.com', '081234567010', 2, 6, 'non-aktif', '2026-03-11 06:12:14', '2026-03-12 01:09:35'),
(17, 'Tahir Wiyan Priyambodo', '1923581891212', 'tahir.wiyan@email.com', '081234567010', 1, 3, 'aktif', '2026-03-11 01:05:59', '2026-03-11 20:42:18'),
(19, 'sumbul', '12312319312', 'sumbul@gmail.com', '08123712731', 10, 10, 'aktif', '2026-03-11 21:12:33', '2026-03-11 21:12:33'),
(20, 'Goku', '1293471234', 'tescuy@Gmail.com', '087123163167', 1, 2, 'aktif', '2026-03-11 22:21:48', '2026-03-11 22:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2026_03_11_024057_create_users_table', 1),
(4, '2026_03_11_024104_create_karyawans_table', 1),
(5, '2026_03_11_024110_create_jabatans_table', 1),
(6, '2026_03_11_024115_create_departemens_table', 1),
(7, '2026_03_11_024120_create_absensis_table', 1),
(8, '2026_03_11_024124_create_cutis_table', 1),
(9, '2026_03_11_030550_create_personal_access_tokens_table', 1),
(10, '2026_03_11_044527_create_sessions_table', 2),
(11, '2026_03_11_070613_create_cache_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `id_karyawan` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin hr','karyawan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'karyawan',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_karyawan`, `name`, `email`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 17, 'Tahir', 'admin@example.com', '$2y$12$zIIypHN1hftNdwg0ITz0Yedw2DzNRxUVsSPT/inqdC7FMZwVVGvri', 'admin hr', 1, '2026-03-11 03:44:56', '2026-03-12 00:43:38'),
(3, 10, 'joko', 'karyawan@example.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 03:44:56', '2026-03-11 23:45:15'),
(4, 1, 'Andi Pratama', 'andi.pratama@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'admin hr', 1, '2026-03-11 06:12:14', NULL),
(5, 2, 'Budi Santoso', 'budi.santoso@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', NULL),
(6, 3, 'Citra Lestari', 'citra.lestari@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', '2026-03-12 00:26:07'),
(7, 4, 'Dedi Kurniawan', 'dedi.kurniawan@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', NULL),
(8, 5, 'Eka Saputra', 'eka.saputra@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', NULL),
(9, 6, 'Fitri Handayani', 'fitri.handayani@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', NULL),
(10, 7, 'Gilang Ramadhan', 'gilang.ramadhan@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'admin hr', 1, '2026-03-11 06:12:14', NULL),
(11, 8, 'Hendra Wijaya', 'hendra.wijaya@email.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', NULL),
(12, 9, 'Intan Permata', 'intan.permata@email1.com', '$2y$12$Wlx1wXDKKWedYX8SYMXj1OassqmltJGLYLecofhldmH1VK0olwirS', 'karyawan', 1, '2026-03-11 06:12:14', '2026-03-12 00:09:39'),
(16, NULL, 'goku', 'goku@gmail.com', '$2y$12$qPEJe8zVq22Minf67Lg3qeLFgFvj.Jcd1OPqHvcFeQgru0XO7YZBq', 'admin hr', 1, '2026-03-12 01:03:53', '2026-03-12 01:03:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensis`
--
ALTER TABLE `absensis`
  ADD PRIMARY KEY (`id_absensi`),
  ADD UNIQUE KEY `absensis_id_karyawan_tanggal_unique` (`id_karyawan`,`tanggal`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `cutis`
--
ALTER TABLE `cutis`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indexes for table `departemens`
--
ALTER TABLE `departemens`
  ADD PRIMARY KEY (`id_departemen`),
  ADD UNIQUE KEY `departemens_nama_departemen_unique` (`nama_departemen`);

--
-- Indexes for table `jabatans`
--
ALTER TABLE `jabatans`
  ADD PRIMARY KEY (`id_jabatan`),
  ADD UNIQUE KEY `jabatans_nama_jabatan_unique` (`nama_jabatan`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawans`
--
ALTER TABLE `karyawans`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD UNIQUE KEY `karyawans_nik_unique` (`nik`),
  ADD UNIQUE KEY `karyawans_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensis`
--
ALTER TABLE `absensis`
  MODIFY `id_absensi` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cutis`
--
ALTER TABLE `cutis`
  MODIFY `id_cuti` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `departemens`
--
ALTER TABLE `departemens`
  MODIFY `id_departemen` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jabatans`
--
ALTER TABLE `jabatans`
  MODIFY `id_jabatan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `karyawans`
--
ALTER TABLE `karyawans`
  MODIFY `id_karyawan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensis`
--
ALTER TABLE `absensis`
  ADD CONSTRAINT `absensis_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawans` (`id_karyawan`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
