CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    LoanType VARCHAR(50),
    Salary DECIMAL(10, 2) CHECK (Salary >= 20000), -- Check constraint for minimum salary
    ClientFingerprint VARCHAR(255),
    CreditScore INT CHECK (CreditScore BETWEEN 300 AND 850), -- Check constraint for valid credit score
    CreditInformation VARCHAR(255),
    CHECK (LoanType IN ('Personal Loan', 'Student Loan', 'Mortgage', 'Business Loan')) -- Enforcing valid loan types
) ENGINE=InnoDB;




CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    LoanAmount DECIMAL(15, 2) CHECK (LoanAmount >= 20000), -- Check constraint for minimum loan amount
    LoanType VARCHAR(50),
    DateOfRequest DATE,
    ClientCredit INT CHECK (ClientCredit BETWEEN 300 AND 850), -- Check constraint for valid credit score
    DateOfApproval DATE,
    LoanStatus VARCHAR(20) CHECK (LoanStatus IN ('Pending', 'Approved', 'Rejected')) -- Check constraint for valid loan status
) ENGINE=InnoDB;


CREATE TABLE Banker (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary >= 30000), -- Check constraint for minimum salary
    NationalID VARCHAR(20) NOT NULL
) ENGINE=InnoDB;



