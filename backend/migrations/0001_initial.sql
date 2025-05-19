CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE modules (
  id SERIAL PRIMARY KEY,
  no TEXT,
  title TEXT,
  course_id INTEGER,
  FOREIGN KEY(course_id) REFERENCES courses(id)
);

CREATE TABLE episodes (
  id SERIAL PRIMARY KEY,
  no TEXT,
  title TEXT,
  content TEXT,
  module_id INTEGER,
  FOREIGN KEY(module_id) REFERENCES modules(id)
);

CREATE TYPE EPISODE AS (
  id INTEGER,
  no TEXT,
  title TEXT,
  content TEXT
);

CREATE TYPE MODULE AS (
  id INTEGER,
  no TEXT,
  title TEXT,
  episodes EPISODE[]
);

CREATE TYPE COURSE AS (
  id INTEGER,
  name TEXT,
  modules MODULE[]
);
