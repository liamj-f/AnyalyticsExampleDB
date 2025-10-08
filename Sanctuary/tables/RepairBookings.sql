create table RepairBookings
(RepairId int not null AUTO_INCREMENT,
PropertyId int not null,
LoggedDateTime datetime not null,
CompletedDateTime datetime,
RepairCategoryId int,
Primary Key (`RepairId`),
Constraint `FK_PropertyRepair` FOREIGN KEY (`PropertyId`) REFERENCES `Properties` (`PropertyId`) ON DELETE RESTRICT,
Constraint `FK_RepairCategoryBooking` FOREIGN KEY (`RepairCategoryId`) REFERENCES `RepairCategories` (`RepairCategoryId`) ON DELETE RESTRICT
)
