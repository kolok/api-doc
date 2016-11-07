CREATE TABLE `categories`  (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `label` varchar(255) NOT NULL DEFAULT '',
      PRIMARY KEY (`id`),
      UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pages`  (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `category_id` int(11) NOT NULL,
      `parent_id` int(11) DEFAULT NULL,
      `label` varchar(255) NOT NULL DEFAULT '',
      `content` varchar(255) NOT NULL DEFAULT '',
      PRIMARY KEY (`id`),
      UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (id,label) VALUES (1, 'cat1'),(2, 'cat2'),(3, 'cat3');

INSERT INTO `pages` (id,category_id,parent_id,label,content) VALUES (1, 1, null, "WCM API doc", "<h1>WCM API doc</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>"),(2, 1, 1, "WCM Structure", "<h1>WCM structure</h1><h2>Authentication Structure</h2><p>structure description...</p><h2>WCM product Structure</h2><p>structure description...</p>"),(3, 1, 1, "WCM API routes", "<h1>WCM routes</h1><h2>Account routes</h2><p>routes description</p>"),(4, 2, null, "WAM API doc", "<h1>WAM API doc</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>");


