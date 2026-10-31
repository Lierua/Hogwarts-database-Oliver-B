import pool from "../../db.js";

export const getAllCourses = async () => {
  const result = await pool.query(`
    SELECT
      s.id,
      s.course,
      h.teacher_name,
      COALESCE(
        json_agg(c.student_name) FILTER (WHERE c.id IS NOT NULL),
        '[]'::json
      ) AS students
    FROM hogwarts.courses AS s
    LEFT JOIN hogwarts.teachers AS h
      ON s.teacher = h.id
    LEFT JOIN hogwarts.course_student_ft AS cs
      ON s.id = cs.course_fk
    LEFT JOIN hogwarts.students AS c
      ON cs.student_fk = c.id
    GROUP BY s.id, s.course, h.teacher_name
  `);

  return result.rows;
};

export const getCourseByID = async (id) => {
  const result = await pool.query(
    `SELECT
      s.id,
      s.course,
      h.teacher_name,
      COALESCE(
        json_agg(c.student_name) FILTER (WHERE c.id IS NOT NULL),
        '[]'::json
      ) AS students
    FROM hogwarts.courses AS s
    LEFT JOIN hogwarts.teachers AS h
      ON s.teacher = h.id
    LEFT JOIN hogwarts.course_student_ft AS cs
      ON s.id = cs.course_fk
    LEFT JOIN hogwarts.students AS c
      ON cs.student_fk = c.id
    WHERE s.id = $1
    GROUP BY s.id, s.course, h.teacher_name
    `,
    [id],
  );

  return result.rows[0] ?? null;
};

export const createCourse = async (course, teacher) => {
  const result = await pool.query(
    `
      INSERT INTO hogwarts.courses
        (course, teacher)
      VALUES ($1, $2, $3)
      RETURNING id, course, teacher
    `,
    [course, teacher],
  );

  return result.rows[0];
};

export const updateCourse = async (id, course) => {
  const result = await pool.query(
    `UPDATE hogwarts.courses
     SET course = $2,
     WHERE id = $1
     RETURNING id, course`,
    [id, course, teacher],
  );

  return result.rows[0] ?? null;
};

export const updateCourseTeacher = async (id, teacher) => {
  const result = await pool.query(
    `UPDATE hogwarts.courses
     SET teacher = $2
     WHERE id = $1
     RETURNING id, teacher`,
    [id, teacher],
  );

  return result.rows[0] ?? null;
};

export const AddCourseStudents = async (course_fk, student_fk) => {
  const result = await pool.query(
    `INSERT INTO hogwarts.course_student_ft
      (course_fk, student_fk)
     VALUES ($1, $2)
     RETURNING course_fk, student_fk`,
    [course_fk, student_fk],
  );

  return result.rows[0] ?? null;
};

export const deleteCourseFromDB = async (id) => {
  const result = await pool.query(
    `DELETE FROM hogwarts.courses
     WHERE id = $1
     RETURNING id, course, teacher`,
    [id],
  );

  return result.rows[0] ?? null;
};
