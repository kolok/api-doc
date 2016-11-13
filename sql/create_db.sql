DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `label` varchar(255) NOT NULL DEFAULT '',
      PRIMARY KEY (`id`),
      UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `category_id` int(11) NOT NULL,
      `parent_id` int(11) DEFAULT NULL,
      `label` varchar(255) NOT NULL DEFAULT '',
      `content` text NOT NULL DEFAULT '',
      PRIMARY KEY (`id`),
      UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (id,label) VALUES (1, 'cat1'),(2, 'cat2'),(3, 'cat3 - without pages');

INSERT INTO `pages` (id,category_id,parent_id,label,content) VALUES (1, 1, null, "Category 1 page 1", "<h1>First page (cat 1)</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>"),(2, 1, 1, "Category 1 Page 2", "<h1>Second page (cat 2)</h1><h2>Where am I ?</h2><p>This page is the second page of category 1</p><p>It is also the child of page 1 in the same category</p><h2>How it works ?</h2><p>The page belongs to a category, its title is displayed on the left when its category is displayed. And the pages of a category have a hierarchy using parent_id which point on an other page of the categoiry. This provide a tree (displayed on the left) !!! Each page handle an order which is used to be ordered on the tree on each level</p>"),(3, 1, 1, "Category 1 - Page 3", "<h1>More details</h1><h2>sub title of more details</h2><p>check the <a onClick='return false;'>cat 2</a></p>"),(4, 2, null, "Page 1 of category 2", "<h1>Page 1 (cat 2)</h1><h2>Getting started</h2><p>This is my cat 2<br>please follow this step...</p>");


