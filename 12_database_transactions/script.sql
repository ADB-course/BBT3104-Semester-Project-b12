START TRANSACTION;


UPDATE Loan
SET DateOfApproval = CURDATE()
WHERE LoanID = 1001 AND DateOfApproval IS NULL;
INSERT INTO LoanApprovalHistory (LoanID, ApprovalDate, ApprovedBy)
VALUES (1001, CURDATE(), 'Jason Kamau');
COMMIT;

ROLLBACK;  -- Rollback in case of error

