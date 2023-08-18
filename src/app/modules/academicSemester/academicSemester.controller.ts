import { AcademicSemester } from '@prisma/client';
import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import sendResponse from '../../../shared/sendResponse';
import { academicSemisterService } from './academicSemester.service';

const academiSemesterCreate = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const data = req.body;
    const result = await academicSemisterService.createAcademicSemester(data);
    sendResponse<AcademicSemester>(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: 'Academic semester Created',
      data: result,
    });
  } catch (error) {
    next(error);
  }
};
export const academicSemesterController = {
  academiSemesterCreate,
};
