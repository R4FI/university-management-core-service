import express from 'express';
import { academicSemesterRouter } from '../modules/academicSemester/academicSemester.routes';
import { studentRoute } from '../modules/students/student.route';

const router = express.Router();

const moduleRoutes = [
  // ... routes
  {
    path: '/academic-semester',
    route: academicSemesterRouter,
  },
  {
    path: '/student',
    route: studentRoute,
  },
];

moduleRoutes.forEach(route => router.use(route.path, route.route));
export default router;
