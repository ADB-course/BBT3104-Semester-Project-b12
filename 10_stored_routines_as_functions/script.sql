DELIMITER $$

CREATE FUNCTION calculate_loan_interest(
    p_LoanAmount DECIMAL(10, 2),
    p_LoanType VARCHAR(50)
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE p_InterestRate DECIMAL(5, 2);
    DECLARE calculated_interest DECIMAL(10, 2);
    
    -- Retrieve the interest rate for the given loan type from the loan_types table
    SELECT interest_rate INTO p_InterestRate
    FROM loan_types
    WHERE loan_type = p_LoanType
    LIMIT 1; -- Ensure only one row is returned

    -- Calculate the interest based on the loan amount and interest rate
    SET calculated_interest = p_LoanAmount * p_InterestRate / 100;
    
    -- Return the calculated interest
    RETURN calculated_interest;
END$$

DELIMITER ;
