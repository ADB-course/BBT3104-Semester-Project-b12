
-- Indexes for the Client table
CREATE INDEX idx_client_name ON Client(ClientName);





-- Indexes for the Loan table
CREATE INDEX idx_loan_amount ON Loan(LoanAmount);



-- Indexes for the Banker table

CREATE INDEX idx_banker_name ON Banker(Name); 
