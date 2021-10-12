-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 06 月 03 日 05:52
-- 伺服器版本： 10.3.17-MariaDB
-- PHP 版本： 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `phpcart`
--

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) UNSIGNED NOT NULL,
  `categoryname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `categorysort` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`, `categorysort`) VALUES
(1, 'ASUS', 1),
(2, 'ACER', 2),
(3, 'HP', 3),
(4, 'MSI', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderdetailid` int(11) UNSIGNED NOT NULL,
  `orderid` int(11) UNSIGNED DEFAULT NULL,
  `productid` int(11) UNSIGNED DEFAULT NULL,
  `productname` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitprice` int(11) UNSIGNED DEFAULT NULL,
  `quantity` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `orderdetail`
--

INSERT INTO `orderdetail` (`orderdetailid`, `orderid`, `productid`, `productname`, `unitprice`, `quantity`) VALUES
(1, 1, 16, 'MSI微星 GT63 9SG-067TW', 79900, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) UNSIGNED NOT NULL,
  `total` int(11) UNSIGNED DEFAULT NULL,
  `deliverfee` int(11) UNSIGNED DEFAULT NULL,
  `grandtotal` int(11) UNSIGNED DEFAULT NULL,
  `customername` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customeremail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customeraddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customerphone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paytype` enum('ATM匯款','線上刷卡','貨到付款') COLLATE utf8_unicode_ci DEFAULT 'ATM匯款'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`orderid`, `total`, `deliverfee`, `grandtotal`, `customername`, `customeremail`, `customeraddress`, `customerphone`, `paytype`) VALUES
(1, 79900, 0, 79900, 'HanksCheng(TEST)', 'hank881204@gmail.com', 'Taiwan R.O.C. Taichung city', '0911111111', '貨到付款');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `productid` int(11) UNSIGNED NOT NULL,
  `categoryid` int(11) UNSIGNED NOT NULL,
  `productname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productprice` int(11) UNSIGNED DEFAULT NULL,
  `productimages` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`productid`, `categoryid`, `productname`, `productprice`, `productimages`, `description`) VALUES
(1, 1, 'ASUS VivoBook X412FL 星空灰', 27900, 'ASUS1.jpg', '◆ LCD尺寸：14\"FHD 1920*1080 IPS霧面寬螢幕 (LED) 四邊窄邊框設計\r\n◆ 處理器：Intel® Core™ i5-10210U Processor 1.6 GHz\r\n◆ 記憶體：4GB*1 DDR4 2400 (Max. 12G)\r\n◆ 硬碟：1TB+ PCIEG3x2 NVME 256GB M.2 SSD\r\n◆ 獨立顯卡：Nvidia GeForce MX 250 2G獨顯\r\n◆ 網路：Wi-Fi 5(802.11ac)+Bluetooth 4.2 (Dual band) 2*2\r\n◆ 重量：1.5 KG\r\n◆ 特色：USB 3.1 Type C、發光鍵盤、87%屏佔比\r\n◆ 作業系統： 64 Bits Windows 10 Home'),
(2, 1, 'ASUS E406MA-0151BN4100 星空灰', 8990, 'ASUS2.jpg', '◆ 處理器：Intel® Celeron® N4100\r\n◆ 記憶體：DDR3 4GB\r\n◆ 容量：64G EMMC\r\n◆ LCD尺寸：14\"FHD 1920*1080 霧面寬螢幕 (LED)\r\n◆ 無線網路：802.11ac + Bluetooth 4.1 (Dual band) 1*1\r\n◆ IO PORT：HDMI、USB 3.0\r\n◆ 重量：1.3KG\r\n◆ 作業系統：Windows 10 Home S (S模式) 附贈Mircosoft office365 個人版一年(市價2190元)\r\n◆ 保固：二年全球保固/首年完美保固'),
(3, 1, 'ASUS VivoBook S15 S533FL幻彩白', 30900, 'ASUS3.jpg', '◆ LCD尺寸：15.6\" FHD 1920*1080 四邊窄邊框設計\r\n◆ 處理器：Intel® Core™ i5-10210U 1.6 GHz\r\n◆ 記憶體：8GB DDR4 on board\r\n◆ 顯卡：Nvidia MX 250 2G獨顯\r\n◆ 硬碟：\"512GB M.2 NVMe™ PCIe® SSD with 32GB ◆ Intel® Optane™ Memory\r\n◆ 網路：Wi-Fi 6(Gig+)(802.11ax)+Bluetooth 5.0 (Dual band) 2*2\r\n◆ 重量：1.8 KG\r\n◆ 特色：含背光KB.具數字鍵、USB3.1 Type C、HDMI\r\n◆ 作業系統： 64 Bits Windows 10 Home'),
(4, 1, 'ASUS TP202NA-0101KN3350 星空灰', 8800, 'ASUS4.jpg', '◆ LCD尺寸：11.6\" HD 1920*1080 觸控螢幕\r\n◆ 處理器：Intel® Dual-Core Celeron® N3350\r\n◆ 記憶體：DDR3 4GB\r\n◆ 硬碟：EMMC 64GB\r\n◆ 網路：802.11AC/Bluetooth 4.1\r\n◆ 重量：1.27 KG\r\n◆ 特色：HDMI、USB 3.0\r\n◆ 作業系統： Windows 10 HOME S (64bit) (S模式)\r\n◆ 保固：一年全球保固/首年完美保固'),
(5, 1, 'ASUS ZenBook 15 UX534FTC 皇家藍', 57900, 'ASUS5.jpg', '◆ LCD尺寸：15.6’’ 4K UHD 3840X2160 16:9\r\n◆ 處理器：Intel® Core™ i7-10510U 1.8 GHz\r\n◆ 記憶體：LDDR3 16G 2133\r\n◆ 顯卡：NVIDIA GeForce GTX1650 MAX Q 4G獨顯\r\n◆ 硬碟：PCIEG3x4 NVME 1TB M.2 SSD\r\n◆ 其他：搭配ScreenPad 2.0、發光KB、17小時電續航力\r\n◆ 重量：1.65kg\r\n◆ 網路：802.11ac+Bluetooth 5.0\r\n◆ 作業系統： 64 Bits Windows 10 Home\r\n◆ 保固：2年全球保固 LCD無亮點保固'),
(6, 2, 'ACER 14吋輕薄筆電SF514-53T-73HN 星空藍', 31900, 'ACER1.jpg', '◆ LCD尺寸：14\" FHD 1920*1080/IPS/鏡面/觸控/LED背光\r\n處理器：Intel® Core™ i7-8565U (1.80 GHz/4.60 GHz)\r\n◆ 顯示晶片：Intel® UHD Graphics 620\r\n◆ 記憶體：8GB DDR4 (Onboard)\r\n◆ 硬碟：512GB PCIe SSD (Onboard)\r\n◆ 無線網路：802.11a/b/g/n/ac 2x2 MU-MIMO、藍芽5.0\r\n◆ IO PORT：USB3.1、USB3.0、HDMI\r\n◆ 軟體：Windows 10'),
(7, 2, 'ACER SF114-32-C53W 玫瑰金', 13900, 'ACER2.jpg', '◆ 處理器：Intel® Celeron® N4100 (1.1GHz/2.4GHz)\r\n◆ 顯示晶片：Intel® UHD Graphics 600\r\n◆ 記憶體：4GB DDR4(Onboard)\r\n◆ 硬碟：256GB PCIe NVMe SSD\r\n◆ 螢幕：14\" 1920*1080 FHD/霧面/LED背光\r\n◆ 無線網路：802.11a/b/g/n/ac、2x2 MU-MIMO、BT 5.0\r\n◆ 其他：USB3.1*1、USB3.0*2、USB2.0*1、HDMI\r\n◆ 軟體：Windows 10 Home'),
(8, 2, 'Acer SF314-57G-54DY 14吋輕薄窄邊筆電 玫瑰金', 27900, 'ACER3.jpg', '◆ 處理器：Intel® Core™ i5-1035G1(1.00 GHz/3.60 GHz)\r\n◆ 顯示晶片：NVIDIA® GeForce® MX250 2GB GDDR5 VRAM\r\n◆ 記憶體：8GB LPDDR4 (Onboard)\r\n◆ 硬碟：512GB PCIe NVMe SSD\r\n◆ 螢幕：14\" 1920*1080 FHD/霧面/LED背光/IPS\r\n◆ 無線網路：802.11a/b/g/n/acR2+ax\r\n2x2 MU-MIMO、Bluetooth® 5.0\r\n◆ IO PORT：Thunderbolt3、USB3.1、HDMI\r\n◆ 其他：支援指紋辨識\r\n◆ 軟體：Windows 10 Home\r\n◆ 重量：1.19kg'),
(9, 2, 'Acer SF514-54GT 14吋輕薄筆電 星耀藍', 40900, 'ACER4.jpg', '◆ 處理器：Intel® Core™ i7-1065G7(1.30 GHz/3.90 GHz)\r\n◆ 顯示晶片：NVIDIA® GeForce® MX250 2GB GDDR5 VRAM\r\n◆ 記憶體：16GB LPDDR4X (Onboard)\r\n◆ 硬碟：512GB PCIe NVMe SSD\r\n◆ 螢幕：14\" FHD1920*1080/霧面/LED背光/IPS/觸控\r\n◆ 無線網路：802.11a/b/g/n/acR2+ax\r\n2x2 MU-MIMO、Bluetooth® 5.0\r\n◆ IO PORT：Thunderbolt3、USB3.1、HDMI\r\n◆ 軟體：Windows 10 Home\r\n◆ 重量：0.99 kg'),
(10, 2, 'ACER  TravelMate TMX514-51-53TL', 29900, 'ACER5.jpg', '◆ 螢幕：14’’ FHD 1920*1080 IPS (LED背光)霧面\r\n◆ 處理器：Intel® CoreTM i5-8265U\r\n◆ 記憶體：8GB DDR4 (Onboard)\r\n◆ 硬碟：256GB PCIe SSD,保留1個M.2 SSD PCIe 插槽可自行加裝\r\n◆ 顯示晶片：Intel® UHD Graphics 620\r\n◆ 無線網路：802.11a/b/g/n/ac\r\n◆ IO PORT：HDMI、USB3.1 Type-C Gen1 x1\r\nUSB3.1 Type-A Gen1 x 2 (w/ one featuring power-off USB charging)\r\n◆ 作業系統：Windows 10\r\n◆ 保固：台灣3年,1年國際旅約'),
(11, 3, 'HP Pavilion Gaming 15-dk0229TX', 22900, 'HP1.jpg', '◆ LCD尺寸：15.6\" FHD WLED (1920x1080)\r\n◆ 處理器:9th Gen Intel Core i5-9300H\r\n◆ 記憶體:4Gx1 DDR4 2666\r\n◆ 硬碟:1TB(5400)\r\n◆ 顯卡:Nvidia GeForce GTX 1050 4GB DDR5\r\n◆ 喇叭/音效技術:B&O Play / HP Audio Boost / Dual Speakers\r\n◆ 作業系統:Windows 10\r\n◆ 保固服務:第一年國際有限保固(包含零件與人工)/ 第一年台灣本島到府收送'),
(12, 3, 'HP Pavilion 15-cs2007TX ', 21990, 'HP2.jpg', '◆ 處理器：8th Intel Core i5-8265U\r\n◆ 記憶體：4Gx1 DDR4 2400 / 2 / 16G\r\n◆ 硬碟機：256GB PCIe SSD+1TB\r\n◆ 繪圖晶片:Nvidia GeForce MX250 2GB DDR5\r\n◆ 螢幕尺寸：15.6\" FHD WLED (1920x1080)\r\n◆ 作業系統：Windows 10\r\n◆ 保固：第一年國際有限 + 第二年台灣保固(包含零件與人工) / 一年台灣本島到府收送'),
(13, 3, 'HP Pavilion x360 14-dh1037TX 冰曜銀', 22990, 'HP3.jpg', '◆ 螢幕:14.0\" FHD WLED (1920x1080) 窄邊框超廣角螢幕\r\n◆ 處理器:10th Gen Intel Core i3-10110U\r\n◆ 記憶體:4Gx1 DDR4 2666 / 2 / 16G\r\n◆ 硬碟:256GB PCIe NVMe M.2 SSD\r\n◆ 顯卡:Nvidia GeForce MX130 2GB DDR5\r\n◆ 喇叭/音效技術:B&O Play / Dual Speakers / Support HP Audio Boost\r\n◆ 作業系統:Windows 10\r\n◆ 保固服務:第一年國際有限保固(包含零件與人工)+第二年台灣地區保固 / 第一年台灣本島到府收送'),
(14, 3, 'HP 348 G7', 33900, 'HP4.jpg', '◆ 處理器：9th Gen.Intel Core:i7-10510U\r\n◆ 記憶體：16GB x1 DDR4 2666\r\n◆ 硬碟：512GB PCIe SSD\r\n◆ 繪圖晶片：獨立顯卡 AMD Radeon RX530-2GB\r\n◆ 螢幕：14.0吋 LED 背光 FHD(1920 x 1080), 超廣角 / 防眩光\r\n◆ 作業系統：Windows 10 Pro\r\n◆ 保固：2年國際保+意外損害保護(ADP)/第一年台灣地區到府收送(限本島)'),
(15, 3, 'HP ENVY 13-aq1017TU 璀璨銀', 34900, 'HP5.jpg', '◆ 處理器：10th Gen Intel Core i5-10210U\r\n◆ 記憶體：8GB(on-board) DDR4 2400 / 0 / 16G (無法升級)\r\n◆ 硬碟：512G PCIe NVMe SSD\r\n◆ 螢幕：13.3\"FHD WLED (1920x1080) UWVA 超廣角螢幕\r\n◆ 喇叭：BANG & OLUFSEN Audio + Quad Speakers\r\nSupport HP Audio Boost 2.0 (w/discrete amplifier)\r\n◆ 特色：微邊框鏡面 背光鍵盤\r\n◆ 重量：1.27kg起\r\n◆ 作業系統：Windows 10\r\n◆ 保固：二年保固(第一年國際有限保固, 第二年台灣地區保固(包含零件與人工) / 一年台灣本島到府收送'),
(16, 4, 'MSI微星 GT63 9SG-067TW', 79900, 'MSI1.jpg', '◆ 處理器：Intel 第9代 Core i7-9750H 六核心處理器\r\n◆ 主機板晶片組：Intel HM370\r\n◆ 記憶體：32GB (16G*2) DDR4-2666\r\n◆ 顯示晶片規格：GeForce RTX2080,GDDR6 8GB\r\n◆ 固態硬碟：512GB NVMe PCIe SSD\r\n◆ 硬碟：1TB 2.5吋 7200轉 HDD\r\n◆ 光碟機：無\r\n◆ 作業系統：Windows 10 Pro\r\n◆ 解析度:4K UHD\r\n◆ 尺寸:15.6\"\r\n◆ 保固：2年\r\n◆ 電池供應 : 8-Cell / 330W adapter'),
(17, 4, 'MSI微星 GP75 10SFK-008TW 黑', 56900, 'MSI2.jpg', '◆ 處理器：Intel 第10代 Core i7-10750H 六核心處理器\r\n◆ 主機板晶片組：Intel HM470\r\n◆ 記憶體：8GB (8G*1) DDR4-2666\r\n◆ 顯示晶片規格：GeForce RTX2070 GDDR6 8GB\r\n◆ 固態硬碟：512GB NVMe PCIe M.2 SSD\r\n◆ 硬碟：1TB SATA HDD 7200rpm\r\n◆ 光碟機：無,請另購外接式光碟機\r\n◆ 作業系統：Windows 10\r\n◆ 解析度:FHD 1920*1080\r\n◆ 尺寸:17.3\"\r\n◆ 保固：2年\r\n◆ 電池供應 : 6-Cell\r\n◆ 變壓器 : 230W adapter'),
(18, 4, 'MSI微星 GP65 10SEK-008TW 黑', 47900, 'MSI3.jpg', '◆ 處理器：Intel 第10代 Core i7-10750H 六核心處理器\r\n◆ 主機板晶片組：Intel HM470\r\n◆ 記憶體：8GB (8G*1) DDR4-2666\r\n◆ 顯示晶片規格：GeForce RTX2060 GDDR6 6GB\r\n◆ 固態硬碟：512GB NVMe PCIe M.2 SSD\r\n◆ 硬碟：1TB SATA HDD 7200rpm\r\n◆ 作業系統：Windows 10\r\n◆ 解析度:FHD 1920*1080\r\n◆ 尺寸:15.6\"\r\n◆ 保固：2年\r\n◆ 電池供應 : 6-Cell\r\n◆ 變壓器 : 230W adapter');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- 資料表索引 `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`orderdetailid`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `orderdetailid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
