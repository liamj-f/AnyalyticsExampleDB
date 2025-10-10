DELIMITER //

CREATE PROCEDURE AddColumnIfNotExists(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_column_definition VARCHAR(255)
)
BEGIN
    DECLARE column_exists INT DEFAULT 0;
    select in_column_name , in_table_name , database();
SELECT in_column_name , in_table_name 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE 1=1
      and TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = in_table_name 
      AND COLUMN_NAME = in_column_name 
    LIMIT 1;

    -- Check if the column exists
   set column_exists = (SELECT count(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE 1=1
      and TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = in_table_name 
      AND COLUMN_NAME = in_column_name 
    LIMIT 1) ;
     select column_exists;
    IF column_exists = 1 THEN
        SELECT CONCAT('Column `', in_column_name , '` already exists in table `', in_table_name , '`') AS Message;
    ELSE
        SELECT CONCAT('Adding column `', in_column_name , '` to table `', in_table_name , '`') AS Message;

        SET @query = CONCAT('ALTER TABLE `', in_table_name , '` ADD COLUMN `', in_column_name , '` ', column_definition);
        SELECT @query AS ExecutingSQL;

        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END;
//

DELIMITER ;
