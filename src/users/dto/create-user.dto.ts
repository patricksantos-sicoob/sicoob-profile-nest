import {
  IsEmail,
  IsNotEmpty,
  IsString,
  IsStrongPassword,
} from 'class-validator';

export class CreateUserDto {
  @IsEmail({}, { message: 'Email inválido' })
  @IsNotEmpty({ message: 'Email é obrigatório' })
  email: string;

  @IsStrongPassword({ minLength: 8 }, { message: 'Insira uma senha forte' })
  @IsNotEmpty({ message: 'Senha é obrigatório' })
  password: string;

  @IsString()
  @IsNotEmpty({ message: 'Nome de usuário é obrigatório' })
  username: string;

  @IsString()
  @IsNotEmpty({ message: 'Nome é obrigatório' })
  name: string;
}
