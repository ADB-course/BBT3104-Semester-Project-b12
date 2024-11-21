DELIMITER $$

CREATE TRIGGER before_loan_insert
BEFORE INSERT ON Loan
FOR EACH ROW
BEGIN
    DECLARE client_credit DECIMAL(5,2);
    
    -- Get client credit score
    SELECT CreditInformation INTO client_credit
    FROM Client
    WHERE ClientID = NEW.ClientID;

    -- Check if credit score is above 500 before allowing loan insertion
    IF client_credit < 500 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Client credit score is too low for loan approval.';
    END IF;
END $$

DELIMITER ;


