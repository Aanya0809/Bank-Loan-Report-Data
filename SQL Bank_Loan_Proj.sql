USE sql_project;
SELECT * FROM financial_loan;
SELECT COUNT(id) as Total_Loan_Applications FROM financial_loan;
SELECT COUNT(id) as MTD_Total_Applications FROM financial_loan
WHERE month(issue_date)=12;
SELECT COUNT(id) as PMTD_Total_Applications FROM financial_loan
WHERE month(issue_date)=11;

SELECT Sum(loan_amount) as Total_Funded_Amount FROM financial_loan;
SELECT Sum(loan_amount) as MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date)=12;
SELECT Sum(loan_amount) as PMTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date)=11;

SELECT Sum(total_payment) as Total_Received_Amount FROM financial_loan;
SELECT Sum(total_payment) as MTD_Total_Received_Amount FROM financial_loan
WHERE Month(issue_date)=12;
SELECT Sum(total_payment) as PMTD_Total_Received_Amount FROM financial_loan
WHERE Month(issue_date)=11;

SELECT ROUND(AVG(int_rate)*100,2) as Average_Interest_Rate FROM financial_loan;
SELECT ROUND(AVG(int_rate)*100,2) as MTD_Average_Interest_Rate FROM financial_loan
WHERE Month(issue_date)=12;
SELECT ROUND(AVG(int_rate)*100,2) as PMTD_Average_Interest_Rate FROM financial_loan
WHERE Month(issue_date)=11;

SELECT ROUND(AVG(dti)*100,2) as Average_DTI FROM financial_loan;
SELECT ROUND(AVG(dti)*100,2) as MTD_Average_DTI FROM financial_loan
WHERE Month(issue_date)=12;
SELECT ROUND(AVG(dti)*100,2) as PMTD_Average_DTI FROM financial_loan
WHERE Month(issue_date)=11;

SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
COUNT(id) AS Good_Loan_Percentage
FROM financial_loan;
SELECT COUNT(id) as Good_Loan_Applications FROM financial_loan 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
SELECT SUM(loan_amount) as Good_Loan_Funded_Amount FROM financial_loan 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
SELECT SUM(total_payment) as Good_Loan_Received_Amount FROM financial_loan 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

SELECT (COUNT(CASE WHEN loan_status='Charged Off' THEN id END)*100) / COUNT(id)
AS Bad_Loan_Percentage FROM financial_loan;
SELECT COUNT(id) as Bad_Loan_Applications FROM financial_loan 
WHERE loan_status = 'Charged Off';
SELECT SUM(loan_amount) as Bad_Loan_Funded_Amount FROM financial_loan 
WHERE loan_status = 'Charged Off';
SELECT SUM(total_payment) as Bad_Loan_Received_Amount FROM financial_loan 
WHERE loan_status = 'Charged Off';

SELECT 
  loan_status,
  COUNT(id) as Loan_Count,
  SUM(total_payment) as Total_Amount_Received,
  SUM(loan_amount) as Total_Funded_Amount,
  AVG(int_rate)*100 as Interest_Rate,
  AVG(dti)*100 as DTI
FROM financial_loan 
GROUP BY loan_status;
SELECT loan_status, 
  SUM(total_payment) as MTD_Total_Amount_Received,
  SUM(loan_amount) as MTD_Total_Funded_Amount
FROM financial_loan 
WHERE Month(issue_date)=12
GROUP BY loan_status; 

SELECT MONTH(issue_date) as Month_Number,
       MONTHNAME(issue_date) as Month_Name,
       COUNT(id) as Total_Loan_Applications,
       SUM(loan_amount) as Total_Funded_Amount,
       SUM(total_payment) as Total_Received_Amount
FROM financial_loan
GROUP BY MONTH(issue_date),MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

SELECT address_state as State,
       COUNT(id) as Total_Loan_Applications,
       SUM(loan_amount) as Total_Funded_Amount,
       SUM(total_payment) as Total_Received_Amount
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;

SELECT term,
       COUNT(id) as Total_Loan_Applications,
       SUM(loan_amount) as Total_Funded_Amount,
       SUM(total_payment) as Total_Received_Amount
FROM financial_loan
GROUP BY term
ORDER BY term;

SELECT emp_length as Employee_Length,
       COUNT(id) as Total_Loan_Applications,
       SUM(loan_amount) as Total_Funded_Amount,
       SUM(total_payment) as Total_Received_Amount
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;

SELECT purpose as Purpose,
       COUNT(id) as Total_Loan_Applications,
       SUM(loan_amount) as Total_Funded_Amount,
       SUM(total_payment) as Total_Received_Amount
FROM financial_loan
GROUP BY purpose
ORDER BY purpose;

SELECT home_ownership as Home_Ownership,
       COUNT(id) as Total_Loan_Applications,
       SUM(loan_amount) as Total_Funded_Amount,
       SUM(total_payment) as Total_Received_Amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership;

