import { environment } from 'src/environments/environment.prod';

export const LOGIN = `http://${environment.IP}:8080/api/auth/login`
export const REGISTER = `http://${environment.IP}:8080/api/auth/register`
export const GET_DEVICES = `http://${environment.IP}:8080/api/device/find-all`
export const GET_DEVICE_BY_ID = `http://${environment.IP}:8080/api/device/find-by-id`
export const GET_USERS = `http://${environment.IP}:8080/api/user/find-all`
export const DELETE_USER = `http://${environment.IP}:8080/api/user/delete/id=`
export const CREATE_USER = `http://${environment.IP}:8080/api/user/create`
export const UPDATE_USER = `http://${environment.IP}:8080/api/user/update-user`
export const DELETE_DEVICE = `http://${environment.IP}:8080/api/device/delete/id=`
export const CREATE_DEVICE = `http://${environment.IP}:8080/api/device/create-device`
export const UPDATE_DEVICE = `http://${environment.IP}:8080/api/device/update-device`
export const GET_ADDRESSES = `http://${environment.IP}:8080/api/address/find-by-user`
export const CREATE_EC = `http://${environment.IP}:8080/api/energy-consumption/create`
export const NOTIFY_HIGH_CONSUMPTION = `http://${environment.IP}:8080/api/notify-high-consumption`
