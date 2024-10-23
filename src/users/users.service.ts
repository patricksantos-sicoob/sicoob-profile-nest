import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaClient) {}

  async create(createUserDto: CreateUserDto) {
    try {
      if (createUserDto.password.length < 8) {
        throw new Error('A senha deve ter 8 caracteres ou mais');
      }

      const hashedPassword = await bcrypt.hash(createUserDto.password, 10);
      createUserDto.password = hashedPassword;

      const user = await this.prisma.user.create({
        data: {
          email: createUserDto.email,
          password: createUserDto.password,
          username: createUserDto.username,
          name: createUserDto.name,
        },
      });
      return user;
    } catch (error) {
      console.error(error.message);
      throw new Error('Erro ao criar usuário');
    }
  }

  async findAll() {
    const user = await this.prisma.user.findMany();
    return user;
  }

  async findOne(id: string) {
    const user = await this.prisma.user.findUnique({
      where: { id },
    });
    return user;
  }

  async update(id: string, updateUserDto: UpdateUserDto) {
    // if (updateUserDto!.password) {
    //   const hashedPassword = await bcrypt.hash(updateUserDto.password, 10);
    //   updateUserDto.password = hashedPassword;
    // }

    console.log(updateUserDto)

    const user = await this.prisma.user.update({
      where: { id },
      data: { ...updateUserDto },
    });
    return user;
  }

  async remove(id: string) {
    await this.prisma.user.delete({
      where: { id },
    });
  }
}
