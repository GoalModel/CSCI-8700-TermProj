CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "matters" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name_or_type" varchar, "location" varchar, "acquired_date" date, "value" integer, "loaned_to" varchar, "loaned_date" date, "description" text, "notes" text, "upc_barcode" integer, "title" varchar, "released_date" date, "format" varchar, "artist_or_band" varchar, "track_list" text, "amateur" boolean, "lineage" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20171018102359');

