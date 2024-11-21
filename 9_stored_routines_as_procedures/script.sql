DELIMITER $$

-- Define the stored procedure to update loan status
CREATE PROCEDURE update_loan_status(
    IN p_LoanID INT,
    IN p_ApprovalStatus VARCHAR(10)
)
BEGIN
    -- Update the loan status based on approval status
    IF p_ApprovalStatus = 'Approved' THEN
        UPDATE Loan
        SET LoanStatus = 'Approved', ApprovalDate = NOW()
        WHERE LoanID = p_LoanID;
    ELSEIF p_ApprovalStatus = 'Rejected' THEN
        UPDATE Loan
        SET LoanStatus = 'Rejected', ApprovalDate = NOW()
        WHERE LoanID = p_LoanID;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid approval status';
    END IF;
END$$

-- End of procedure definition
DELIMITER ;

-- Call the procedure to update loan status
CALL update_loan_status(1001, 'Approved');

-- To display the updated loan status (optional)
SELECT LoanID, LoanStatus, ApprovalDate 
FROM Loan 
WHERE LoanID = 1001;


DELIMITER $$

-- Define the stored procedure
CREATE PROCEDURE calculate_monthly_repayment(
    IN p_LoanAmount DECIMAL(10, 2),
    IN p_InterestRate DECIMAL(5, 2),
    IN p_LoanTerm INT,
    OUT p_MonthlyRepayment DECIMAL(10, 2)
)
BEGIN
    -- Declare the monthly interest rate
    DECLARE monthly_rate DECIMAL(5, 2);
    
    -- Calculate the monthly interest rate (annual interest rate / 12)
    SET monthly_rate = p_InterestRate / 100 / 12;
    
    -- Calculate the monthly repayment using the loan formula
    SET p_MonthlyRepayment = (p_LoanAmount * monthly_rate) / (1 - POW(1 + monthly_rate, -p_LoanTerm));
END$$

-- End of stored procedure definition
DELIMITER ;

-- Declare a variable to store the result
DECLARE monthlyRepayment DECIMAL(10, 2);

-- Call the procedure to calculate the monthly repayment
CALL calculate_monthly_repayment(100000, 6, 24, monthlyRepayment);

-- Display the result
SELECT monthlyRepayment AS MonthlyRepayment
