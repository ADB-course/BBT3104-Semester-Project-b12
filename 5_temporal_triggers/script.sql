CREATE TRIGGER after_update_loan_status
AFTER UPDATE ON Loan
FOR EACH ROW
BEGIN
    -- Check if the loan status has changed
    IF OLD.LoanStatus != NEW.LoanStatus THEN
        -- Insert a record into the Loan_Status_Change table to track status changes
        INSERT INTO Loan_Status_Change (LoanID, OldStatus, NewStatus, ChangeDate)
        VALUES (NEW.LoanID, OLD.LoanStatus, NEW.LoanStatus, NOW());
    END IF;
END;


CREATE TRIGGER after_update_credit_score
AFTER UPDATE ON Loan
FOR EACH ROW
BEGIN
    -- Check if the loan repayment has been made (assuming repayment status is updated)
    IF NEW.RepaymentStatus = 'Paid' AND OLD.RepaymentStatus != 'Paid' THEN
        -- Update the client's credit score based on the repayment status
        UPDATE Client
        SET CreditScore = CreditScore + 50
        WHERE ClientID = NEW.ClientID;
    END IF;
END;
