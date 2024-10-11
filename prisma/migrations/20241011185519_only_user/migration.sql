/*
  Warnings:

  - You are about to drop the `Profile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Virtue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ProfileVirtues` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[username]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_userId_fkey";

-- DropForeignKey
ALTER TABLE "_ProfileVirtues" DROP CONSTRAINT "_ProfileVirtues_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProfileVirtues" DROP CONSTRAINT "_ProfileVirtues_B_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateOfBirth" TIMESTAMP(3),
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "username" TEXT NOT NULL;

-- DropTable
DROP TABLE "Profile";

-- DropTable
DROP TABLE "Virtue";

-- DropTable
DROP TABLE "_ProfileVirtues";

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
