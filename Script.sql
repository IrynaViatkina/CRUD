DROP TABLE `user`;
CREATE TABLE `user`
		(`id` int(8) unsigned NOT NULL auto_increment,
		 `name` varchar(25) default NULL,
		 `age` int(12) default NULL,
		 `isAdmin` bit default NULL,
		 `createdDate` timestamp,
		 PRIMARY KEY (`id`))
		 AUTO_INCREMENT=1;
INSERT INTO `user` (`id`, `name`, `age`, `isAdmin`, `createdDate`)
VALUES (1, "Ivan Ivanov", 35, 0, "2016-07-16 15:40:19"),
	(2, "Oleg Petrov", 26, 0, "2016-07-16 15:42:23"),
	(3, "Elena Borunova", 31, 0, "2016-07-16 15:44:11"),
	(4, "Olga Sidorova", 42, 0, "2016-07-16 15:46:54"),
	(5, "Dmitrii Volkov", 37, 0, "2016-07-16 15:48:32"),
	(6, "Nikolai Cvetkov", 34, 1, "2016-07-16 15:50:06"),
	(7, "Oleg Jnecov", 30, 0, "2015-09-01 11:12:33"),
	(8, "Viktor Ivanov", 22, 0, "2015-09-01 11:20:21"),
	(9, "Sergei Vorobiev", 25, 0, "2015-09-01 11:40:10"),
	(10, "Oleg Sidorov", 46, 0, "2017-01-16 15:40:39"),

	(11, "Svetlana Pochtareva", 33, 0, "2014-03-11 10:10:19"),
	(12, "Evgenii Nikolaev", 42, 1, "2014-03-11 10:13:23"),
	(13, "Anna Vilkova", 40, 0, "2014-03-11 10:15:32"),
	(14, "Aleksandr Shevcov", 28, 0, "2014-03-11 10:20:31"),
	(15, "Aleksei Romanov", 29, 0, "2014-03-11 10:25:22"),
	(16, "Ivan Kolbasa", 22, 0, "2016-12-26 16:28:02"),
	(17, "Irina Petrova", 25, 0, "2016-12-26 16:30:25"),
	(18, "Oleg Maksimov", 41, 0, "2016-12-26 16:33:46"),
	(19, "Ludmila Cvetkova", 39, 0, "2016-12-26 16:39:45"),
	(20, "Maksim Samoilenko", 27, 0, "2016-12-26 16:45:11"),

	(21, "Andrei Lazarenko", 46, 0, "2015-11-16 12:10:09"),
	(22, "Maksim Shevchenko", 33, 0, "2015-11-21 12:20:11"),
	(23, "Oleg Petrovskii", 45, 0, "2015-11-21 12:24:30"),
	(24, "Ann Andreenko", 43, 0, "2015-11-21 12:48:19"),
	(25, "Andreii Matvienko", 50, 0, "2015-11-21 12:50:22"),
	(26, "Alla Lazareva", 56, 0, "2016-06-30 14:22:34"),
	(27, "Aleksndr Jarov", 60, 0, "2016-06-30 14:32:54"),
	(28, "Yan Lubov", 25, 0, "2016-06-30 14:35:43"),
	(29, "Ekaterina Tropova", 50, 0, "2016-06-30 14:40:22"),
	(30, "Sergei Sidorov", 49, 1, "2016-06-30 14:55:12");




