CREATE VIEW ClientProfileView AS
SELECT 
    c.ClientID,
    c.ClientName,
    c.ClientFingerprint,
    c.CreditInformation,
    l.LoanAmount,
    l.LoanType,
    l.DateOfRequest,
    l.DateOfApproval
FROM Clients c
LEFT JOIN Loans l ON c.ClientID = l.ClientID;

CREATE VIEW BranchTransactionReportView AS
SELECT 
    b.EmployeeID,
    b.Name AS EmployeeName,
    b.Department AS Branch,
    l.LoanID,
    l.LoanAmount,
    l.DateOfRequest,
    l.DateOfApproval,
    l.ClientCredit
FROM 
    Loan l
JOIN 
    Banker b ON l.LoanType = b.Department;

