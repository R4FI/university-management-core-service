import { AcademicSemester } from '@prisma/client';
import { Request, Response } from 'express';
import httpStatus from 'http-status';
import catchAsync from '../../../shared/catchAsync';
import pick from '../../../shared/pick';
import sendResponse from '../../../shared/sendResponse';
import { AcademicSemesterFilterableFields } from './academic.semester.constant';
import { academicSemesterService } from './academicSemester.service';

const academicSemesterCreate = catchAsync(
  async (req: Request, res: Response) => {
    const data = req.body;
    const result = await academicSemesterService.createAcademicSemester(data);
    sendResponse<AcademicSemester>(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: 'Academic semester Created',
      data: result,
    });
  }
);
const getAcademicSemester = catchAsync(async (req: Request, res: Response) => {
  const filters = pick(req.query, [
    'searchTerm',
    'code',
    'startMonth',
    'endMonth',
  ]);
  const options = pick(req.query, AcademicSemesterFilterableFields);
  const result = await academicSemesterService.getAllAcademicSemester(
    filters,
    options
  );
  sendResponse(res, {
    statusCode: httpStatus.OK,
    success: true,
    message: 'Academic semester retrieved',
    meta: result.meta,
    data: result.data,
  });
});
const getSingleAcademicSemesterCreate = catchAsync(
  async (req: Request, res: Response) => {
    const id = req.params.id;
    const result = await academicSemesterService.singleAcademicSemester(id);
    sendResponse<AcademicSemester>(res, {
      statusCode: httpStatus.OK,
      success: true,
      message: 'Single academic semester fetched',
      data: result,
    });
  }
);

export const academicSemesterController = {
  academicSemesterCreate,
  getAcademicSemester,
  getSingleAcademicSemesterCreate,
};
