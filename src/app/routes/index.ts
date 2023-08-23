import express from 'express';
import { academicSemesterRouter } from '../modules/academicSemester/academicSemester.routes';
import { buildingRoutes } from '../modules/building/building.route';
import { courseRoutes } from '../modules/courses/course.routes';
import { roomRoutes } from '../modules/room/room.route';
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
  {
    path: '/building',
    route: buildingRoutes,
  },
  {
    path: '/room',
    route: roomRoutes,
  },
  {
    path: '/course',
    route: courseRoutes,
  },
];

moduleRoutes.forEach(route => router.use(route.path, route.route));
export default router;
