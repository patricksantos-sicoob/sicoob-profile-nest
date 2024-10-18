/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `Profile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Virtue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ProfileVirtues` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_userUsername_fkey";

-- DropForeignKey
ALTER TABLE "_ProfileVirtues" DROP CONSTRAINT "_ProfileVirtues_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProfileVirtues" DROP CONSTRAINT "_ProfileVirtues_B_fkey";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ADD COLUMN     "description" TEXT NOT NULL DEFAULT 'Olá, eu não tenho uma descrição ainda!',
ADD COLUMN     "image" TEXT NOT NULL DEFAULT 'https://img.freepik.com/premium-vector/anonymous-user-flat-icon-vector-illustration-with-long-shadow_520826-1932.jpg',
ADD COLUMN     "role" TEXT NOT NULL DEFAULT 'Sem cargo definido',
ADD COLUMN     "team" TEXT NOT NULL DEFAULT 'Sem equipe definida',
ADD COLUMN     "virtue1" TEXT NOT NULL DEFAULT 'Qualidade 1',
ADD COLUMN     "virtue2" TEXT NOT NULL DEFAULT 'Qualidade 2',
ADD COLUMN     "virtue3" TEXT NOT NULL DEFAULT 'Qualidade 3',
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Profile";

-- DropTable
DROP TABLE "Virtue";

-- DropTable
DROP TABLE "_ProfileVirtues";
