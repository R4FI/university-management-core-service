import express from 'express';
import validateRequest from '../../middlewares/validateRequest';
import { AcademicSemesterValidation } from './academic.semester.validation';
import { academicSemesterController } from './academicSemester.controller';
const router = express.Router();

router.get('/:id', academicSemesterController.getSingleAcademicSemesterCreate);
router.get('/', academicSemesterController.getAcademicSemester);
router.post(
  '/',
  validateRequest(AcademicSemesterValidation.create),
  academicSemesterController.academicSemesterCreate
);
export const academicSemesterRouter = router;
