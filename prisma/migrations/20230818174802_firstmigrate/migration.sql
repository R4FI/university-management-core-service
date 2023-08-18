/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "('academic_smester)" (
    "id" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "startMonth" TEXT NOT NULL,
    "endMonth" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "('academic_smester)_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "('academic_faculty)" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "('academic_faculty)_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "('academic_departments)" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "academicfacultyId" TEXT NOT NULL,

    CONSTRAINT "('academic_departments)_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "('students)" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middelname" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contactNo" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodGroup" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "academiSemsterID" TEXT NOT NULL,
    "academicDepartmentId" TEXT NOT NULL,
    "academiFacultyId" TEXT NOT NULL,

    CONSTRAINT "('students)_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "('facalties)" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "middelname" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contactNo" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodGroup" TEXT NOT NULL,
    "designation" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "academicDepartmentId" TEXT NOT NULL,
    "academiFacultyId" TEXT NOT NULL,

    CONSTRAINT "('facalties)_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "('academic_departments)" ADD CONSTRAINT "('academic_departments)_academicfacultyId_fkey" FOREIGN KEY ("academicfacultyId") REFERENCES "('academic_faculty)"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "('students)" ADD CONSTRAINT "('students)_academiSemsterID_fkey" FOREIGN KEY ("academiSemsterID") REFERENCES "('academic_smester)"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "('students)" ADD CONSTRAINT "('students)_academicDepartmentId_fkey" FOREIGN KEY ("academicDepartmentId") REFERENCES "('academic_departments)"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "('students)" ADD CONSTRAINT "('students)_academiFacultyId_fkey" FOREIGN KEY ("academiFacultyId") REFERENCES "('academic_faculty)"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "('facalties)" ADD CONSTRAINT "('facalties)_academicDepartmentId_fkey" FOREIGN KEY ("academicDepartmentId") REFERENCES "('academic_departments)"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "('facalties)" ADD CONSTRAINT "('facalties)_academiFacultyId_fkey" FOREIGN KEY ("academiFacultyId") REFERENCES "('academic_faculty)"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
