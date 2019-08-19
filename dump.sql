CREATE TABLE `links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `short_url` varchar(256) DEFAULT '',
  `title` varchar(128) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `color` varchar(16) DEFAULT 'dark',
  `order` int(11) DEFAULT '0',
  `start_date` varchar(32) DEFAULT '',
  `end_date` varchar(32) DEFAULT '',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `links_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `links` (`link_id`, `user_id`, `url`, `title`, `date`, `hits`, `color`, `order`)
VALUES
	(3,1,'https://twitter.com/altumcode','My Twitter Account','2017-10-02 03:58:11',0,'', 0),
	(4,1,'https://altumcode.io/','My website','2017-10-02 04:01:44',0,'', 1),
	(5,1,'https://phpanalyzer.com/demo','phpAnalyzer','2017-10-02 04:01:56',0,'', 2),
	(6,1,'https://codecanyon.net/user/AltumCode','Portfolio','2017-10-02 04:02:08',0,'', 3);


CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `pages` (`page_id`, `title`, `url`, `description`, `position`)
VALUES
	(1,'Terms of Service','terms-of-service','<p>&nbsp;</p>\r\n<p>Your terms of service go here..</p>',0);


CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('PAYPAL','STRIPE') DEFAULT NULL,
  `payment_id` varchar(64) DEFAULT NULL,
  `payer_id` varchar(32) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `hits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hits_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_language` varchar(16) COLLATE utf8_unicode_ci DEFAULT 'english',
  `logo` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `time_zone` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'America/New_York',
  `meta_description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `banned_words` varchar(2560) COLLATE utf8_unicode_ci NOT NULL,
  `analytics_code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email_confirmation` int(11) NOT NULL DEFAULT '0',
  `email_pro_due_date` int(11) DEFAULT '0',
  `user_links_limit` int(11) DEFAULT '0',
  `links_pagination` int(11) NOT NULL DEFAULT '25',
  `links_allowed_prefixes` text COLLATE utf8_unicode_ci,
  `avatar_max_size` int(11) NOT NULL DEFAULT '2500000',
  `background_max_size` int(11) NOT NULL DEFAULT '2500000',
  `top_ads` varchar(2560) COLLATE utf8_unicode_ci NOT NULL,
  `bottom_ads` varchar(2560) COLLATE utf8_unicode_ci NOT NULL,
  `profile_ads` varchar(2560) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recaptcha` int(11) NOT NULL DEFAULT '1',
  `public_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `private_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_login` int(11) NOT NULL DEFAULT '0',
  `instagram_login` int(11) DEFAULT '0',
  `instagram_client_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `instagram_client_secret` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `facebook_app_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_app_secret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_host` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_user` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_pass` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_encryption` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_auth` int(11) DEFAULT '0',
  `smtp_from` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `instagram` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `store_currency` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `store_paypal_client_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `store_paypal_secret` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `store_paypal_mode` enum('sandbox', 'live') DEFAULT 'live' NULL,
  `store_stripe_publishable_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `store_stripe_secret_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `store_pro_price_month` float NOT NULL DEFAULT '4.99',
  `store_pro_price_year` float NOT NULL DEFAULT '19.99',
  `store_pro_features` text COLLATE utf8_unicode_ci,
  `store_pro_trial` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `settings` (`id`, `title`, links_allowed_prefixes, `store_pro_features`, `time_zone`, `meta_description`, `banned_words`, `analytics_code`, `email_confirmation`, `links_pagination`, `avatar_max_size`, `top_ads`, `bottom_ads`, `profile_ads`, `recaptcha`, `public_key`, `private_key`, `facebook_login`, `instagram_login`, `instagram_client_id`, `instagram_client_secret`, `facebook_app_id`, `facebook_app_secret`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_encryption`, `smtp_auth`, `smtp_from`, `facebook`, `twitter`, `instagram`, `youtube`, `store_currency`, `store_paypal_client_id`, `store_paypal_secret`, `store_stripe_publishable_key`, `store_stripe_secret_key`)
VALUES
  (1,'phpBioLinks', '["mailto", "tel"]', '{"store_pro_features_colored":false,"store_pro_features_verified":true,"store_pro_features_fb_pixel":true,"store_pro_features_bitly":true,"store_pro_features_background":true,"store_pro_features_ga":false,"store_pro_features_schedule":false}', 'America/New_York','','','',0,20,2000000,'','','',0,'','',0,0,'','','','','',587,'','','ssl',1,'no-reply@domain.com','','','','','USD','','','','');


CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `token_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_activation_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `lost_password_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `name` varchar(64) NOT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `avatar` varchar(38) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `background` varchar(38) DEFAULT '',
  `facebook` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `twitter` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `instagram` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `date` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `last_activity` datetime DEFAULT NULL,
  `points` float NOT NULL DEFAULT '0',
  `instagram_id` int(11) DEFAULT NULL,
  `pro` int(11) DEFAULT '0',
  `pro_trial_done` int(11) DEFAULT '0',
  `pro_due_date` datetime DEFAULT NULL,
  `pro_due_date_notified` int(11) DEFAULT '0',
  `fb_pixel` varchar(32) DEFAULT '',
  `bitly_token` varchar(64) DEFAULT '',
  `ga` varchar(16) DEFAULT '',
  PRIMARY KEY (`user_id`),
  KEY `users_username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `facebook_id`, `email_activation_code`, `lost_password_code`, `name`, `description`, `avatar`, `facebook`, `twitter`, `instagram`, `type`, `active`, `date`, `last_activity`, `points`, `instagram_id`)
VALUES
  (1,'Admin','$2y$10$9XQtzDwnYLIp4es0m97A8O6dFXzUiWLJMnT.mWvyqwg2CLWZFAuyG','admin@test.com',0,'0','0','John Doe','Here you can add your description..','45f342173cd4b5731bbc9bbffd935fdd.png','','','',1,1,'','2019-04-05',1,NULL);
