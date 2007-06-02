BEGIN TRANSACTION;
CREATE TABLE articles_tags (
  "article_id" integer DEFAULT NULL,
  "tag_id" integer DEFAULT NULL
);
CREATE TABLE blacklist_patterns (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" varchar(255) DEFAULT NULL,
  "pattern" varchar(255) DEFAULT NULL
);
CREATE TABLE blogs (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "settings" text DEFAULT NULL,
  "base_url" varchar(255) DEFAULT NULL
);
CREATE TABLE categories (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "position" integer DEFAULT NULL,
  "permalink" varchar(255) DEFAULT NULL
);
CREATE TABLE categorizations (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "article_id" integer DEFAULT NULL,
  "category_id" integer DEFAULT NULL,
  "is_primary" boolean DEFAULT NULL
);
CREATE TABLE contents (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" varchar(255) DEFAULT NULL,
  "title" varchar(255) DEFAULT NULL,
  "author" varchar(255) DEFAULT NULL,
  "body" text DEFAULT NULL,
  "extended" text DEFAULT NULL,
  "excerpt" text DEFAULT NULL,
  "keywords" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "user_id" integer DEFAULT NULL,
  "permalink" varchar(255) DEFAULT NULL,
  "guid" varchar(255) DEFAULT NULL,
  "text_filter_id" integer DEFAULT NULL,
  "whiteboard" text DEFAULT NULL,
  "name" varchar(255) DEFAULT NULL,
  "published" boolean DEFAULT 'f',
  "allow_pings" boolean DEFAULT NULL,
  "allow_comments" boolean DEFAULT NULL,
  "blog_id" integer NOT NULL,
  "published_at" datetime DEFAULT NULL,
  "state" text DEFAULT NULL
);
CREATE TABLE feedback (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" varchar(255) DEFAULT NULL,
  "title" varchar(255) DEFAULT NULL,
  "author" varchar(255) DEFAULT NULL,
  "body" text DEFAULT NULL,
  "extended" text DEFAULT NULL,
  "excerpt" text DEFAULT NULL,
  "keywords" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "user_id" integer DEFAULT NULL,
  "permalink" varchar(255) DEFAULT NULL,
  "guid" varchar(255) DEFAULT NULL,
  "text_filter_id" integer DEFAULT NULL,
  "whiteboard" text DEFAULT NULL,
  "article_id" integer DEFAULT NULL,
  "email" varchar(255) DEFAULT NULL,
  "url" varchar(255) DEFAULT NULL,
  "ip" varchar(40) DEFAULT NULL,
  "blog_name" varchar(255) DEFAULT NULL,
  "name" varchar(255) DEFAULT NULL,
  "published" boolean DEFAULT 'f',
  "allow_pings" boolean DEFAULT NULL,
  "allow_comments" boolean DEFAULT NULL,
  "blog_id" integer NOT NULL,
  "published_at" datetime DEFAULT NULL,
  "state" text DEFAULT NULL,
  "status_confirmed" boolean DEFAULT NULL
);
CREATE TABLE notifications (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "content_id" integer DEFAULT NULL,
  "user_id" integer DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL
);
CREATE TABLE page_caches (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255) DEFAULT NULL
);
CREATE TABLE pings (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "article_id" integer DEFAULT NULL,
  "url" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL
);
CREATE TABLE redirects (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "from_path" varchar(255) DEFAULT NULL,
  "to_path" varchar(255) DEFAULT NULL
);
CREATE TABLE resources (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "size" integer DEFAULT NULL,
  "filename" varchar(255) DEFAULT NULL,
  "mime" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "article_id" integer DEFAULT NULL,
  "itunes_metadata" boolean DEFAULT NULL,
  "itunes_author" varchar(255) DEFAULT NULL,
  "itunes_subtitle" varchar(255) DEFAULT NULL,
  "itunes_duration" integer DEFAULT NULL,
  "itunes_summary" text DEFAULT NULL,
  "itunes_keywords" varchar(255) DEFAULT NULL,
  "itunes_category" varchar(255) DEFAULT NULL,
  "itunes_explicit" boolean DEFAULT NULL
);
CREATE TABLE sessions (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "sessid" varchar(255) DEFAULT NULL,
  "data" text DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL
);
INSERT INTO "sessions" VALUES(1, '87bbe168e2e38ad19a09fc0893b5952c', 'BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo
SGFzaHsABjoKQHVzZWR7AA==
', '2007-05-27 12:45:00', '2007-05-27 12:45:00');
INSERT INTO "sessions" VALUES(2, '43ab597fb1abea0ae040a7d81efa4490', 'BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo
SGFzaHsABjoKQHVzZWR7AA==
', '2007-05-27 12:49:18', '2007-05-27 12:49:18');
INSERT INTO "sessions" VALUES(3, 'b4fdb3cb988d967eb44056c6f11d07f3', 'BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo
SGFzaHsABjoKQHVzZWR7AA==
', '2007-05-27 12:51:58', '2007-05-27 12:51:58');
CREATE TABLE sidebars (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "active_position" integer DEFAULT NULL,
  "config" text DEFAULT NULL,
  "staged_position" integer DEFAULT NULL,
  "type" varchar(255) DEFAULT NULL,
  "blog_id" integer DEFAULT NULL
);
INSERT INTO "sidebars" VALUES(1, 0, '--- !map:HashWithIndifferentAccess 
      empty: false
      count: true', NULL, NULL, NULL);
INSERT INTO "sidebars" VALUES(2, 1, '--- !map:HashWithIndifferentAccess 
      title: Links
      body: |+
        <ul>
          <li><a href="http://www.typosphere.org" title="Typo">Typo</a></li>
          <li><a href="http://scottstuff.net" title="Scottstuff">scottstuff.net</a></li>
          <li><a href="http://www.bofh.org.uk" title="Just a Summary">Just A Summary</a></li>
          <li><a href="http://kevin.sb.org/">Kevin Ballard</a></li>
          <li><a href="http://fredericdevillamil.com">Frédéric de Villamil</a></li>
          <li><a href="http://typoforums.org" title="Typo Forums">Typo Forums</a></li>
        </ul>', NULL, NULL, NULL);
INSERT INTO "sidebars" VALUES(3, 2, '--- !map:HashWithIndifferentAccess 
      format: rss20
      trackbacks: true
      comments: true
      articles: true', NULL, NULL, NULL);
CREATE TABLE sitealizer (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "path" varchar(255) DEFAULT NULL,
  "ip" varchar(255) DEFAULT NULL,
  "referer" varchar(255) DEFAULT NULL,
  "language" varchar(255) DEFAULT NULL,
  "user_agent" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "created_on" date DEFAULT NULL
);
CREATE TABLE tags (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "created_at" datetime DEFAULT NULL,
  "updated_at" datetime DEFAULT NULL,
  "display_name" varchar(255) DEFAULT NULL
);
CREATE TABLE text_filters (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "description" varchar(255) DEFAULT NULL,
  "markup" varchar(255) DEFAULT NULL,
  "filters" text DEFAULT NULL,
  "params" text DEFAULT NULL
);
INSERT INTO "text_filters" VALUES(1, 'none', 'None', 'none', '--- []
', '--- {}
');
INSERT INTO "text_filters" VALUES(2, 'markdown', 'Markdown', 'markdown', '--- []
', '--- {}
');
INSERT INTO "text_filters" VALUES(3, 'smartypants', 'SmartyPants', 'none', '--- 
- :smartypants
', '--- {}
');
INSERT INTO "text_filters" VALUES(4, 'markdown smartypants', 'Markdown with SmartyPants', 'markdown', '--- 
- :smartypants
', '--- {}
');
INSERT INTO "text_filters" VALUES(5, 'textile', 'Textile', 'textile', '--- []
', '--- {}
');
CREATE TABLE triggers (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "pending_item_id" integer DEFAULT NULL,
  "pending_item_type" varchar(255) DEFAULT NULL,
  "due_at" datetime DEFAULT NULL,
  "trigger_method" varchar(255) DEFAULT NULL
);
CREATE TABLE users (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "login" varchar(255) DEFAULT NULL,
  "password" varchar(255) DEFAULT NULL,
  "email" text DEFAULT NULL,
  "name" text DEFAULT NULL,
  "notify_via_email" boolean DEFAULT NULL,
  "notify_on_new_articles" boolean DEFAULT NULL,
  "notify_on_comments" boolean DEFAULT NULL,
  "notify_watch_my_articles" boolean DEFAULT NULL,
  "notify_via_jabber" boolean DEFAULT NULL,
  "jabber" varchar(255) DEFAULT NULL
);
CREATE TABLE schema_info (
  "version" integer DEFAULT NULL
);
INSERT INTO "schema_info" VALUES(62);
CREATE INDEX "index_blacklist_patterns_on_pattern" ON blacklist_patterns ("pattern");
CREATE INDEX "index_categories_on_permalink" ON categories ("permalink");
CREATE INDEX "index_contents_on_blog_id" ON contents ("blog_id");
CREATE INDEX "index_contents_on_text_filter_id" ON contents ("text_filter_id");
CREATE INDEX "index_contents_on_published" ON contents ("published");
CREATE INDEX "index_feedback_on_text_filter_id" ON feedback ("text_filter_id");
CREATE INDEX "index_feedback_on_article_id" ON feedback ("article_id");
CREATE INDEX "index_page_caches_on_name" ON page_caches ("name");
CREATE INDEX "index_pings_on_article_id" ON pings ("article_id");
CREATE INDEX "index_sessions_on_sessid" ON sessions ("sessid");
COMMIT;
