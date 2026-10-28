<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/ahmed/stock_facile/brouillon.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="2543"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><table title="categories" custom_title="0" dock_id="1" table="4,10:maincategories"/><dock_state state="000000ff00000000fd00000001000000020000000000000000fc0100000001fb000000160064006f0063006b00420072006f00770073006500310100000000ffffffff0000011600ffffff000000000000000000000004000000040000000800000008fc00000000"/><default_encoding codec=""/><browse_table_settings/></tab_browse><tab_sql><sql name="SQL 1*">INSERT INTO categories (nom, description) VALUES
  ('Alimentation', 'Produits secs et conserves'),
  ('Boissons',     'Eaux, jus et sodas'),
  ('Hygiène',      'Savons et produits d''entretien'),
  ('Papeterie',    'Cahiers, stylos et fournitures');

INSERT INTO produits (nom, prix, quantite, disponible, date_ajout, categorie_id) VALUES
  ('Huile d''olive 1 L',   18.500,  24, 1, '2026-10-01T09:00:00', 1),
  ('Couscous moyen 1 kg',   2.300,  40, 1, '2026-10-01T09:05:00', 1),
  ('Eau minérale 1,5 L',    0.850, 120, 1, '2026-10-02T10:00:00', 2),
  ('Jus d''orange 1 L',     3.200,   0, 0, '2026-10-02T10:10:00', 2),
  ('Savon de Marseille',    2.900,  15, 1, '2026-10-03T11:00:00', 3),
  ('Cahier 96 pages',       1.600,  60, 1, '2026-10-04T08:30:00', 4);
</sql><current_tab id="0"/></tab_sql></sqlb_project>
