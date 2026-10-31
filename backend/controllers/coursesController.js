import {
  getAllCourses,
  getCourseByID,
  createCourse,
  updateCourse,
  updateCourseTeacher,
  AddCourseStudents,
  deleteCourseFromDB,
} from "../repositories/coursesRepository.js";

export const getCourses = async (req, res) => {
  try {
    const courses = await getAllCourses();

    res.status(200).json(courses);
  } catch (err) {
    console.error(err);

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};

export const getCourse = async (req, res) => {
  try {
    const course = await getCourseByID(req.params.id);

    if (!course) {
      return res.status(404).json({
        error: "Course not found",
      });
    }

    res.status(200).json(course);
  } catch (err) {
    console.error(err);

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};

export const postCourse = async (req, res) => {
  const { course, teacher } = req.body;

  try {
    const courses = await createCourse(course, teacher);

    res.status(201).json(courses);
  } catch (err) {
    console.error(err);

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};

export const putCourse = async (req, res) => {
  const id = req.params.id;
  const { course } = req.body;

  try {
    const courses = await updateCourse(id, course);

    if (!courses) {
      return res.status(404).json({
        error: "Course not found",
      });
    }

    res.status(200).json(courses);
  } catch (err) {
    console.error(err);

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};

export const putCourseTeacher = async (req, res) => {
  const id = req.params.id;
  const { teacher } = req.body;

  try {
    const courses = await updateCourseTeacher(id, teacher);

    if (!courses) {
      return res.status(404).json({
        error: "Course not found",
      });
    }

    res.status(200).json(courses);
  } catch (err) {
    console.error(err);

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};

export const addstudent = async (req, res) => {
  const { course_fk, student_fk } = req.body;

  if (!course_fk || !student_fk) {
    return res.status(400).json({
      error: "Both course_fk and student_fk are required",
    });
  }

  try {
    const result = await AddCourseStudents(course_fk, student_fk);

    res.status(201).json(result);
  } catch (err) {
    console.error(err);

    if (err.code === "23503") {
      return res.status(404).json({
        error: "Course or student not found",
      });
    }

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};

export const deleteCourse = async (req, res) => {
  const id = req.params.id;

  try {
    const courses = await deleteCourseFromDB(id);

    if (!courses) {
      return res.status(404).json({
        error: "Course not found",
      });
    }

    res.status(200).json(course);
  } catch (err) {
    console.error(err);

    res.status(500).json({
      error: "Database error",
      code: err.code,
    });
  }
};
