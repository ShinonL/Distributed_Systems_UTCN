import {UserModel} from './user.model'
import { Address } from './address.model'
import { EnergyConsumption } from './energy-consumption.model'

export interface Device {
    id?: string
	description: string,
    address?: Address,
	maximumHourlyConsumption: number,
	user: UserModel,
    energyConsumptions?: EnergyConsumption[]
}

