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
  (5, 1, 1, "Category 1 - Page 4 - long text page", "<h1>INTRODUCTION</h1>

<p>Here is decribe all objects of structure shared by all client (like channel)</p>
<p>It is here also that are store list of agencies and accounts</p>
<h1>ADMINISTRATION OBJECTS</h1>

<h2>account</h2>
<p><i>AdvertiserServerApiStructure/account functions</i></p>
<p>Account definition</p>
<table><tr><th>  </th><th> Account fields               </th><th> Type                     </th><th> Right       </th><th> Description                              </th></tr>
<tr><td>  </td><td> id                           </td><td> integer                  </td><td> ro          </td><td> unique account id                        </td></tr>
<tr><td>  </td><td> label                        </td><td> string                   </td><td> rw          </td><td> account label (creation required)        </td></tr>
<tr><td>  </td><td> country_id                   </td><td> integer                  </td><td> rw          </td><td> account has a country_id                 </td></tr>
<tr><td>  </td><td> host                         </td><td> string                   </td><td> rw          </td><td> default is solution.weborama.fr          </td></tr>
<tr><td>  </td><td> created_at                   </td><td> datetime                 </td><td> ro          </td><td> creation date                            </td></tr>
<tr><td>  </td><td> updated_at                   </td><td> datetime                 </td><td> ro          </td><td> updated date                             </td></tr>
<tr><td>  </td><td> deleted_at                   </td><td> datetime                 </td><td> ro          </td><td> deleted date                             </td></tr>
<tr><td>  </td><td> timezone_id                  </td><td> integer                  </td><td> ro          </td><td> timezone                                 </td></tr>
<tr><td>  </td><td> status                       </td><td> enum('active','deleted') </td><td> ro          </td><td> status                                   </td></tr>
<tr><td>  </td><td> objects_updated_at           </td><td> datetime                 </td><td> ro          </td><td> objects of account updated date          </td></tr>
<tr><td>  </td><td> postclick_tracking_days      </td><td> integer                  </td><td> rw          </td><td> account has postclick_tracking_days      </td></tr>
<tr><td>  </td><td> postevent_tracking_days      </td><td> integer                  </td><td> rw          </td><td> account has postevent_tracking_days      </td></tr>
<tr><td>  </td><td> postimpression_tracking_days </td><td> integer                  </td><td> rw          </td><td> account has postimpression_tracking_days </td></tr>
<tr><td>  </td><td> postview_tracking_days       </td><td> integer                  </td><td> rw          </td><td> account has postview_tracking_days       </td></tr>
<tr><td>  </td><td> visibility_percentage        </td><td> integer                  </td><td> rw          </td><td> account has visibility_percentage        </td></tr>
<tr><td>  </td><td> visibility_time              </td><td> integer                  </td><td> rw          </td><td> account has visibility_time              </td></tr>
<tr><td>  </td><td> is_visibility_activated      </td><td> enum('YES','NO','Adloox')</td><td> rw          </td><td> account has is_visibility_activated      </td></tr>
<tr><td>  </td><td> last_segment_computed        </td><td> string                   </td><td> rw          </td><td> account has last_segment_computed        </td></tr>
<tr><td>  </td><td> is_datamining_activated      </td><td> enum('YES','NO')         </td><td> rw          </td><td> account has is_datamining_activated      </td></tr>
<tr><td>  </td><td> mail_template_for_send_tags  </td><td> text                     </td><td> rw          </td><td> account has mail_template_for_send_tags  </td></tr>
<tr><td>  </td><td> rtb_budget_max               </td><td> float                    </td><td> rw          </td><td> rtb_budget_max                           </td></tr>
<tr><td>  </td><td> is_rtb_activated             </td><td> enum('YES','NO')         </td><td> rw          </td><td> account has is_rtb_activated             </td></tr>
<tr><td>  </td><td> percentage_rtb_margin        </td><td> integer                  </td><td> rw          </td><td> rtb margin                               </td></tr>
<tr></tr>
<tr><td>  </td><td> datamining_columns           </td><td> text                     </td><td> rw          </td><td> JSON of datamining columns per view      </td></tr>
<tr><td>  </td><td> datamining_compression       </td><td> enum('zip64','targz')    </td><td> rw          </td><td> compression type of datamining files     </td></tr>
<tr><td>  </td><td> datamining_grouping_file     </td><td> enum('day','hour')       </td><td> rw          </td><td> type of datamining files                 </td></tr>
<tr><td>  </td><td> datamining_encrypt_userid    </td><td> enum('YES','NO')         </td><td> rw          </td><td> enable encryption of uid                 </td></tr>
<tr><td>  </td><td> last_activity_at             </td><td> datetime                 </td><td> rw          </td><td> last hit date on account                 </td></tr>
<tr><td>  </td><td> is_sociodemo_activated       </td><td> enum('YES','NO')         </td><td> rw          </td><td> is socio demo activated                  </td></tr>
<tr><td>  </td><td> url_builder_enabled          </td><td> enum('YES','NO')         </td><td> rw          </td><td> is url builder activated                 </td></tr>
<tr><td>  </td><td> url_builder                    </td><td> text                     </td><td> rw          </td><td> url_builder                </td></tr>
</table>

<p>objects_updated_at is updated to now when an object of the account is updated</p>
<p><b>Validation rules :</b><br> Activity sector and country must be set on creation and can not be change after.<br> Label must not be null or empty</p>
<p><b>Relationships :</b><br> An account has and belongs to Agencies</p>
<h2>ad_server</h2>
<p><i>AdvertiserServerApiStructure/ad_server functions</i></p>
<p>Ad_server table is :</p>
<table><tr><th>  </th><th> Ad_server fields </th><th> Type                </th><th> Right       </th><th> Description                  </th></tr>
<tr><td>  </td><td> id               </td><td> integer             </td><td> ro          </td><td> unique ad server id          </td></tr>
<tr><td>  </td><td> label            </td><td> string              </td><td> rw          </td><td> ad server label              </td></tr>
<tr><td>  </td><td> weak_encoding    </td><td> enum('YES', 'NO')   </td><td> rw          </td><td> ad_server weak_encoding      </td></tr>
<tr><td>  </td><td> click_macro      </td><td> string              </td><td> rw          </td><td> ad server click macro        </td></tr>
<tr><td>  </td><td> ramdom_macro     </td><td> string              </td><td> rw          </td><td> ramdom_macro                 </td></tr>
</table>

<p><b>Validation rules :</b><br> Label can not be null or empty<br> Label must be unique</p>
<p><b>Relationships :</b><br> Ad_server has many ad_spaces</p>
<h2>browsers</h2>
<p><i>AdvertiserServerApiStructure/browsers functions</i></p>
<p>Browsers definition</p>
<table><tr><th>  </th><th> Browser fields          </th><th> Type         </th><th> Right       </th><th> Description              </th></tr>
<tr><td>  </td><td> id                      </td><td> integer      </td><td> ro          </td><td> unique partnership id    </td></tr>
<tr><td>  </td><td> label                   </td><td> string       </td><td> rw          </td><td> partnership label        </td></tr>
<tr><td>  </td><td> user_agent_name         </td><td> string       </td><td> rw          </td><td> user_agent_name          </td></tr>
<tr><td>  </td><td> user_agent_version      </td><td> string       </td><td> rw          </td><td> user_agent_version       </td></tr>
</table>

<p><b>Validation rules :</b><br> Label can not be null or empty<br> Label must be unique</p>
<h2>channel</h2>
<p><i>AdvertiserServerApiStructure/channel functions</i></p>
<p>Channel allow user to define the type of his campaign :
  * Display
  * Search
  * Affiliation
  * Direct Marketing
  * Auto Promotion</p>
<p>Channel table is :</p>
<table><tr><th>  </th><th> Channel fields </th><th> Type                </th><th> Right       </th><th> Description                                                </th></tr>
<tr><td>  </td><td> id             </td><td> integer             </td><td> ro          </td><td> unique channel id                                          </td></tr>
<tr><td>  </td><td> label          </td><td> string              </td><td> rw          </td><td> channel label (creation required)                          </td></tr>
<tr><td>  </td><td> abbreviation   </td><td> string              </td><td> rw          </td><td> channel abbreviation                                       </td></tr>
<tr><td>  </td><td> is_visible     </td><td> enum('YES','NO')    </td><td> rw          </td><td> is chennel must be visible in the administration interface </td></tr>
</table>

<p><b>Validation rules :</b><br> Label can not be null or empty<br> Label must be unique</p>
<h3>channel_detail</h3>
<pre>    {
      channel_fields =&gt; { ... },
      nb_of_campaign =&gt; x,
    }</pre>

<h2>delivery_format</h2>
<p><i>AdvertiserServerApiStructure/delivery_format functions</i></p>
<p>Delivery format table definition.</p>
<table><tr><th>  </th><th> Delivery format fields  </th><th> Type                        </th><th> Right       </th><th> Description                               </th></tr>
<tr><td>  </td><td> id                      </td><td> integer                     </td><td> ro          </td><td> unique delivery format id                 </td></tr>
<tr><td>  </td><td> label                   </td><td> string                      </td><td> rw          </td><td> delivery format label (creation required) </td></tr>
<tr><td>  </td><td> insertion_type          </td><td> enum('creative','tracking') </td><td> rw          </td><td> delivery format insertion type            </td></tr>
<tr><td>  </td><td> abbreviation            </td><td> string                      </td><td> rw          </td><td> delivery format abbreviation              </td></tr>
<tr><td>  </td><td> key_label               </td><td> string                      </td><td> rw          </td><td> unique delivery format key                </td></tr>
</table>

<p><b>Validation rules :</b><br> Label can not be null or empty<br> Label must be unique<br> key_label must be unique</p>
<p><b>Relationships :</b><br> Delivery format has many insertions.</p>
<h2>device</h2>
<p>Here is the table which describe all devices</p>
<p>Devices table</p>
<table><tr><th>  </th><th> Devices  fields               </th><th> Type      </th><th> Right </th><th> Description   </th></tr>
<tr><td>  </td><td> id                            </td><td> integer   </td><td> ro    </td><td> unique id     </td></tr>
<tr><td>  </td><td> label                         </td><td> string    </td><td> ro    </td><td> label         </td></tr>
</table>

<p><b>Validation rules :</b><br> The label should be unique</p>
<h2>isp</h2>
<p><i>AdvertiserServerApiStructure/isp functions</i></p>
<p>Isps table definition</p>
<table><tr><th>  </th><th> Isps fields     </th><th> Type    </th><th> Right </th><th> Description          </th></tr>
<tr><td>  </td><td> id              </td><td> integer </td><td> ro    </td><td> unique isp id        </td></tr>
<tr><td>  </td><td> label           </td><td> string  </td><td> rw    </td><td> label of isps        </td></tr>
<tr><td>  </td><td> isp_regexp      </td><td> string  </td><td> rw    </td><td> regexp of isps       </td></tr>
<tr><td>  </td><td> country_code3   </td><td> string  </td><td> rw    </td><td> country of isp       </td></tr>
</table>

<p><b>Validation rules :</b><br> label can not be null or empty<br> label, country_code3 must be unique</p>
<h2>position</h2>
<p><i>AdvertiserServerApiStructure/position functions</i></p>
<p>positions definition</p>
<table><tr><th>  </th><th> Positions fields           </th><th> Type         </th><th> Right       </th><th> Description         </th></tr>
<tr><td>  </td><td> id                         </td><td> integer      </td><td> ro          </td><td> unique position id  </td></tr>
<tr><td>  </td><td> label                      </td><td> string       </td><td> rw          </td><td> label               </td></tr>
</table>

<p><b>Validation rules :</b><br> Label must be set.<br> Label must be unique.</p>
<h2>operating_system</h2>
<p>operating_system definition</p>
<table><tr><th>  </th><th> Operating_system fields    </th><th> Type         </th><th> Right       </th><th> Description         </th></tr>
<tr><td>  </td><td> id                         </td><td> integer      </td><td> ro          </td><td> unique position id  </td></tr>
<tr><td>  </td><td> label                      </td><td> string       </td><td> rw          </td><td> label               </td></tr>
<tr><td>  </td><td> user_agent_name            </td><td> string       </td><td> rw          </td><td> user_agent name     </td></tr>
<tr><td>  </td><td> user_agent_family          </td><td> string       </td><td> rw          </td><td> user_agent family   </td></tr>
</table>

<p><b>Validation rules :</b><br> Label must be set.<br> Label must be unique.</p>
<h2>section</h2>
<p><i>AdvertiserServerApiStructure/section functions</i></p>
<p>sections definition</p>
<table><tr><th>  </th><th> Sections fields           </th><th> Type         </th><th> Right       </th><th> Description         </th></tr>
<tr><td>  </td><td> id                         </td><td> integer      </td><td> ro          </td><td> unique position id  </td></tr>
<tr><td>  </td><td> label                      </td><td> string       </td><td> rw          </td><td> label               </td></tr>
</table>

<p><b>Validation rules :</b><br> Label must be set.<br> Label must be unique.</p>
<h2>size</h2>
<p><i>AdvertiserServerApiStructure/size functions</i></p>
<p>size definition</p>
<p>rule to get or create size<br> prefix 'js_' if it is javascript tag<br> size 'width'x'height'
...</p>
<p>sizes table definition.</p>
<table><tr><th>  </th><th> Size fields     </th><th> Type         </th><th> Right       </th><th> Description                              </th></tr>
<tr><td>  </td><td> id              </td><td> integer      </td><td> ro          </td><td> unique size id                           </td></tr>
<tr><td>  </td><td> label           </td><td> string       </td><td> rw          </td><td> size label default (header_width_height) </td></tr>
<tr><td>  </td><td> width           </td><td> integer      </td><td> rw          </td><td> width of size                            </td></tr>
<tr><td>  </td><td> height          </td><td> integer      </td><td> rw          </td><td> height of size                           </td></tr>
<tr><td>  </td><td> is_generic      </td><td> enum('YES', 'NO') </td><td> rw          </td><td> is generic flag                          </td></tr>
<tr><td>  </td><td> header          </td><td> L&lt;/Header&gt;   </td><td> rw          </td><td> header sort of size                      </td></tr>
</table>

<p><b>Validation rules :</b><br> Label can not be null or empty<br> Label must be unique<br> width, height and header field group must be unique</p>
<p><b>Relationships :</b><br> Size has many delivery formats.<br> and cross schema :<br> Size has many ad elements.<br> Size has many ad positions.<br> Size has many files.<br> Size has many placements.</p>
<h2>hour</h2>
<p>Hour table to be used by DimensionFilter</p>
<table><tr><th>  </th><th> hour fields </th><th> Type    </th><th> Right </th><th> Description                   </th></tr>
<tr><td>  </td><td> id          </td><td> integer </td><td> ro    </td><td> unique delivery format id     </td></tr>
<tr><td>  </td><td> hour        </td><td> integer </td><td> ro    </td><td> unique delivery format id     </td></tr>
<tr><td>  </td><td> label       </td><td> string  </td><td> ro    </td><td> unique delivery format id     </td></tr>
<tr><td>  </td><td> key_label   </td><td> string  </td><td> rw    </td><td> key_label of hour             </td></tr>
</table>

<p>Exemple :<br> id: 1<br> hour: 0<br> label: hour from 00h00'00 to 00h59'59<br> key_label: 00::00::00</p>
<p><b>Validation rules :</b><br> hour is uniq</p>
<h2>numeric_capping</h2>
<table><tr><th>  </th><th> NumericCapping fields   </th><th> Type       </th><th> Right       </th><th> Description        </th></tr>
<tr><td>  </td><td> id                      </td><td> integer    </td><td> ro          </td><td> id                 </td></tr>
<tr><td>  </td><td> label                   </td><td> string     </td><td> ro          </td><td> metrics label      </td></tr>
<tr><td>  </td><td> key_label               </td><td> string     </td><td> ro          </td><td> key_label          </td></tr>
</table>

<p><b>Validation rules :</b><br> Label must be unique.<br> Key_label must be unique.</p>
");

