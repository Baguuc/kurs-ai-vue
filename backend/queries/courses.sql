--! insert_course
INSERT INTO courses (name) VALUES (:name);

--! list_courses
SELECT
  courses.id,
  courses.name,
  ARRAY_AGG(CAST(ROW(tmp.id, tmp.no, tmp.title, tmp.episodes) AS MODULE)) as modules
FROM (
  SELECT
    modules.id AS id,
    modules.no AS no,
    modules.title AS title,
    array_agg(CAST(ROW(episodes.id, episodes.no, episodes.title, episodes.content) AS EPISODE)) AS episodes,
    modules.course_id as course_id
  FROM
    courses
  INNER JOIN
    modules
  ON
    modules.course_id = courses.id
  INNER JOIN
    episodes
  ON
    episodes.module_id = modules.id
  GROUP BY
    modules.id
) tmp
INNER JOIN
  courses
ON
  courses.id = tmp.course_id
GROUP BY
  courses.id;

--! fetch_course
SELECT
  courses.id,
  courses.name,
  ARRAY_AGG(CAST(ROW(tmp.id, tmp.no, tmp.title, tmp.episodes) AS MODULE)) as modules
FROM (
  SELECT
    modules.id AS id,
    modules.no AS no,
    modules.title AS title,
    array_agg(CAST(ROW(episodes.id, episodes.no, episodes.title, episodes.content) AS EPISODE)) AS episodes,
    modules.course_id as course_id
  FROM
    courses
  INNER JOIN
    modules
  ON
    modules.course_id = courses.id
  INNER JOIN
    episodes
  ON
    episodes.module_id = modules.id
  GROUP BY
    modules.id
) tmp
INNER JOIN
  courses
ON
  courses.id = tmp.course_id
WHERE
  courses.id = :course_id
GROUP BY
  courses.id;
