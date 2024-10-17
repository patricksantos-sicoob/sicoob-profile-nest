/*
  Warnings:

  - You are about to drop the column `bio` on the `Profile` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "bio",
ALTER COLUMN "description" SET DEFAULT 'Olá, eu não tenho uma descrição ainda!',
ALTER COLUMN "role" SET DEFAULT 'Sem cargo definido',
ALTER COLUMN "team" SET DEFAULT 'Sem equipe definida';
