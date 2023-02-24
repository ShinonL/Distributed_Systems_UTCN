
    create table `person` (
       `id` binary(255) not null,
        `address` varchar(255) not null,
        `age` integer not null,
        `name` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision not null,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision not null,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` binary(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` binary(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` binary(255),
        `user_id` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` binary(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` binary(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` binary(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);

    create table `address` (
       `id` varchar(255) not null,
        `address_line1` varchar(255),
        `address_line2` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `device` (
       `id` varchar(255) not null,
        `description` varchar(255),
        `maximum_hourly_consumption` double precision,
        `address_id` varchar(255),
        `user_id` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `energy_consumption` (
       `id` varchar(255) not null,
        `energy_consumption` double precision,
        `timestamp` datetime(6),
        `associated_device` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `user` (
       `id` varchar(255) not null,
        `email` varchar(255) not null,
        `first_name` varchar(255) not null,
        `last_name` varchar(255),
        `password` varchar(255) not null,
        `phone_number` varchar(255),
        `role` varchar(255),
        `username` varchar(255) not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `user` 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (`email`);

    alter table `user` 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (`username`);

    alter table `device` 
       add constraint `FKrvigwiai0bkv1gmykxb4qkqae` 
       foreign key (`address_id`) 
       references `address` (`id`);

    alter table `device` 
       add constraint `FKd5p2880363wxxqbnlhwwwe12k` 
       foreign key (`user_id`) 
       references `user` (`id`);

    alter table `energy_consumption` 
       add constraint `FK9ptpawk71yklwgyuie3kyqib3` 
       foreign key (`associated_device`) 
       references `device` (`id`);
