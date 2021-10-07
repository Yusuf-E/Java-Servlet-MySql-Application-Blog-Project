-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Ağu 2021, 09:38:43
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`aid`, `name`, `email`, `password`) VALUES
(1, 'Yusuf Efe', 'yusuf@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'Ali Bilir', 'ali@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(3, 'Serkan Bilmem', 'serkan@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(5, 'Erkan Bilmem', 'erkan@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(6, 'Murat Bilir', 'murat@mail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `date` date NOT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `article`
--

INSERT INTO `article` (`id`, `title`, `detail`, `date`, `aid`) VALUES
(1, 'Makale1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-11', 1),
(3, 'Loreesse est hic  a quibusdam repellendus sunt unde voluptate. ipsam magni nihil repellendus sunt suscipit!  quisquam soluta temporibus velit.lorem olor sit amet, consectetur adfugiat hic ipsum tenetur?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-11', 1),
(5, 'Deneme Makale', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-12', 1),
(6, 'Makale Ali Bilmem', 'Makale Ali Bilmem Güncelleme Onaylandi\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-12', 2),
(7, 'Makale 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-12', 2),
(8, 'Makale 3', 'Makale 3 Detay\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-12', 2),
(9, 'Makale 4', 'Makale 4 Detay\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ', '2021-08-12', 2),
(10, 'Makale 5', 'Makale 5 Detay', '2021-08-12', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `contact`
--

INSERT INTO `contact` (`cid`, `name`, `email`, `message`) VALUES
(1, 'Yusuf EFE', 'efeyusuf1999@gmail.com', 'Mesaj 1'),
(2, 'deneme ', 'deneme@mail.com', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet debitis, esse eum fuga fugit illo, laborum maiores nisi nobis odio quisquam, reiciendis sequi ullam ut vel? Magni, necessitatibus!lorem  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque, ea et iure mollitia perferendis quis ratione. Esse fugiat numquam quam reiciendis. Debitis, numquam suscipit. Labore libero perferendis quam suscipit!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores autem delectus dolore est, facere harum impedit ipsum laboriosam libero magni maxime nisi obcaecati pariatur, possimus Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate distinctio exercitationem fugit impedit incidunt officia quisquam velit? Autem ex expedita facilis, mollitia nihil tenetur voluptatibus. Adipisci cum cumque delectus dolorum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab accusantium alias aut commodi error id laudantium libero maiores neque nihil pariatur quisquam rem repellendus sapiente tempore ullam, veritatis Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam aspernatur distinctio dolor error harum id praesentium. Laboriosam quo sapiente vel! Cumque eos esse id ipsa minus pariatur perferendis totam, voluptatibus? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias atque consequuntur eius, eligendi exercitationem, expedita fugit magnam maiores placeat, quidem quo ratione tenetur ut voluptas voluptatem. Aliquam doloremque qui reprehenderit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam consequatur dolorum ipsum nesciunt odit qui, rerum saepe unde veniam voluptas. Ab corporis dolor ex harum ipsa minima perferendis praesentium veniam? voluptas.lorem  quae quos saepe sed ullam?\r\n                    ');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
