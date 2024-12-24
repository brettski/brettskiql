-- +goose Up
CREATE TABLE user (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255),
  username VARCHAR(255),
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
);

CREATE TYPE book_genre AS ENUM ('not set');

CREATE TABLE book (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  author INTEGER REFERENCES authors(id),
  isbn VARCHAR(50),
  published_date,
  genre book_genre NOT NULL DEFAULT 'not set', -- enum
  page_count INTEGER,
  url_reference TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

);

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(150),
  pen_names VARCHAR(100)[],
  birth_date DATE,
  death_date DATE,
  url_reference TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
)



-- +goose Down
DROP TABLE users;
DROP TABLE book;
DROP TABLE author;
