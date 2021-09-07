-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 07 sep. 2021 à 09:00
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `subskill`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_publication` date NOT NULL,
  `date_edition` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `intitule` varchar(255) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `id_ville` int(11) NOT NULL,
  `id_metier` int(11) NOT NULL,
  `id_contrat` int(11) NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `id_entreprise` (`id_entreprise`),
  KEY `id_contrat` (`id_contrat`),
  KEY `id_metier` (`id_metier`),
  KEY `id_ville` (`id_ville`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`reference`, `description`, `date_publication`, `date_edition`, `image`, `intitule`, `id_entreprise`, `id_ville`, `id_metier`, `id_contrat`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'Subskill recherche des collaborateurs curieux, passionnés et enthousiastes, aimant la diversité des projets, ainsi qu’apprendre et partager pour rejoindre notre équipe de développeurs.\r\n\r\nChez Subskill, les qualités humaines sont aussi importantes que les qualités techniques.\r\n\r\nPour nous, le développeur doit être force de proposition (il n’y a pas de problème, il n’y a que des solutions).\r\n\r\nSous la responsabilité du CTO & des séniors, vous évoluerez au sein d’une équipe de 10 développeurs.\r\nVous aurez pour mission :\r\n\r\nla conception / création / maintenance de sites internet\r\nla conception / création / Utilisation / maintenance d’API/webservices\r\nla modélisation de base de données\r\nla réflexion sur l’architecture technique des projets\r\nla mise en place ou la découverte de CMS / Framework\r\ndu code, du code et encore du code ;-)\r\nProfil recherché\r\nLangages : PHP / MySQL\r\nConnaissance des outils de gestion de versioning (git)\r\nConnaissance des standards Web (REST, OAuth2, ..)\r\nPeuvent être un plus :\r\n\r\n1 expérience sur un CMS (Wordpress / Prestashop / Drupal / Magento)\r\n1 expérience sur un Framework (Laravel / Symfony / Slim / Lumen)\r\nNodeJS\r\nDevOps : Docker, Jenkins', '2021-09-07', '2021-09-07', 'https://cdn-images.welcometothejungle.com/iqZjkgzCdEO6jRU3q_tyekieLC-QYy6Ay6I5IODIs8s/rs:auto:200::/q:85/czM6Ly93dHRqLXByb2R1Y3Rpb24vdXBsb2Fkcy9vcmdhbml6YXRpb24vbG9nby8xMDE4LzE1MTI2NC85ZDQ1MjAzMC0wNzUwLTQ4NGItYWUyYS05MzlkODNkZjQwYTUucG5n', 'Développeur Back | Alternance', 1, 1, 2, 3),
('da4b9237bacccdf19c0760cab7aec4a8359010b0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse consequatur quos voluptatibus, reprehenderit laborum accusantium qui laudantium modi deserunt eius. Illo suscipit earum cupiditate est ipsam dolor, amet quidem eaque!', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/9sBO7cjaDe.png', 'intitulé test 1', 2, 3, 2, 2),
('77de68daecd823babbb58edb1c8e14d7106e83bb', 'Cras sapien magna, tincidunt viverra eros a, tristique ultrices magna. Sed gravida mi metus, vel posuere dui interdum in. Proin scelerisque volutpat diam at fringilla. Aenean sem ligula, aliquam ac velit eget, maximus dictum nulla. Proin tincidunt, felis eu tempus scelerisque, lorem odio eleifend quam, at tincidunt magna massa quis turpis. Integer eget orci sed nisi elementum pellentesque eget lobortis turpis. Cras in interdum lectus, at dignissim justo. Sed aliquam, urna vitae dignissim ultrices, nisl ante consectetur erat, quis semper sem arcu sed mi.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/MC8tQwvS3b.jpg', 'intitulé test 2', 3, 1, 1, 1),
('1b6453892473a467d07372d45eb05abc2031647a', 'Sed ornare dapibus urna ut consequat. Mauris ligula felis, ullamcorper at metus nec, rhoncus hendrerit ante. Morbi nunc diam, luctus non ipsum ac, pretium pulvinar odio. Maecenas ac fringilla odio, nec ullamcorper urna. Mauris commodo lorem leo, eu fringilla elit luctus at. Etiam dolor elit, convallis eget sapien eu, dictum porta urna. Curabitur ac nunc id purus pharetra congue porta eget lorem. Sed et sapien vitae ex facilisis laoreet quis non est. Proin quis est facilisis, varius tellus in, euismod mi. Nunc tincidunt condimentum tortor vitae tincidunt. Duis mi tellus, vehicula sit amet dolor vitae, posuere porta felis. Maecenas id iaculis sapien. In cursus, sem vitae elementum aliquam, nisi leo pharetra dolor, rhoncus euismod orci nunc et velit. Nunc at ullamcorper tortor, sed feugiat velit. Suspendisse ut mattis nisl.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/oijUFGKLW2.jpg', 'intitulé test 3', 4, 4, 2, 2),
('902ba3cda1883801594b6e1b452790cc53948fda', 'Vestibulum non varius est, eu cursus dolor. Nullam posuere fermentum erat, vitae venenatis magna eleifend vitae. Phasellus convallis id leo suscipit maximus. Pellentesque commodo ante risus, vitae porttitor enim rhoncus a. Aliquam ipsum erat, interdum at arcu vitae, pretium gravida leo. Sed felis odio, mattis at nisi non, fringilla pharetra urna. Suspendisse lobortis ullamcorper diam.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/GN4W3gcnXV.png', 'intitulé test 6', 5, 5, 2, 3),
('ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'Ut vestibulum ligula a nunc aliquam sodales. Etiam eget dapibus nisl. Curabitur a justo vulputate, tempus leo ac, interdum risus. Sed ac mi id elit fringilla vehicula a porta nisi. Nulla placerat nec lacus et hendrerit. Maecenas congue, nunc vel maximus laoreet, ipsum elit bibendum metus, ac iaculis est leo id libero. Pellentesque aliquam ipsum in accumsan luctus. Integer dapibus massa id dui facilisis ultricies non at tortor.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/WgLubDy5Q1.png', 'intitulé test 4', 4, 1, 6, 4),
('c1dfd96eea8cc2b62785275bca38ac261256e278', 'Aliquam dignissim malesuada faucibus. Phasellus a accumsan diam. Nulla at metus vel leo feugiat facilisis. Vivamus aliquam, orci sit amet vulputate dictum, ante mauris aliquet nunc, et suscipit tellus est nec urna. Proin dictum blandit aliquam. Phasellus ultricies, justo convallis accumsan consectetur, eros tortor viverra sapien, ut accumsan leo felis eu purus. Quisque aliquet, massa sit amet ornare interdum, ante sem lobortis neque, nec fermentum nunc neque quis magna. Fusce mollis pellentesque massa, id pretium mauris bibendum id. Vestibulum feugiat mauris nibh, sit amet consectetur lorem maximus quis. Morbi euismod turpis sit amet nunc efficitur, id volutpat ipsum molestie. Quisque vehicula vitae leo vehicula sollicitudin. Suspendisse laoreet viverra nibh, quis convallis metus imperdiet sed. Nam pulvinar felis eu nibh elementum, sed accumsan nisi euismod.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/nvvDKGHtDi.png', 'intitulé test 5', 5, 5, 3, 2),
('fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f', 'Quisque bibendum viverra fermentum. Cras aliquam dolor sed magna mollis vestibulum. Aenean egestas justo vel dui mattis, ut venenatis odio consequat. Donec maximus congue dui, vel vestibulum turpis ullamcorper aliquam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris fermentum risus ut lectus euismod, eu auctor metus congue. Aenean tristique cursus augue id pellentesque. Etiam luctus neque in dui consequat, quis posuere est maximus. Donec molestie, ligula ultricies euismod viverra, velit metus fringilla eros, in eleifend dolor nunc vitae neque. Praesent eget massa sed leo lobortis malesuada. Curabitur eu euismod enim. Phasellus mollis purus odio, quis tincidunt est eleifend in. Nunc pellentesque est congue cursus tempus.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/VM2Dkpp7VX.png', 'intitulé test 7', 5, 5, 3, 2),
('0ade7c2cf97f75d009975f4d720d1fa6c19f4897', 'Morbi gravida arcu id sapien finibus venenatis. Cras convallis posuere condimentum. Etiam lobortis lorem libero, sit amet viverra nisi porta a. Sed velit magna, feugiat nec ex sed, porta maximus dolor. Donec rhoncus velit id orci blandit, at blandit velit lacinia. Phasellus volutpat ligula nec odio hendrerit, fringilla aliquet ipsum dignissim. Fusce placerat malesuada risus, ac malesuada lacus eleifend quis. Curabitur vestibulum erat et velit condimentum egestas. Nulla euismod mi nec lorem luctus, sit amet rutrum ante tempus. Nam sagittis interdum odio, ac fringilla ligula. Nulla facilisi. Donec velit est, elementum nec vestibulum in, condimentum eu eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras pellentesque finibus volutpat. Praesent commodo dictum ultricies.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/WbL79WnQh0.png', 'intitulé test 8', 6, 1, 4, 3),
('b1d5781111d84f7b3fe45a0852e59758cd7a87e5', 'Quisque sapien tortor, gravida eget neque ac, pharetra rhoncus diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent aliquam feugiat urna, vel fermentum erat pretium at. Donec ante purus, dignissim a lobortis quis, ullamcorper mattis nibh. Proin hendrerit nibh ac tortor condimentum tristique. Morbi purus lectus, cursus quis ex vel, lobortis tincidunt lorem. Quisque efficitur cursus sapien ut faucibus. Mauris pulvinar sit amet nunc quis lobortis. Cras vestibulum elit at tincidunt mattis. Curabitur lobortis metus magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris vitae viverra metus, ut ultrices nunc.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/nvvDKGHtDi.png', 'intitulé test 9', 2, 2, 4, 1),
('17ba0791499db908433b80f37c5fbc89b870084b', 'Aenean dapibus odio sed tellus blandit varius. Mauris fringilla rhoncus est vitae consectetur. Proin tempus felis nec turpis commodo, et aliquam nulla congue. Quisque a malesuada est. Pellentesque vel ultricies neque. Nulla nec mi facilisis, viverra erat in, efficitur nunc. Donec eleifend ornare lectus, sed elementum magna pellentesque quis. Duis et blandit eros. Duis nec massa vitae turpis molestie imperdiet. Phasellus lobortis sem in fringilla consectetur. Curabitur scelerisque mi nec maximus bibendum. Aenean eu urna id erat mollis eleifend sed at turpis. Pellentesque ullamcorper convallis tortor ut cursus.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/pAQ82dVaNi.png', 'intitulé test 10', 3, 2, 1, 2),
('7b52009b64fd0a2a49e6d8a939753077792b0554', 'Donec eleifend feugiat libero, eu suscipit massa iaculis sit amet. Proin fringilla malesuada mi at feugiat. Aenean ac sollicitudin lectus. Vivamus eu neque est. Pellentesque ullamcorper enim vitae porttitor lobortis. Curabitur id porta ex, in finibus odio. Donec purus arcu, fermentum ornare tempus non, ornare et orci. Phasellus vulputate ut urna id varius. Suspendisse potenti.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/nvvDKGHtDi.png', 'intitulé test 11', 4, 1, 3, 2),
('bd307a3ec329e10a2cff8fb87480823da114f8f4', 'Vestibulum ultrices eleifend odio in suscipit. Nam scelerisque diam vitae tincidunt mollis. Maecenas ac elit nec neque gravida egestas. Praesent malesuada condimentum nibh, sed elementum nisi sagittis quis. Morbi lacinia mauris odio, vitae pretium mauris bibendum eget. Aliquam rutrum commodo dui, quis placerat diam blandit nec. Aenean bibendum a felis ornare bibendum. Sed eget bibendum erat, id pretium nulla. Mauris faucibus diam mauris. Sed ornare tempor justo, ut rutrum ex scelerisque at. Proin quis metus nisi.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/nvvDKGHtDi.png', 'intitulé test 12', 2, 3, 2, 4),
('fa35e192121eabf3dabf9f5ea6abdbcbc107ac3b', 'Nunc lacinia, purus id molestie dapibus, mauris risus bibendum diam, vitae viverra ante libero nec tellus. In at venenatis massa, ut varius orci. Etiam euismod arcu ligula, non sollicitudin eros commodo ac. Sed odio sem, sollicitudin ut aliquam id, congue sit amet sem. Aenean interdum, orci non vulputate iaculis, odio urna suscipit quam, quis pellentesque lectus tortor sed nunc. Aenean lectus ante, fringilla vel nisi sit amet, laoreet tristique ipsum. Pellentesque et urna vel tellus varius dignissim in sit amet arcu. Proin elementum gravida metus sit amet porttitor. Duis consequat eu lorem volutpat feugiat. Suspendisse cursus, turpis id efficitur consequat, nisi eros commodo eros, a suscipit ante mauris id sem. Vestibulum in nulla feugiat, mattis lorem at, volutpat diam. Vestibulum auctor vestibulum hendrerit. In vitae dui tortor. Nam eu posuere libero.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/9sBO7cjaDe.png', 'intitulé test 13', 3, 3, 1, 2),
('f1abd670358e036c31296e66b3b66c382ac00812', 'Phasellus vitae risus hendrerit, faucibus magna non, aliquet orci. Curabitur vulputate libero sem, sed dictum quam blandit vel. Pellentesque eget sollicitudin nulla. Phasellus vehicula massa nec orci bibendum tincidunt. Duis non ante augue. Aliquam dictum diam id ex laoreet, sed scelerisque nisi pulvinar. Nulla a quam posuere massa semper eleifend ut eget lorem. Maecenas ut quam eu est tempor maximus quis quis risus. Nulla a lorem malesuada, maximus magna sed, luctus urna. Sed augue augue, aliquet et consectetur id, tincidunt sed erat. Quisque imperdiet, ante in imperdiet efficitur, velit diam molestie risus, vitae molestie nisl lectus quis elit.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/VM2Dkpp7VX.png', 'intitulé test 14', 6, 3, 2, 3),
('1574bddb75c78a6fd2251d61e2993b5146201319', 'Mauris non nibh a massa molestie scelerisque in at arcu. Donec et sem vitae neque consectetur lobortis. In hac habitasse platea dictumst. Aliquam fermentum ipsum et sapien dignissim vestibulum. Proin pretium justo sed aliquet pulvinar. Donec in est nulla. Maecenas venenatis porta mauris, at bibendum odio faucibus quis. Integer tempor arcu et lorem pharetra feugiat. Quisque semper odio posuere risus sollicitudin sollicitudin. Cras ultricies vehicula libero nec vestibulum.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/yRVnRpFxG5.jpg', 'intitulé test 15', 2, 2, 3, 2),
('0716d9708d321ffb6a00818614779e779925365c', 'Donec at orci metus. Phasellus quis aliquet quam, id mollis nunc. Nulla rhoncus eros quis interdum blandit. In hac habitasse platea dictumst. Phasellus eleifend pretium diam et tincidunt. Phasellus non egestas augue. Aliquam tristique laoreet dui porta pellentesque. Pellentesque vitae felis vulputate, facilisis ante at, viverra ipsum. Fusce vulputate ligula ac tortor euismod, a bibendum odio bibendum. Sed turpis augue, pellentesque a mattis sed, mattis ac ex. Nulla dui ante, vulputate at neque sit amet, lobortis sodales quam.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/GN4W3gcnXV.png', 'intitulé test 16', 3, 3, 6, 2),
('9e6a55b6b4563e652a23be9d623ca5055c356940', 'Mauris mollis ornare urna id suscipit. Mauris a vulputate lacus, at mollis dolor. Suspendisse vitae fringilla sapien. Integer dapibus elit et quam imperdiet auctor. Morbi consequat id purus in mattis. Ut vitae lectus et dui elementum molestie. Donec dictum, velit sit amet tempus faucibus, sem libero vehicula odio, eget fringilla orci neque sit amet neque. Mauris non sodales diam, ac bibendum justo. Mauris nibh augue, suscipit a vestibulum id, tincidunt eget enim. Nullam mattis finibus nunc, et placerat est dictum nec. Pellentesque erat sem, maximus eu dignissim sed, congue quis urna. Aenean dignissim, diam in ultrices blandit, eros orci imperdiet urna, at semper sapien ipsum ac felis. Etiam quis nisi ac sapien mattis ultrices.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/07jjUxQKNf.png', 'intitulé test 17', 4, 2, 5, 1),
('b3f0c7f6bb763af1be91d9e74eabfeb199dc1f1f', 'Donec tellus nunc, volutpat id congue quis, commodo at tellus. Nam gravida massa eu eros iaculis, quis ullamcorper sapien blandit. Nam feugiat consequat nisl non faucibus. Suspendisse dapibus commodo justo, nec tempor orci placerat ut. Phasellus at odio sed purus mollis scelerisque eget quis lacus. Aliquam efficitur lacus elit, sodales sagittis ipsum aliquet tincidunt. Donec sit amet ultrices metus. Praesent pharetra convallis iaculis. Nullam imperdiet nibh at enim egestas imperdiet. In finibus dignissim placerat. Phasellus ligula nisl, sagittis id ullamcorper et, dictum ut neque. Etiam enim purus, convallis et enim nec, condimentum efficitur nibh. Integer mollis viverra mi, a dapibus justo ullamcorper vel. Mauris eget erat porttitor, bibendum nulla nec, condimentum orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/yRVnRpFxG5.jpg', 'intitulé test 18', 2, 4, 5, 3),
('91032ad7bbcb6cf72875e8e8207dcfba80173f7c', 'Cras facilisis iaculis elit eget pellentesque. Maecenas blandit neque neque, pellentesque accumsan mauris ultricies a. Nam pellentesque justo sit amet ultrices consequat. Quisque in ultrices purus, ac volutpat arcu. Suspendisse pulvinar nisl ante, vel ultricies lectus vehicula nec. Vestibulum tincidunt ullamcorper elit in bibendum. Donec eu aliquam tortor.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/MC8tQwvS3b.jpg', 'intitulé test 19', 5, 2, 5, 2),
('472b07b9fcf2c2451e8781e944bf5f77cd8457c8', 'Mauris finibus ex nisi, ac pretium lacus scelerisque eget. Donec ac porttitor ipsum. Nunc augue orci, consequat et elit ornare, congue tempus nibh. Integer ut tincidunt quam. Suspendisse feugiat orci ac justo eleifend egestas. Proin id rutrum turpis, a iaculis ante. Sed eleifend lectus posuere, maximus sem id, elementum lacus. Sed nec nunc id sapien pellentesque condimentum', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/oijUFGKLW2.jpg', 'intitulé test 20', 4, 4, 5, 2),
('12c6fc06c99a462375eeb3f43dfd832b08ca9e17', 'Mauris condimentum libero diam. Praesent sit amet nisi consectetur tortor tempor vestibulum facilisis eu nisl. Curabitur scelerisque lacinia nunc at feugiat. Nam a ante quis velit tincidunt pulvinar at egestas nisl. Nulla fringilla enim libero, a condimentum massa rutrum vitae. Suspendisse tristique urna ac feugiat pharetra. Donec ultricies metus in quam efficitur, facilisis sagittis lacus pellentesque. Suspendisse in lectus dignissim, ullamcorper dolor non, posuere lacus.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/MRSkC75kNv.png', 'intitulé test 21', 5, 3, 3, 1),
('d435a6cdd786300dff204ee7c2ef942d3e9034e2', 'Etiam lobortis id eros vel congue. Duis ut elementum nunc, tincidunt blandit libero. Nulla in neque placerat, porttitor ante eu, aliquet risus. Vivamus viverra nulla eget quam varius, in sagittis purus iaculis. Vestibulum vel auctor augue. Nulla hendrerit dui id vestibulum sollicitudin. Nam libero ipsum, convallis ac fermentum eget, vestibulum sed enim. Nam faucibus odio urna, ut tempus elit feugiat in. Fusce dui nunc, egestas at nibh at, auctor viverra lorem.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/9sBO7cjaDe.png', 'intitulé test 22', 6, 1, 3, 1),
('4d134bc072212ace2df385dae143139da74ec0ef', 'Fusce euismod sit amet odio finibus mollis. Ut tempus nibh ante, non interdum ex eleifend fermentum. Vestibulum ligula nisl, fringilla ac faucibus id, dictum sed ipsum. Aliquam vehicula purus tempor, iaculis metus ut, sodales ante. Cras porttitor facilisis mattis. Suspendisse id ligula quis ligula sodales pharetra id at urna. Donec mollis mollis ipsum luctus elementum. Ut sed elit non nunc pharetra facilisis. Etiam suscipit rhoncus dui nec feugiat. In imperdiet est tempus leo sodales, non varius quam porta. Proin vehicula dolor eget congue gravida.\r\n\r\n', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/MC8tQwvS3b.jpg', 'intitulé test 23', 3, 1, 4, 1),
('f6e1126cedebf23e1463aee73f9df08783640400', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/oijUFGKLW2.jpg', 'intitulé test 25', 4, 2, 2, 2),
('887309d048beef83ad3eabf2a79a64a389ab1c9f', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/VM2Dkpp7VX.png', 'intitulé test 26', 4, 4, 2, 3),
('bc33ea4e26e5e1af1408321416956113a4658763', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/pAQ82dVaNi.png', 'intitulé test 27', 2, 4, 2, 2),
('0a57cb53ba59c46fc4b692527a38a87c78d84028', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/MRSkC75kNv.png', 'intitulé test 28', 3, 4, 5, 2),
('7719a1c782a1ba91c031a682a0a2f8658209adbf', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/WbL79WnQh0.png', 'intitulé test 29', 4, 3, 5, 2),
('22d200f8670dbdb3e253a90eee5098477c95c23d', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/VM2Dkpp7VX.png', 'intitulé test 30', 5, 4, 3, 2),
('632667547e7cd3e0466547863e1207a8c0c0c549', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/MRSkC75kNv.png', 'intitulé test 31', 4, 4, 2, 3),
('cb4e5208b4cd87268b208e49452ed6e89a68e0b8', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/pAQ82dVaNi.png', 'intitulé test', 5, 5, 1, 2),
('b6692ea5df920cad691c20319a6fffd7a4a766b8', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/yRVnRpFxG5.jpg', 'intitulé test 32', 5, 5, 6, 1),
('f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59', 'Pellentesque at imperdiet felis, sit amet euismod purus. Curabitur pellentesque nunc felis, laoreet suscipit dolor aliquam ut. Ut vestibulum sem sit amet laoreet faucibus. Aenean libero quam, feugiat et mauris id, mollis iaculis ligula. Mauris eu dolor id sem semper volutpat vel quis enim. Integer tempus, dui ut vestibulum egestas, nunc mi rutrum elit, pellentesque egestas augue dui vel quam. Nulla sit amet neque consequat, pharetra massa ac, maximus lectus. Nam id velit augue. Pellentesque at fringilla turpis. Maecenas semper nulla felis, ut luctus ligula pulvinar non. Fusce rhoncus cursus eleifend. Suspendisse cursus, felis at fringilla blandit, tellus sapien consequat mauris, vitae iaculis eros nunc vitae odio. In dapibus, erat ut hendrerit ultrices, lacus ligula semper tortor, at laoreet lectus ligula quis nisi. Donec nibh turpis, scelerisque a feugiat pellentesque, iaculis sed tortor. Praesent eleifend, mi at aliquet lacinia, risus tellus consectetur est, nec lobortis erat risus cursus neque. Aliquam erat volutpat.', '2021-09-07', '2021-09-07', 'https://i.some-random-api.ml/VM2Dkpp7VX.png', 'intitulé test 33', 6, 3, 6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `nom`) VALUES
(1, 'CDD'),
(2, 'CDI'),
(3, 'Alternance'),
(4, 'Stage');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom`) VALUES
(1, 'Subskill'),
(2, 'OVE - On Vous Embauche'),
(3, 'Startup sympa'),
(4, 'PME sans histoire'),
(5, 'Grande entreprise'),
(6, 'Association caritative');

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

DROP TABLE IF EXISTS `metier`;
CREATE TABLE IF NOT EXISTS `metier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`id`, `nom`) VALUES
(1, 'Ingénieur'),
(2, 'Développeur'),
(3, 'Intégrateur'),
(4, 'Modélisateur'),
(5, 'Chef de projet'),
(6, 'Graphiste');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`) VALUES
(1, 'Paris'),
(2, 'Bordeaux'),
(3, 'Marseille'),
(4, 'Lille'),
(5, 'Lyon');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
