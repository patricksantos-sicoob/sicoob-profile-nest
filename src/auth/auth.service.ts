import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaClient,
    private jwtService: JwtService,
  ) {}

  async signIn(
    username: string,
    password: string,
  ): Promise<{ access_token: string }> {
    const user = await this.prisma.user.findUnique({
      where: { username },
    });

    if (!user) {
      throw new UnauthorizedException('Invaldid credentials');
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      throw new UnauthorizedException('Invaldid credentials');
    }

    const payload = {
      sub: user.id,
      username: user.username,
      name: user.name,
      description: user.description,
      role: user.role,
      team: user.team,
      image: user.image,
      virtue1: user.virtue1,
      virtue2: user.virtue2,
      virtue3: user.virtue3,
    };

    return {
      access_token: await this.jwtService.signAsync(payload),
    };
  }

  async getUserById(userId: string) {
    return await this.prisma.user.findUnique({ where: { id: userId } });
  }
}
