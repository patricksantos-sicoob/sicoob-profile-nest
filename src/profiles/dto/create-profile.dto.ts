import { IsNotEmpty, IsString } from 'class-validator';

export class CreateProfileDto {
  @IsString()
  @IsNotEmpty()
  description: string;

  @IsString()
  role?: string;

  @IsString()
  team?: string;

  @IsString()
  image?: string;

  @IsString()
  @IsNotEmpty()
  userUsername: string;
}
