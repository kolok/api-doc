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
      `content` text,
      PRIMARY KEY (`id`),
      UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (id,label) VALUES (1, 'cat1'),(2, 'cat2'),(3, 'cat3 - without pages');

INSERT INTO `pages` (id,category_id,parent_id,label,content) VALUES 
  (1, 1, null, "Category 1 page 1", "<h1>First page (cat 1)</h1><h2>Getting started</h2><p>How do you start ?<br>please follow this step...</p>"),
  (2, 1, 1, "Category 1 Page 2", "<h1>Second page (cat 2)</h1><h2>Where am I ?</h2><p>This page is the second page of category 1</p><p>It is also the child of page 1 in the same category</p><h2>How it works ?</h2><p>The page belongs to a category, its title is displayed on the left when its category is displayed. And the pages of a category have a hierarchy using parent_id which point on an other page of the categoiry. This provide a tree (displayed on the left) !!! Each page handle an order which is used to be ordered on the tree on each level</p>"),
  (3, 1, 1, "Category 1 - Page 3", "<h1>More details</h1><h2>sub title of more details</h2><p>check the <a onClick='return false;'>cat 2</a></p>"),
  (4, 2, null, "Page 1 of category 2", "<h1>Page 1 (cat 2)</h1><h2>Getting started</h2><p>This is my cat 2<br>please follow this step...</p>"),
  (5, 1, 1, "Category 1 - Page 4 - long text page", "<h1 id='intro'>Introduction</h1>

<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel lorem interdum, lacinia ligula ac, consectetur quam. Curabitur quis quam ac nunc venenatis tristique quis ut neque. Duis ultricies tellus tortor, id sollicitudin nisl malesuada at. Phasellus maximus nisi non lacus cursus luctus. Maecenas vestibulum libero ac elit sagittis, eu rutrum risus rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet ligula eget enim auctor rhoncus in sed felis. Vestibulum pretium dignissim mauris vel efficitur. Morbi malesuada euismod nulla. Integer sit amet nunc facilisis, rhoncus tellus id, aliquet tellus.</p>

<p>Praesent interdum interdum orci, vitae feugiat lorem consequat id. Quisque lobortis tellus vitae eros pretium, ut scelerisque mauris pellentesque. Proin vehicula purus non velit dapibus suscipit. Proin dignissim sapien erat, at lobortis nulla ullamcorper tempor. Praesent posuere nulla ac ultricies pharetra. Morbi mattis vitae dui hendrerit imperdiet. Pellentesque sollicitudin purus sit amet nisi congue, sit amet consectetur risus scelerisque. Suspendisse porta, eros ac lacinia elementum, ipsum velit placerat justo, at pretium lorem sapien at arcu.</p>

<p>Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<p>Donec convallis nibh lorem, pretium egestas libero fringilla in. Suspendisse imperdiet tincidunt gravida. Donec non dapibus ante, varius ullamcorper enim. Nullam vel dapibus nibh, a convallis mauris. Sed vestibulum ex eget odio tristique consectetur. Pellentesque in porta ipsum, vel suscipit urna. Fusce dolor odio, iaculis ac egestas sed, molestie vel velit. Morbi egestas faucibus dui, eget lacinia urna porta id. Integer mattis malesuada maximus. In ultrices tortor ac dolor sollicitudin pellentesque.</p>

<p>Integer eu varius est, et egestas metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra ligula in justo ornare fringilla. Donec vitae velit euismod, luctus tortor id, sagittis elit. Cras sed magna non mauris lobortis sodales. Donec non vestibulum dui, vel commodo arcu. Nam lacus nisi, luctus sit amet semper bibendum, cursus sit amet tellus. Donec ullamcorper ac odio in suscipit. Vivamus porta ultrices commodo. Etiam vitae ultrices elit, vitae aliquet purus. Ut auctor aliquam massa. Morbi vel urna cursus, venenatis justo quis, pharetra velit. Pellentesque pellentesque ipsum metus, at convallis libero porta in.</p>

<h1 id='ojb'>Object descrition</h1>

<h2 id='first'>My first object</h2>

<p>
for example, you can describe a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<h3 id='object_detail'>Object Detail</h3>
<p>Let's give some details <i>in italic</i> or in <b>bold</b><br>and use &lt;br&gt; tag to manage carrier return</p>

<div class='warning'> This is a <b>warning</b> div, with a long message :
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel lorem interdum, lacinia ligula ac, consectetur quam. Curabitur quis quam ac nunc venenatis tristique quis ut neque. Duis ultricies tellus tortor, id sollicitudin nisl malesuada at. Phasellus maximus nisi non lacus cursus luctus. Maecenas vestibulum libero ac elit sagittis, eu rutrum risus rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet ligula eget enim auctor rhoncus in sed felis. Vestibulum pretium dignissim mauris vel efficitur. Morbi malesuada euismod nulla. Integer sit amet nunc facilisis, rhoncus tellus id, aliquet tellus.
</div>

<div class='error'> This is an <b>error</b> div, with a long message :
Praesent interdum interdum orci, vitae feugiat lorem consequat id. Quisque lobortis tellus vitae eros pretium, ut scelerisque mauris pellentesque. Proin vehicula purus non velit dapibus suscipit. Proin dignissim sapien erat, at lobortis nulla ullamcorper tempor. Praesent posuere nulla ac ultricies pharetra. Morbi mattis vitae dui hendrerit imperdiet. Pellentesque sollicitudin purus sit amet nisi congue, sit amet consectetur risus scelerisque. Suspendisse porta, eros ac lacinia elementum, ipsum velit placerat justo, at pretium lorem sapien at arcu.</p>
</div>

<div class='warning'> <p>This is a <b>warning</b> div, with a long message and paragraph :</p>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel lorem interdum, lacinia ligula ac, consectetur quam. Curabitur quis quam ac nunc venenatis tristique quis ut neque. Duis ultricies tellus tortor, id sollicitudin nisl malesuada at. Phasellus maximus nisi non lacus cursus luctus. Maecenas vestibulum libero ac elit sagittis, eu rutrum risus rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet ligula eget enim auctor rhoncus in sed felis. Vestibulum pretium dignissim mauris vel efficitur. Morbi malesuada euismod nulla. Integer sit amet nunc facilisis, rhoncus tellus id, aliquet tellus.</p>
</div>

<div class='error'> This is an <b>error</b> div, with a long message and carrier return &lt;br&gt; :
Praesent interdum interdum orci, vitae feugiat lorem consequat id. Quisque lobortis tellus vitae eros pretium, ut scelerisque mauris pellentesque. Proin vehicula purus non velit dapibus suscipit. Proin dignissim sapien erat, at lobortis nulla ullamcorper tempor. Praesent posuere nulla ac ultricies pharetra. Morbi mattis vitae dui hendrerit imperdiet. Pellentesque sollicitudin purus sit amet nisi congue, sit amet consectetur risus scelerisque. Suspendisse porta, eros ac lacinia elementum, ipsum velit placerat justo, at pretium lorem sapien at arcu.</p>

<h2 id='second'>My second object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='third'>My third object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='forth'>My forth object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='fifth'>My fifth object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='sixth'>My sixth object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='seventh'>My seventh object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='eighth'>My eighth object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='nineth'>My nineth object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='tenth'>My tenth object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='eleventh'>My eleventh object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h2 id='twelveth'>An other object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h3 id='twelveth_detail'>with details</h3>

<p>Donec convallis nibh lorem, pretium egestas libero fringilla in. Suspendisse imperdiet tincidunt gravida. Donec non dapibus ante, varius ullamcorper enim. Nullam vel dapibus nibh, a convallis mauris. Sed vestibulum ex eget odio tristique consectetur. Pellentesque in porta ipsum, vel suscipit urna. Fusce dolor odio, iaculis ac egestas sed, molestie vel velit. Morbi egestas faucibus dui, eget lacinia urna porta id. Integer mattis malesuada maximus. In ultrices tortor ac dolor sollicitudin pellentesque.</p>

<h2 id='thirteenth'>An other object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h3 id='thirteenth_detail'>with details</h3>

<p>Donec convallis nibh lorem, pretium egestas libero fringilla in. Suspendisse imperdiet tincidunt gravida. Donec non dapibus ante, varius ullamcorper enim. Nullam vel dapibus nibh, a convallis mauris. Sed vestibulum ex eget odio tristique consectetur. Pellentesque in porta ipsum, vel suscipit urna. Fusce dolor odio, iaculis ac egestas sed, molestie vel velit. Morbi egestas faucibus dui, eget lacinia urna porta id. Integer mattis malesuada maximus. In ultrices tortor ac dolor sollicitudin pellentesque.</p>

<h2 id='forteenth'>An other object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

<h3 id='forteenth_detail'>with details</h3>

<p>Donec convallis nibh lorem, pretium egestas libero fringilla in. Suspendisse imperdiet tincidunt gravida. Donec non dapibus ante, varius ullamcorper enim. Nullam vel dapibus nibh, a convallis mauris. Sed vestibulum ex eget odio tristique consectetur. Pellentesque in porta ipsum, vel suscipit urna. Fusce dolor odio, iaculis ac egestas sed, molestie vel velit. Morbi egestas faucibus dui, eget lacinia urna porta id. Integer mattis malesuada maximus. In ultrices tortor ac dolor sollicitudin pellentesque.</p>

<h4 id='forteenth_detail_detail'>again more details</h3>

Text without paragraph

Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel lorem interdum, lacinia ligula ac, consectetur quam. Curabitur quis quam ac nunc venenatis tristique quis ut neque. Duis ultricies tellus tortor, id sollicitudin nisl malesuada at. Phasellus maximus nisi non lacus cursus luctus. Maecenas vestibulum libero ac elit sagittis, eu rutrum risus rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet ligula eget enim auctor rhoncus in sed felis. Vestibulum pretium dignissim mauris vel efficitur. Morbi malesuada euismod nulla. Integer sit amet nunc facilisis, rhoncus tellus id, aliquet tellus.

Praesent interdum interdum orci, vitae feugiat lorem consequat id. Quisque lobortis tellus vitae eros pretium, ut scelerisque mauris pellentesque. Proin vehicula purus non velit dapibus suscipit. Proin dignissim sapien erat, at lobortis nulla ullamcorper tempor. Praesent posuere nulla ac ultricies pharetra. Morbi mattis vitae dui hendrerit imperdiet. Pellentesque sollicitudin purus sit amet nisi congue, sit amet consectetur risus scelerisque. Suspendisse porta, eros ac lacinia elementum, ipsum velit placerat justo, at pretium lorem sapien at arcu.

Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.

Donec convallis nibh lorem, pretium egestas libero fringilla in. Suspendisse imperdiet tincidunt gravida. Donec non dapibus ante, varius ullamcorper enim. Nullam vel dapibus nibh, a convallis mauris. Sed vestibulum ex eget odio tristique consectetur. Pellentesque in porta ipsum, vel suscipit urna. Fusce dolor odio, iaculis ac egestas sed, molestie vel velit. Morbi egestas faucibus dui, eget lacinia urna porta id. Integer mattis malesuada maximus. In ultrices tortor ac dolor sollicitudin pellentesque.

Integer eu varius est, et egestas metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra ligula in justo ornare fringilla. Donec vitae velit euismod, luctus tortor id, sagittis elit. Cras sed magna non mauris lobortis sodales. Donec non vestibulum dui, vel commodo arcu. Nam lacus nisi, luctus sit amet semper bibendum, cursus sit amet tellus. Donec ullamcorper ac odio in suscipit. Vivamus porta ultrices commodo. Etiam vitae ultrices elit, vitae aliquet purus. Ut auctor aliquam massa. Morbi vel urna cursus, venenatis justo quis, pharetra velit. Pellentesque pellentesque ipsum metus, at convallis libero porta in.


<h2 id='fifteenth'>An other object</h2>

<p>
Again, a sql structure
</p>

<table><tr><th>  </th><th> fields </th><th> Type  </th><th> Default </th><th> Description  </th></tr>
<tr><td>  </td><td> id  </td><td> integer </td><td> NOT NULL  </td><td> unique auto increment id  </td></tr>
<tr><td>  </td><td> name  </td><td> varchar </td><td> "" </td><td> object name  </td></tr>
<tr><td>  </td><td> created_at  </td><td> datetime  </td><td> NOT NULL  </td><td> creation date </td></tr>
<tr><td>  </td><td> updated_at  </td><td> datetime  </td><td> NOT NULL  </td><td> updated date  </td></tr>
<tr><td>  </td><td> deleted_at  </td><td> datetime  </td><td> NULL  </td><td> deleted date  </td></tr>
<tr><td>  </td><td> status  </td><td> enum('active','inactive','deleted') </td><td> 'active' </td><td> status of the object  </td></tr>
</table>

<p> and more text:<br>
Sed eget auctor mauris, in auctor lorem. Donec maximus porta ante id tristique. Fusce imperdiet hendrerit tempor. Curabitur at maximus sem. Etiam vulputate non lacus ac placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vel tortor vel dui semper vestibulum eget vitae turpis. In blandit semper bibendum. Nulla nec lacinia nunc, non faucibus magna. Cras porta id sem non lobortis. Nunc vulputate ac elit et auctor. Duis ut leo est. Duis eu arcu eget purus tempus sollicitudin. Morbi non ultricies nisl.</p>

");

