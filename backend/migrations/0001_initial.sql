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
