import { Link } from './link.model';

export interface UserModel {
    id?: string,
    username?: string,
    password?: string,
    lastName?: string,
    firstName?: string,
    email?: string,
    phoneNumber?: string,
    role?: string,
    links?: Link[],
}