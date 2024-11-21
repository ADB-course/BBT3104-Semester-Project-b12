CREATE TABLE Client (
    ClientID INT PRIMARY KEY, 
    ClientName VARCHAR(100),
    ClientFingerprint VARCHAR(255), 
    LoanType VARCHAR(50), 
    SalaryInformation DECIMAL(15, 2),
    CreditInformation INT,
    CONSTRAINT fk_LoanType FOREIGN KEY (LoanType) REFERENCES Loan(LoanType) ON DELETE CASCADE,
    CONSTRAINT fk_ClientID FOREIGN KEY (ClientID) REFERENCES Banker(EmployeeID)
) ENGINE=InnoDB;

-- Adding Indexes
CREATE INDEX idx_ClientName ON Client(ClientName);  


CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(15, 2),
    DateOfRequest DATE,
    ClientCredit INT,
    DateOfApproval DATE,
    CONSTRAINT fk_LoanType FOREIGN KEY (LoanType) REFERENCES LoanType(LoanType),
    CONSTRAINT fk_LoanID FOREIGN KEY (LoanID) REFERENCES Client(ClientID)
) ENGINE=InnoDB;




CREATE TABLE Banker (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(15, 2),
    NationalID INT,
    CONSTRAINT fk_Department FOREIGN KEY (Department) REFERENCES Department(DepartmentID)
) ENGINE=InnoDB;



