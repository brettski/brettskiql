-- +goose Up
CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  username VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TYPE book_genre AS ENUM (
  'not set',
  'fiction',
  'non-fiction',
  'mystery',
  'romance',
  'science fiction',
  'fantasy',
  'horror',
  'biography',
  'history',
  'poetry',
  'other',
);

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(150) NOT NULL,
  pen_names VARCHAR(100)[],
  birth_date DATE,
  death_date DATE CHECK (death_date IS NULL OR death_date >= birth_date),
  url_image TEXT,
  url_reference TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE book (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  isbn VARCHAR(50) UNIQUE,
  published_date DATE,
  genre book_genre NOT NULL DEFAULT 'not set',
  page_count INTEGER CHECK (page_count > 0),
  url_reference TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE book_author (
  book_id INTEGER REFERENCES book(id) ON DELETE CASCADE,
  author_id INTEGER REFERENCES author(id) ON DELETE CASCADE,
  is_primary BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (book_id, author_id),
);

CREATE TABLE board_game (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  year_published INTEGER CHECK (year_published > 0),
  min_players INTEGER CHECK (min_players > 0),
  max_players INTEGER CHECK (max_players >= min_players),
  min_play_time INTEGER CHECK (min_play_time > 0),
  max_play_time INTEGER CHECK (max_play_time >= min_play_time),
  url_image TEXT,
  url_reference TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

-- Create indexes
CREATE INDEX idx_book_author_book_id ON book_author(book_id);
CREATE INDEX idx_book_author_author_id ON book_author(author_id);
CREATE INDEX idx_user_email ON "user"(email);
CREATE INDEX idx_user_username ON "user"(username);
CREATE INDEX idx_book_isbn ON book(isbn);

-- +goose Down
DROP TABLE IF EXISTS board_game;
DROP TABLE IF EXISTS book_author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS "user";
DROP TYPE IF EXISTS book_genre;
