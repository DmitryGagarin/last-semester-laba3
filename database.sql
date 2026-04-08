

CREATE TABLE IF NOT EXISTS video_cards (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    price       REAL NOT NULL,
    description TEXT,
    created_at  TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS cart (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id  INTEGER NOT NULL REFERENCES video_cards(id),
    qty         INTEGER NOT NULL DEFAULT 1,
    created_at  TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS orders (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    total       REAL NOT NULL,
    created_at  TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id    INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_name TEXT NOT NULL,
    qty         INTEGER NOT NULL,
    price       REAL NOT NULL
);

-- Минимальные данные для тестов
DELETE FROM video_cards;
INSERT INTO video_cards (name, price, description, created_at) VALUES
  ('NVIDIA GeForce RTX 5090', 230000.00, 'Флагманская видеокарта 2026 года.', '2026-01-15 10:00:00'),
  ('NVIDIA GeForce RTX 4090', 165000.00, 'Мощная видеокарта для рейтрейсинга.', '2026-01-15 10:00:00'),
  ('NVIDIA GeForce RTX 5080', 130000.00, 'Высокая производительность для 4K.', '2026-01-15 10:00:00'),
  ('AMD Radeon RX 9070 XT', 95000.00, 'Лучшее соотношение цена/производительность.', '2026-01-15 10:00:00'),
  ('NVIDIA GeForce RTX 4080 Super', 115000.00, 'Мощная видеокарта для 4K с DLSS.', '2026-01-15 10:00:00');