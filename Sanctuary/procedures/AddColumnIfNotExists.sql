DELIMITER //

CREATE PROCEDURE if not exists AddColumnIfNotExists(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_column_definition VARCHAR(255)
)
BEGIN
    DECLARE column_exists INT DEFAULT 0;

    -- Check if the column exists
    SET column_exists = (
        SELECT COUNT(*)
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME = in_table_name
          AND COLUMN_NAME = in_column_name
    );

    IF column_exists = 1 THEN
        SELECT CONCAT('Column `', in_column_name , '` already exists in table `', in_table_name , '`') AS Message;
    ELSE
        SELECT CONCAT('Adding column `', in_column_name , '` to table `', in_table_name , '`') AS Message;

        SET @query = CONCAT('ALTER TABLE `', in_table_name , '` ADD COLUMN `', in_column_name , '` ', in_column_definition);

        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END;
//

DELIMITER ;
