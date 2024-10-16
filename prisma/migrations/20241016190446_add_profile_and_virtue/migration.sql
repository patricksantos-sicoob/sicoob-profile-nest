-- CreateTable
CREATE TABLE "Virtue" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Virtue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "bio" TEXT NOT NULL DEFAULT 'Olá, eu não tenho uma bio ainda!',
    "description" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "team" TEXT NOT NULL,
    "image" TEXT NOT NULL DEFAULT 'https://img.freepik.com/premium-vector/anonymous-user-flat-icon-vector-illustration-with-long-shadow_520826-1932.jpg',
    "userUsername" TEXT NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ProfileVirtues" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Virtue_name_key" ON "Virtue"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userUsername_key" ON "Profile"("userUsername");

-- CreateIndex
CREATE UNIQUE INDEX "_ProfileVirtues_AB_unique" ON "_ProfileVirtues"("A", "B");

-- CreateIndex
CREATE INDEX "_ProfileVirtues_B_index" ON "_ProfileVirtues"("B");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userUsername_fkey" FOREIGN KEY ("userUsername") REFERENCES "User"("username") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileVirtues" ADD CONSTRAINT "_ProfileVirtues_A_fkey" FOREIGN KEY ("A") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileVirtues" ADD CONSTRAINT "_ProfileVirtues_B_fkey" FOREIGN KEY ("B") REFERENCES "Virtue"("id") ON DELETE CASCADE ON UPDATE CASCADE;
