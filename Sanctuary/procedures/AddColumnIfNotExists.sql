DELIMITER //

CREATE PROCEDURE IF NOT EXISTS AddColumnIfNotExists(
    IN table_name VARCHAR(64),
    IN column_name VARCHAR(64),
    IN column_definition VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME = table_name
          AND COLUMN_NAME = column_name
    ) THEN
        -- Print which column is being added
        SELECT CONCAT('Adding column `', column_name, '` to table `', table_name, '`') AS Message;
        -- Build and execute the ALTER TABLE statement
        SET @query = CONCAT('ALTER TABLE ', table_name, ' ADD COLUMN ', column_name, ' ', column_definition);
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    ELSE
        -- Optional: print that the column already exists
        SELECT CONCAT('Column `', column_name, '` already exists in table `', table_name, '`') AS Message;
    END IF;
END;
//

DELIMITER ;
