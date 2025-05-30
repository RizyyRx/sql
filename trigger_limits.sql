CREATE TRIGGER limit_employees_rows BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    DECLARE row_count INT;
    SELECT COUNT(*) INTO row_count FROM employees;
    IF row_count >= 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Row limit of 100 reached in employees table.';
    END IF;
END;