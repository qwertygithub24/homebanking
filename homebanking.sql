-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: homebanking
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banca`
--

DROP TABLE IF EXISTS `banca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `amministratore_id` int(11) DEFAULT NULL,
  `direttore_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banca`
--

LOCK TABLES `banca` WRITE;
/*!40000 ALTER TABLE `banca` DISABLE KEYS */;
INSERT INTO `banca` VALUES (1,'Banca 1','Via Banca 1',1,0),(2,'Banca 2','Via Banca 2',1,0);
/*!40000 ALTER TABLE `banca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiale`
--

DROP TABLE IF EXISTS `filiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filiale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `indirizzo` varchar(45) DEFAULT NULL,
  `orario_apertura` varchar(5) NOT NULL DEFAULT '08:00',
  `orario_chiusura` varchar(5) NOT NULL DEFAULT '12:00',
  `banca_id` int(11) DEFAULT '-1',
  `direttore_id` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiale`
--

LOCK TABLES `filiale` WRITE;
/*!40000 ALTER TABLE `filiale` DISABLE KEYS */;
INSERT INTO `filiale` VALUES (2,'Filiale 11','Filiale 11','08:30','12:30',1,1),(3,'Filiale 1','Filiale 1','08:30','12:30',1,1),(4,'aa','aa','08:00','12:00',2,1),(5,'bb','bb','08:00','12:00',2,1);
/*!40000 ALTER TABLE `filiale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(45) DEFAULT NULL,
  `image` blob,
  `data_inserimento` datetime DEFAULT NULL,
  `banca_id` int(11) DEFAULT NULL,
  `filiale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'/home/torsello/Scrivania/banca.jpeg','����\0JFIF\0\0\0\0\0\0��\0�\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0K\0\n\n\0\0\0\0\0\0!1\"AQRq�23Sa������#6Brs��������$&45CUbc��E���\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0A��\0\0\0?\0�(���������^���N R�+sLq���yG7`�*h�EY�ű�]R�H���kT�\'MV8�m<I,���^/UAc0�M�u�ڼ�#���eD]K��u��अ���gD:� \"\"\" \"��VD�)\Z;��1Ǥc�a���؏\n���%dMґ����	[�ck�T,3����ء��U��.WI���4t��(�@�[�f��f�5�Y��|��J��\0f-��`�h\Z�o1�j,�#�4�a��[[�Ɋ`�k��]��KTc��f\Zl�v�<.�N���@q�w�F��#��Z��:ZNn�$a���h��c����*���9��\'6����6��}z�͏�a���d1W5��}N��u�x<��.\'WL5����MQ��C���ڈU�.i�*m�WB�2��n�q�P�AY��~�������b܊�I�U�\rN�\r��C��SX�5^��	8��D-˩�K��\"\"\" \"\"�ed-ґ����W�������_�<*[�eu��\0�\rW�<_z����9���h����l��Y��,5U��t�K�\0��U�\r,lm�sm�����s�wfǞ�;�|Z�|Y�XV�K\Z,��9�M����KA�O�=Ih;��g�M�R�z��{�|�¬TG!t����!e��x�\\��)ي��T1��6��mn@Υh����Ԗ���z�T%n..�A��`��䦖K��h\0�C�h��j��L����\r%�u ��X������V�A�O�=Ih;��g�5\Z�z������Tx0��\'��Hq-��\'��p�V���\'Ş�����Ԡ�#\"���;�kZZ{�H��c�t\\ݠ�\'Ş����|[��e�����w���N\n^���:\ZZs]����汌}ɰ��%K�Z�9�k	f��h+SJ�DE�DD@DD�[N�@�����\Zx�V�=�X]s;Xìpoo�x���qK|�gޤqJX�1F�t��3�U�T�r�Z�aҰ%����s�jM앎�<����c�ˀ�\\kV|���v��y�O�AdmuΫܝ.�\0�r�>���]�eu�0�<�I^���F_S�$���h��ߓC�U����iau<��ť�k����)l�XKuX[��&7QQ�c2��y$lgE���ѫb�Y���qꪨ ltm�dlzN�nm~�t&TV�T4j۠z� ���`��u,��M�ig��S����g%�TW��K5\rN,6�E�9�N<��ƌ�8��ccnr���T��e=D����\\���Ll`b�E���a��wS�\"x`lmuΫ���žj�/���ɡ��o��|y��6J��3��c͐8��lU��]�q`vjإD�e�{�<�m�s5)ƍ�rl6�5�,��b=�F]��v��L-Ɉ\"\"�������\"�~��>�����o�o���/�;�Ĺ{���-�=_�\\��W���fZ�N�\n�`��~�eQ��E�攢3v��9r\Z�ߕ�^̽��\\����G�� ����ޅ�2�S��<�1joB�ܥ7L�R����_�o�F�2���s�j�M�*�T�Se�V��1��{�;Ҫ�X~�a��1�י{�;Ң,G��ş)S\n(������*atAV/�;�Ĺ{���-�[�\\?;%ύ;����~�⯃vM�Wܦ��Z�N�J�a&��Wl�(9��_�w��Qj̽��\\����G��׳	�\r�r�5z�ڛ����X��7�t,�o��d�̙-�ޅ�r���T��w��\0�J(�۵|��V�	�Hg`w+�\0S|��@#ڪ�yQ��oƻ�r��^����VP�ن�\0��\07+�b:l~�!Q��r��ϔ�u���ЎF)S�Ax�@DD� O�ֶ6�!�����h���w��ìN�����Y_O,p5��a\0;V�t+�|�>��l���?����9��j ؎BH�4����Q�a�_\n����p��TW���`�;�b��ۣ��\n�ij/�ݼ�r��Ua��5M@h�f贃����t����č��۠�}�iE{ �HdЎ-oy\rhi:����!�9���V�������=[-Yt�}�Q4�o��k�ee;Z\\��M���C8�pu}�v�8���\0Qb�(���)��$������&�\"�\Z�D��z�W��PcN�]K4m� Db���ъ�_zQ����\r��M-D3�L�^-}��V[��m<͐>\"��E�+r6F5� �^��ʕ�x���Qx�=DD�k���i�.��G�3���B�\"�+N����i��wR��b�e-9��z��d����E�()�ϻ�X�.:6at���z��d��Na�Q�ǿ�����/����\0(��\'�W{D���5H�X�\0�>�}D8��\0���\'�W}Ȗ��5Kc�n\0�\0!ޢ���gnN>}ު�Xr%�\"s\rU\Z1����|�U���m=8��u+=���5]m.%̀|�Ԥ0�j�d.��b�\0��IX/l���������������½(�Q�z��������?��','2019-09-09 00:00:00',1,1),(2,'/home/torsello/Scrivania/banca.jpeg','����\0JFIF\0\0\0\0\0\0��\0�\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0K\0\n\n\0\0\0\0\0\0!1\"AQRq�23Sa������#6Brs��������$&45CUbc��E���\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0A��\0\0\0?\0�(���������^���N R�+sLq���yG7`�*h�EY�ű�]R�H���kT�\'MV8�m<I,���^/UAc0�M�u�ڼ�#���eD]K��u��अ���gD:� \"\"\" \"��VD�)\Z;��1Ǥc�a���؏\n���%dMґ����	[�ck�T,3����ء��U��.WI���4t��(�@�[�f��f�5�Y��|��J��\0f-��`�h\Z�o1�j,�#�4�a��[[�Ɋ`�k��]��KTc��f\Zl�v�<.�N���@q�w�F��#��Z��:ZNn�$a���h��c����*���9��\'6����6��}z�͏�a���d1W5��}N��u�x<��.\'WL5����MQ��C���ڈU�.i�*m�WB�2��n�q�P�AY��~�������b܊�I�U�\rN�\r��C��SX�5^��	8��D-˩�K��\"\"\" \"\"�ed-ґ����W�������_�<*[�eu��\0�\rW�<_z����9���h����l��Y��,5U��t�K�\0��U�\r,lm�sm�����s�wfǞ�;�|Z�|Y�XV�K\Z,��9�M����KA�O�=Ih;��g�M�R�z��{�|�¬TG!t����!e��x�\\��)ي��T1��6��mn@Υh����Ԗ���z�T%n..�A��`��䦖K��h\0�C�h��j��L����\r%�u ��X������V�A�O�=Ih;��g�5\Z�z������Tx0��\'��Hq-��\'��p�V���\'Ş�����Ԡ�#\"���;�kZZ{�H��c�t\\ݠ�\'Ş����|[��e�����w���N\n^���:\ZZs]����汌}ɰ��%K�Z�9�k	f��h+SJ�DE�DD@DD�[N�@�����\Zx�V�=�X]s;Xìpoo�x���qK|�gޤqJX�1F�t��3�U�T�r�Z�aҰ%����s�jM앎�<����c�ˀ�\\kV|���v��y�O�AdmuΫܝ.�\0�r�>���]�eu�0�<�I^���F_S�$���h��ߓC�U����iau<��ť�k����)l�XKuX[��&7QQ�c2��y$lgE���ѫb�Y���qꪨ ltm�dlzN�nm~�t&TV�T4j۠z� ���`��u,��M�ig��S����g%�TW��K5\rN,6�E�9�N<��ƌ�8��ccnr���T��e=D����\\���Ll`b�E���a��wS�\"x`lmuΫ���žj�/���ɡ��o��|y��6J��3��c͐8��lU��]�q`vjإD�e�{�<�m�s5)ƍ�rl6�5�,��b=�F]��v��L-Ɉ\"\"�������\"�~��>�����o�o���/�;�Ĺ{���-�=_�\\��W���fZ�N�\n�`��~�eQ��E�攢3v��9r\Z�ߕ�^̽��\\����G�� ����ޅ�2�S��<�1joB�ܥ7L�R����_�o�F�2���s�j�M�*�T�Se�V��1��{�;Ҫ�X~�a��1�י{�;Ң,G��ş)S\n(������*atAV/�;�Ĺ{���-�[�\\?;%ύ;����~�⯃vM�Wܦ��Z�N�J�a&��Wl�(9��_�w��Qj̽��\\����G��׳	�\r�r�5z�ڛ����X��7�t,�o��d�̙-�ޅ�r���T��w��\0�J(�۵|��V�	�Hg`w+�\0S|��@#ڪ�yQ��oƻ�r��^����VP�ن�\0��\07+�b:l~�!Q��r��ϔ�u���ЎF)S�Ax�@DD� O�ֶ6�!�����h���w��ìN�����Y_O,p5��a\0;V�t+�|�>��l���?����9��j ؎BH�4����Q�a�_\n����p��TW���`�;�b��ۣ��\n�ij/�ݼ�r��Ua��5M@h�f贃����t����č��۠�}�iE{ �HdЎ-oy\rhi:����!�9���V�������=[-Yt�}�Q4�o��k�ee;Z\\��M���C8�pu}�v�8���\0Qb�(���)��$������&�\"�\Z�D��z�W��PcN�]K4m� Db���ъ�_zQ����\r��M-D3�L�^-}��V[��m<͐>\"��E�+r6F5� �^��ʕ�x���Qx�=DD�k���i�.��G�3���B�\"�+N����i��wR��b�e-9��z��d����E�()�ϻ�X�.:6at���z��d��Na�Q�ǿ�����/����\0(��\'�W{D���5H�X�\0�>�}D8��\0���\'�W}Ȗ��5Kc�n\0�\0!ޢ���gnN>}ު�Xr%�\"s\rU\Z1����|�U���m=8��u+=���5]m.%̀|�Ԥ0�j�d.��b�\0��IX/l���������������½(�Q�z��������?��','2019-09-09 00:00:00',1,1);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operazione`
--

DROP TABLE IF EXISTS `operazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operazione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `importo` float DEFAULT NULL,
  `tipologia` varchar(45) DEFAULT NULL,
  `servizio_id` int(11) NOT NULL DEFAULT '-1',
  `stato` varchar(20) DEFAULT 'non confermata',
  PRIMARY KEY (`id`,`servizio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operazione`
--

LOCK TABLES `operazione` WRITE;
/*!40000 ALTER TABLE `operazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `operazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denominazione` varchar(45) DEFAULT NULL,
  `data_attivazione` date DEFAULT NULL,
  `data_scadenza` date DEFAULT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `url_condizioni_generali` varchar(45) DEFAULT NULL,
  `interessi_passivi` float DEFAULT NULL,
  `interessi_attivi` float DEFAULT NULL,
  `banca_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`banca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (3,'aaaa','2019-09-05','2019-09-20','ffff','lll',2,3,1),(4,'bbbb','2019-09-05','2019-09-20','ffff','lll',2,3,1),(5,'uuuu','2019-09-05','2019-09-20','ffff','lll',2,3,1);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizio`
--

DROP TABLE IF EXISTS `servizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servizio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `denominazione` varchar(45) NOT NULL DEFAULT 'servizio generico',
  `data_attivazione` date NOT NULL DEFAULT '2019-01-01',
  `data_scadenza` date DEFAULT '2019-01-01',
  `descrizione` varchar(500) DEFAULT 'servizio finanziario generico',
  `numero_massimo_operazioni` int(11) DEFAULT '200',
  `prodotto_id` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizio`
--

LOCK TABLES `servizio` WRITE;
/*!40000 ALTER TABLE `servizio` DISABLE KEYS */;
INSERT INTO `servizio` VALUES (4,'Den. servizio','2019-09-11','2021-09-18','Descrizione estesa',20,3),(5,'Secondo servizio bbb','2019-09-03','2019-09-20','Descrizione estesa',2000,4),(6,'Servizio di uuuu','2019-09-03','2019-09-04','Carta di Credito',200,5);
/*!40000 ALTER TABLE `servizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizioCliente`
--

DROP TABLE IF EXISTS `servizioCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servizioCliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saldo` float DEFAULT '0',
  `stato` varchar(20) DEFAULT 'disattivato',
  `servizio_id` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizioCliente`
--

LOCK TABLES `servizioCliente` WRITE;
/*!40000 ALTER TABLE `servizioCliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `servizioCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_registrazione` datetime DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `indirizzo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `ruolo` varchar(20) DEFAULT 'Not registered',
  `codice_fiscale` varchar(16) DEFAULT NULL,
  `partitaiva` varchar(20) DEFAULT NULL,
  `pec` varchar(45) DEFAULT NULL,
  `codice_univoco` varchar(45) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `filiale_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`filiale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'2019-09-07 00:00:00','Admin','','','first.admin@domain.com','admin','61646d696e','Amministratore','FRTAMM','000000000000','first.admin@domain.com','UUUUU','2019-09-07',0),(5,'2019-09-09 00:00:00','Carlo','Rossi','Via Mazzini n.4, 73040, Galatina, LE','carlo.rossi@domain.it','carlo.rossi@domain.it','134234267556','Cliente','TRSBTTPOIDSI','','','','2019-09-09',2),(6,'2019-09-09 00:00:00','Giovanni','Torsello','Via Mazzini n.4, 73040, Galatina, LE','giovanni.torsello@gmail.com','giovanni.torsello@gmail.com','789162849256','Cliente','TRSBTTPOIDSI','','','','2019-09-09',3);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 20:38:22
