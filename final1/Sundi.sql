CREATE DATABASE  IF NOT EXISTS `Sundi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE Sundi;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: morning
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `member`
--

#會員
DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `username` varchar(20) NOT NULL UNIQUE,
  `birthday` DATE NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(40),
  PRIMARY KEY (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES 
('user1','1980-01-01','0123456789','user1@example.com','password1',''),
('user2','1981-02-02','0123456788','user2@example.com','password2',''),
('user3','1982-03-03','0123456787','user3@example.com','password3',''),
('user4','1983-04-04','0123456786','user4@example.com','password4','');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

#購物車
DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `productID` int NOT NULL,
  `orderQ` int NOT NULL,
  
  PRIMARY KEY (`cartID`),
  FOREIGN KEY (`email`) REFERENCES `member`(`email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`email`, `productID`, `orderQ`) VALUES 
('user1@example.com',2,4),
('user2@example.com',1,1),
('user3@example.com',3,3),
('user4@example.com',7,6);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `delivery_methods`
--

#取貨方式
DROP TABLE IF EXISTS `delivery_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_methods` (
  `deliveryID` int NOT NULL AUTO_INCREMENT,
  `deliveryname` varchar(20) NOT NULL,
  
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_methods`
--
LOCK TABLES `delivery_methods` WRITE;
/*!40000 ALTER TABLE `delivery_methods` DISABLE KEYS */;
INSERT INTO `delivery_methods` (`deliveryname`) VALUES 
('7-11超商取貨'),
('全家超商取貨'),
('宅配到府');
/*!40000 ALTER TABLE `delivery_methods` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `payment_methods`
--


#付款方式
DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(20) NOT NULL,
  
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` (`paymentname`) VALUES 
('信用卡線上刷卡'),
('貨到付款(超商)'),
('貨到付款(宅配)'),
('超商代碼繳費'),
('銀聯卡');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_codes`
--

#優惠券代碼
DROP TABLE IF EXISTS `discount_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_codes` (
  `dcode` varchar(6) NOT NULL,
  `discount` varchar(6) NOT NULL,
  
  PRIMARY KEY (`dcode`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `discount_codes`
--

LOCK TABLES `discount_codes` WRITE;
/*!40000 ALTER TABLE `discount_codes` DISABLE KEYS */;
INSERT INTO `discount_codes` VALUES ('hi0001','10%');
/*!40000 ALTER TABLE `discount_codes` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `orders`
--

#訂單
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `delivery` varchar(20) NOT NULL,
  `payment` varchar(20) NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `dcode` varchar(6),
  `order_date` DATE,
  PRIMARY KEY (`orderID`),
  FOREIGN KEY (`username`) REFERENCES `member`(`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`username`, `telephone`, `address`, `delivery`, `payment`, `total`, `dcode`, `order_date`) VALUES 
('user1','0123456789','Address 1',1,1,400.00,'hi0001','2024-05-01'),
('user2','0123456788','Address 2',2,2,180.00,NULL,'2024-05-02'),
('user3','0123456787','Address 3',3,3,250.00,NULL,'2024-05-03'),
('user4','0123456786','Address 4',1,1,105.00,NULL,'2024-05-04');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail` (
	`detailID` int NOT NULL AUTO_INCREMENT,
    `email` varchar(40),
	`productName` varchar(20),
    `orderQ` int,
    `tm` int,
    `order_date` DATE,
	PRIMARY KEY (`detailID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



--
-- Table structure for table `products`
--

#商品
DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client  = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `description1` varchar(45) NOT NULL,
  `description2` varchar(45) NOT NULL,
  `description3` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `inventory` int NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'果醬','酸甜百香果醬','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>果醬開封後需冷藏，開封後請於一個月內食用完畢','酸甜百香蘋果醬 : 挑選自埔里的百香果搭配富士蘋果','這款酸甜百香蘋果醬，結合了鮮甜蘋果與熱帶百香果的獨特風味。每一口都充滿豐富的果香與適中的酸甜平衡，帶來令人耳目一新的美味體驗<br>無論是抹在麵包上、搭配優格，還是作為甜品的配料，都能讓您的餐點更添色彩。',180,24,1);
INSERT INTO `product` VALUES (2,'果醬','手工荔枝果醬','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>果醬開封後需冷藏，開封後請於一個月內食用完畢','手工荔枝果醬 : 屏東枋寮玉荷包荔枝','每到夏天，荔枝與芒果是必吃不可的兩樣珍饈水果，尤其又以甜美凝脂的玉荷包荔枝最令人傾心不已。<br>採用屏東枋寮自然栽種的玉荷包荔枝製作果醬，果肉厚實多汁，還帶著隱約花香，最適合在荔枝缺席的日子裡，回味它那迷人又華麗的風味。',250,20,1);
INSERT INTO `product` VALUES (3,'果醬','紅石榴果醬 ','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>果醬開封後需冷藏，開封後請於一個月內食用完畢','紅石榴果醬 : 選自土耳其的紅寶石','這款紅石榴果醬，採用新鮮多汁的紅石榴製作，保留其天然的酸甜風味與豐富的營養。每一口都散發著濃郁的果香與微酸的口感，為您的味蕾帶來極致的享受<br>適合搭配麵包、優格或用於各種甜品，增添一道健康美味的亮點。無添加人工色素和防腐劑，讓您安心享受純天然的美好滋味。',360,23,1);
INSERT INTO `product` VALUES (4,'果醬','香濃巧克力抹醬','通過SGS檢驗合格，無添加香料、人工色素、防腐劑<br>本產產含有牛奶、大豆，過敏者請勿食用','香濃巧克力抹醬 : 取自非洲迦納可可豆','製程講究健康，嚴選高品質的天然原料，「無人工香料、色素、無防腐劑、無農藥殘留、無抗氧化劑」。<br>我們的抹醬低甜味、口感滑順、香醇滋味，讓您在享受幸福美味的同時也能吃的健康、無負擔。',200,20,1);
INSERT INTO `product` VALUES (5,'果醬','椰香奶酥抹醬','通過SGS檢驗合格，無添加香料、人工色素、防腐劑<br>本產產含有牛奶、大豆，過敏者請勿食用','椰香奶酥抹醬 :	精選自泰國的椰子，融合濃郁奶香','我們的抹醬，融合濃郁椰香與奶香，帶來絲滑細膩的口感與獨特的熱帶風情。<br>無論抹在麵包上、搭配餅乾，還是作為甜品的點綴，都能讓您的每一口充滿愉悅與驚喜。<br>純天然製作，無添加人工色素與防腐劑，讓您安心享受健康美味。',250,31,1);
INSERT INTO `product` VALUES (6,'果醬','顆粒花生抹醬','通過SGS檢驗合格，無添加香料、人工色素、防腐劑<br>保證100%純天然<br>本產含有花生，如對花生過敏者請勿食用','顆粒花生抹醬 : 嚴選自北港的花生','綿密細緻的花生醬適合全家人食用，一打開就能聞到濃濃的花生味。<br>保證真材實料純天然無添加物，無論是搭配吐司或者各式點心皆適合',230,30,1);
INSERT INTO `product` VALUES (7,'果乾','乾燥洛神花乾','通過SGS檢驗合格，無添加香料、人工色素、防腐劑<br>保證100%純天然<br>不使用化學農藥栽種，消費者可安心食用','乾燥洛神花乾 : 取自台東在地的洛神花','這款乾燥洛神花乾，選用新鮮洛神花經過精心乾燥處理，保留其獨特的酸甜風味與鮮豔色澤。<br>可用於泡茶、製作甜品，為您的飲食增添一抹亮麗與健康。<br>富含天然抗氧化物質，無添加人工色素與防腐劑，讓您享受純淨自然的美好滋味。',130,32,1);
INSERT INTO `product` VALUES (8,'果乾','有機蔓越莓乾','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>不使用化學農藥栽種，消費者可安心食用','有機蔓越莓乾 : 取自美國的蔓越莓','大自然的紅寶石，100%純天然無色素，不添加色素、防腐劑，<br>每一口都滿莓果香，酸酸甜甜滋味讓你一口接著一口，感受戀愛的滋味',310,30,1);
INSERT INTO `product` VALUES (9,'果乾','愛文芒果乾','通過SGS檢驗合格，無添加色素、防腐劑<br>本產品含有芒果，不適合其過敏體質者食用','愛文芒果乾:取自台灣在地的愛文芒果','來自日照充足的台灣南島，帶有風味出眾的濃郁香氣，醒目的深紅色外皮搭配亮麗的黃色 果肉尤為特別，是款好吃又美麗的水果。我們以低溫烘烤製作，並且無添加任何色素、防腐劑，將來自南島的熱情以最自然的好滋味送到您口中。',180,33,1);
INSERT INTO `product` VALUES (10,'果乾','珍珠開心果','通過SGS檢驗合格，無添加香料、人工色素、防腐劑<br>保證100%純天然<br>本產品為堅果類，如對堅果過敏者請勿食用','珍珠開心果 : 取自美國的開心果','這款開心果，精選優質果實，經過精細烘焙，保留其天然的香脆與獨特的風味。<br>無添加人工色素和防腐劑，讓您品嚐到最純正的健康零食。<br>無論是日常小吃還是聚會分享，都能為您的生活增添一份開心與美味。',360,30,1);
INSERT INTO `product` VALUES (11,'果乾','頂級無調味核桃','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>如對堅果過敏者請勿食用','頂級無調味核桃 : 選自美國加州的核桃','這款核桃，經過精心處理，保留其天然的香氣與酥脆口感。純粹原味，無添加任何調味料，讓您享受最自然健康的美味。<br>無論作為零食，還是加入料理或烘焙，都能帶來豐富的營養與美味體驗。',240,31,1);
INSERT INTO `product` VALUES (12,'果乾','低溫烘焙原味腰果','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>本產品為堅果類，如對堅果過敏者請勿食用','低溫烘焙原味腰果 : 取自越南的新鮮腰果 ','這款低溫烘焙原味腰果，精選上等腰果，富含蛋白質，自帶微甜口感，<br>我們採用低溫烘培技術，不添加油、防腐劑、調味料等，每日新鮮烘培，讓您吃得安心，健康低負擔。',330,40,1);
INSERT INTO `product` VALUES (13,'禮盒','豐作雙果茶醬禮盒','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然','豐作雙果茶醬禮盒 : 嚴選自台灣本地的新鮮水果鮮釀而成','果茶醬相對於果醬，是不加「膠體」的，所以更天然，狀態更為流動，<br>可以塗抹也可以沖泡 ，不僅能直接沖泡做成水果茶，略為流動的狀態反而在塗抹上會被麵包體吸收更多水果風味，讓滋味會更融合、順口。<br>我們的果醬原料僅有水果、砂糖、檸檬汁，透過配方與製程調整，讓水果釋放出自身的原生果膠，吃素的朋友也能安心食用！',760,35,1);
INSERT INTO `product` VALUES (14,'禮盒','莓好食光禮盒','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然','莓好時光禮盒 :  選自台灣在地的無毒草莓','果醬使用南投國姓農場的無毒草莓，無人工添加物，吃得到一整顆果粒，<br>果乾採用台灣在地契作無農藥草莓，每一口都保留草莓原始的自然酸甜',880,28,1);
INSERT INTO `product` VALUES (15,'禮盒','綜合堅果禮盒','通過SGS檢驗合格，無添加香料、人工色素、防腐劑保證100%純天然<br>本產品為堅果類，如對堅果過敏者請勿食用','綜合堅果禮盒 : 清香自然綜合堅果 補足營養素','精選了六種營養元素豐富的堅果種類，有杏仁果、腰果、核桃、夏威夷豆、胡桃、榛果，<br>其中杏仁果、腰果、核桃、榛果更是並列為世界四大堅果，一次補充人體所需各種營養元素，吃出簡單，天然好吃低負擔健康養生又涮嘴。',480,41,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--
#商品圖片
DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `productID` int NOT NULL,
  `img_url` varchar(330) NOT NULL,
  PRIMARY KEY (`image_id`),
  FOREIGN KEY (`productID`) REFERENCES `product`(`productID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` (`productID`, `img_url`) VALUES
(1,'https://i.pinimg.com/originals/7e/6a/bc/7e6abc4172c132cc4b2697f025d5ee6e.png'),
(1,'https://i.pinimg.com/564x/56/7a/35/567a3522b5ea69d888453beca5fb3019.jpg'),
(1,'https://i.pinimg.com/564x/58/11/c0/5811c011b59e68197587684fecdb08fc.jpg'),
(1,'https://plus.unsplash.com/premium_photo-1695635230516-e69891d27488?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(2,'https://i.pinimg.com/originals/a5/6a/39/a56a3949d3eae1b3bae27cf44e570fd2.png'),
(2,'https://i.pinimg.com/564x/c2/03/02/c203023a9d4a9481951586d02c9d2460.jpg'),
(2,'https://i.pinimg.com/564x/ae/8a/6b/ae8a6bbf537f01ede803419dcb679295.jpg'),
(2,'https://images.unsplash.com/photo-1594151820883-f09a7a4246fe?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(3,'https://i.pinimg.com/originals/5f/81/91/5f8191134e9b8bdaf01425d0edfdebf3.png'),
(3,'https://i.pinimg.com/564x/d5/62/08/d56208d2f27571d65be21ce994eb0eb2.jpg'),
(3,'https://i.pinimg.com/564x/98/00/d9/9800d96a1caa258a794ecb53938af0e5.jpg'),
(3,'https://images.unsplash.com/photo-1541344999736-83eca272f6fc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(4,'https://i.pinimg.com/originals/bf/da/1c/bfda1cea8236814eee52f2e920003bf7.png'),
(4,'https://www.bamix.com.tw/wp-content/uploads/2024/01/image10.png'),
(4,'https://storage.googleapis.com/www-cw-com-tw/article/202302/article-63eb4f7005b66.jpg'),
(4,'https://images.unsplash.com/photo-1590080875852-ba44f83ff2db?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(5,'https://i.pinimg.com/originals/32/5e/76/325e76f7907ea438fe543e0c5339fe57.png'),
(5,'https://i.pinimg.com/564x/13/bd/a3/13bda30b672cc96c16eb7d6f1f8c4d1a.jpg'),
(5,'https://i.pinimg.com/564x/ef/75/bf/ef75bf83260cc53a3c98c53ebbb4366f.jpg'),
(5,'https://images.unsplash.com/photo-1590449849263-be1af5ee20c4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(6,'https://i.pinimg.com/originals/a4/fc/01/a4fc0159695796fe3688dae512dac1de.png'),
(6,'https://i.pinimg.com/564x/63/16/71/631671a39cfcf7c8495c242eb84f3f8c.jpg'),
(6,'https://i.pinimg.com/564x/75/a1/c2/75a1c2ee367f3afb08d56a150efe9b77.jpg'),
(6,'https://plus.unsplash.com/premium_photo-1701210417948-1daa5c627fa8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(7,'https://i.pinimg.com/originals/a3/cb/87/a3cb87f4204f473f4cf7e1d7963180fe.png'),
(7,'https://image-cdn-flare.qdm.cloud/q6bbba5e1cac1a/image/data/2018/11/20/2282217e8451f0da9219c86746a5960f.jpg'),
(7,'https://yotasteshop.com/yotaste_web/upload/prod_file/tinymce/2023/Roselle%20tea-1.jpg'),
(7,'https://www.yotaste.com/ckfile/images/IMG_3215.jpg'),

(8,'https://i.pinimg.com/originals/57/ab/38/57ab38773de5689888bf24023b13136c.png'),
(8,'https://wacaimg.waca.net/uploads/shops/33287/products/27/27c46cfd76b91bea14468a54ccfaa80e.jpg'),
(8,'https://thegreatestdietician.com/wp-content/uploads/2020/12/M_20201209_F.jpg'),
(8,'https://images.unsplash.com/photo-1634484390190-b5ef8f3a9eef?q=80&w=2051&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(9,'https://i.pinimg.com/originals/24/bb/61/24bb61d269612eb6e0c0d8ff04b763c0.png'),
(9,'https://image-cdn-flare.qdm.cloud/q63b274a781343/image/data/product/%E6%9E%9C%E4%B9%BE/%E8%8A%B3%E8%88%88/%E6%84%9B%E6%96%87%E8%8A%92%E6%9E%9C%E4%B9%BE/%E8%B6%85%E9%A6%99%E7%94%9C%E5%AB%A9Q%E5%A5%BD%E5%90%83%E7%9A%84%E6%84%9B%E6%96%87%E8%8A%92%E6%9E%9C%E4%B9%BE%E6%8E%A8%E8%96%A6_%E5%AE%B6%E5%AE%B6%E8%A1%8C%E9%8A%B7_p1-2.jpg'),
(9,'https://s.yimg.com/zp/images/75BF6DBB0041CC463DA9DBE2754A47D56E46D036'),
(9,'https://www.freemart.com.tw/file_manager/uimage/ufile/images/bsn2143/page_17.jpg'),

(10,'https://i.pinimg.com/originals/0f/9a/bd/0f9abd83ae2d891e6f596117ca0f1b01.png'),
(10,'https://st2.depositphotos.com/3912767/5589/i/450/depositphotos_55898801-stock-photo-pistachios-with-and-without-shell.jpg'),
(10,'https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2018/12/30/1/5727511.jpg&x=0&y=8&sw=1206&sh=804&s=Y&exp=3600'),
(10,'https://images.unsplash.com/photo-1502825751399-28baa9b81efe?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(11,'https://i.pinimg.com/originals/f1/2f/45/f12f45ec0d88beddba4646a9887260b9.png'),
(11,'https://cmuh.cmu.edu.tw//FileUploads/News/20210224_173408.jpg'),
(11,'https://www.healthcarehk.org/wp-content/uploads/2019/12/%E6%A0%B8%E6%A1%83%E4%BB%81b.jpg'),
(11,'https://images.unsplash.com/photo-1597919926165-9a7a0829ecaa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(12,'https://i.pinimg.com/originals/0c/50/b4/0c50b4314bb05c7b31601a2f5d52606d.png'),
(12,'https://shoplineimg.com/5d1ec792f7124400016c3c2d/65f90ac59f0f5a0011708485/800x.webp?source_format=jpg'),
(12,'https://hips.hearstapps.com/hmg-prod/images/roasted-cashews-royalty-free-image-1704446239.jpg?crop=1xw:1xh;center,top&resize=980:*'),
(12,'https://images.unsplash.com/photo-1627820752174-acae1b399128?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

(13,'https://cdn.store-assets.com/s/185492/i/32153650.jpg?width=1024&format=webp'),
(13,'https://cdn.store-assets.com/s/185492/i/32153654.jpg?width=1024&format=webp'),
(13,'https://cdn.store-assets.com/s/185492/i/32153655.jpg?width=1024&format=webp'),
(13,'https://cdn.store-assets.com/s/185492/i/32153655.jpg?width=1024&format=webp'),

(14,'https://s.yimg.com/zp/MerchandiseImages/BBB8EBF84C-SP-7586841.jpg'),
(14,'https://s.yimg.com/zp/MerchandiseImages/22DD0BA026-SP-7103046.jpg'),
(14,'https://superbuy-hifamily.cdn.hinet.net/superbuy_admin/images/product/751/00PL517_main.webp?2024042411'),
(14,'https://superbuy-hifamily.cdn.hinet.net/superbuy_admin/upload/images/517/0s7a4749-irr.png'),

(15,'https://shoplineimg.com/5d1ec792f7124400016c3c2d/65fbcca790fef40023757086/800x.webp?source_format=jpg'),
(15,'https://www.thankyounuts.com/wp-content/uploads/2020/09/1000x1000_20201205-1.jpg'),
(15,'https://www.thankyounuts.com/wp-content/uploads/2022/07/1117x1117_20220625.jpg'),
(15,'https://plus.unsplash.com/premium_photo-1674076592971-716676c4ba9c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D+');

/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

ALTER TABLE `product_images` DROP FOREIGN KEY `product_images_ibfk_1`;
ALTER TABLE `product_images` ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product`(`productID`) ON DELETE CASCADE;

#後臺帳號
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `admin` (`email`, `password`) VALUES ('admin@gmail.com', 'admin123');

DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `count` int NOT NULL,
  PRIMARY KEY (`count`)
);

INSERT INTO `counter`VALUES (0);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE OR REPLACE VIEW cart_view AS 
SELECT 
    cart.cartID, 
    cart.email, 
    product_images.img_url, 
    product.productName, 
    cart.orderQ, 
    product.price * cart.orderQ AS tm 
FROM 
    Sundi.cart
JOIN 
    Sundi.product ON cart.productID = product.productID
JOIN 
    (
        SELECT productID, img_url
        FROM Sundi.product_images
        WHERE (productID, image_id) IN (
            SELECT productID, MIN(image_id)
            FROM Sundi.product_images
            GROUP BY productID
        )
    ) AS product_images ON product_images.productID = cart.productID;
    
    
    
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `email` varchar(40) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `rating` int NOT NULL,
  `review_date` DATE,
  PRIMARY KEY (`review_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`productID`),
  FOREIGN KEY (`email`) REFERENCES `member`(`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('1','user1@example.com','這是標題1','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('2','user1@example.com','這是標題2','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('3','user1@example.com','這是標題3','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('4','user1@example.com','這是標題4','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('5','user1@example.com','這是標題5','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('6','user1@example.com','這是標題6','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('7','user1@example.com','這是標題7','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('8','user1@example.com','這是標題8','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('9','user1@example.com','這是標題9','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('10','user1@example.com','這是標題10','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('11','user1@example.com','這是標題11','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('12','user1@example.com','這是標題12','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('13','user1@example.com','這是標題13','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUES ('14','user1@example.com','這是標題14','這是內容','3','2024-05-04');
INSERT INTO `product_reviews` (`product_id`, `email`, `title`, `content`, `rating`, `review_date`) VALUEs ('15','user1@example.com','這是標題15','這是內容','3','2024-05-04');

create or replace view product_reviews_view as select product.productName ,product_reviews.email ,product_reviews.title ,product_reviews.content ,product_reviews.rating ,product_reviews.review_date 
from product_reviews,product where product_reviews.product_id = product.productID;
