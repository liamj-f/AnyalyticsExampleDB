Select concat('Running Scripts on ',DATABASE()) AS Message;
SOURCE Sanctuary/procedures/AddColumnIfNotExists.sql;
SOURCE Sanctuary/procedures/AddForeignKeyIfNotExists.sql;

SOURCE Sanctuary/tables/Calendar.sql;
SOURCE Sanctuary/tables/Regions.sql;
SOURCE Sanctuary/tables/PropertyTypes.sql;
SOURCE Sanctuary/tables/RepairCategories.sql;
SOURCE Sanctuary/tables/Properties.sql;

SOURCE Sanctuary/tables/PropertyStaff.sql;
SOURCE Sanctuary/tables/RepairBookings.sql;
SOURCE Sanctuary/tables/SatisfactionScores.sql;
SOURCE Sanctuary/tables/StaffShifts.sql;
	   
SOURCE Sanctuary/views/AvgShiftSatisafaction.sql;
SOURCE Sanctuary/views/StaffNumberSatisfaction.sql;
