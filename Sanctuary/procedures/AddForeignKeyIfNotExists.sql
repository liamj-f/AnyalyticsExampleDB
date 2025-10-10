DELIMITER //

CREATE PROCEDURE IF NOT EXISTS AddForeignKeyIfNotExists(
    IN table_name VARCHAR(64),
    IN constraint_name VARCHAR(64),
    IN column_name VARCHAR(64),
    IN referenced_table VARCHAR(64),
    IN referenced_column VARCHAR(64)
)
BEGIN
    DECLARE constraint_exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO constraint_exists
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_NAME = constraint_name
      AND TABLE_NAME = table_name
      AND CONSTRAINT_TYPE = 'FOREIGN KEY';

    IF constraint_exists = 0 THEN
        SET @query = CONCAT(
            'ALTER TABLE ', table_name,
            ' ADD CONSTRAINT ', constraint_name,
            ' FOREIGN KEY (', column_name, ') REFERENCES ',
            referenced_table, '(', referenced_column, ') ON DELETE RESTRICT'
        );

        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END;
//

DELIMITER ;
