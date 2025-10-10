DELIMITER //
drop procedure if exists AddForeignKeyIfNotExists;
CREATE PROCEDURE IF NOT EXISTS AddForeignKeyIfNotExists(
    IN in_table_name VARCHAR(64),
    IN in_constraint_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_referenced_table VARCHAR(64),
    IN in_referenced_column VARCHAR(64)
)
BEGIN
    DECLARE constraint_exists INT DEFAULT 0;

    set constraint_exists =
    (SELECT COUNT(*)
    
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = in_table_name
      AND CONSTRAINT_NAME = in_constraint_name
      AND CONSTRAINT_TYPE = 'FOREIGN KEY');

    IF constraint_exists = 0 THEN
        -- Print message before adding the constraint
        SELECT CONCAT(
            'Adding foreign key ', in_constraint_name, ' on ', in_table_name, ' (', in_column_name, 
            ') referencing ', in_referenced_table, ' (', in_referenced_column, ')'
        ) AS Message;

        SET @query = CONCAT(
            'ALTER TABLE ', in_table_name,
            ' ADD CONSTRAINT ', in_constraint_name,
            ' FOREIGN KEY (', in_column_name, ') REFERENCES ',
            in_referenced_table, '(', in_referenced_column, ') ON DELETE RESTRICT'
        );
--        select @query;

        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    ELSE
        -- Optional: print that the constraint already exists
        SELECT CONCAT('Foreign key ', in_constraint_name, ' already exists on table ', in_table_name) AS Message;
    END IF;
END;
//

DELIMITER ;
