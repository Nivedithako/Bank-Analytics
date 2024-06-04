create database Bank_analytics;
use bank_analytics;
select * from finance_1_new;
select * from finance_2_new;



-- KPI 1
-- 1) Year wise loan amount stats
select year(issue_D) as Year_of_loan_issue_d , sum(loan_amnt) as Total_loan_amnt
 from finance_1_new
 group by Year_of_loan_issue_d
 Order by Year_of_loan_issue_d;
 
 -- KPI 2
 -- 2) Grade and Sub grade wise revol_bal
 
 select grade, sub_grade, SUM(revol_bal) AS total_balance
 from finance_1_new INNER JOIN finance_2_new
 on (finance_1_new.id = finance_2_new.id)
 Group BY grade, sub_grade
 ORDER BY grade, sub_grade;
 
 -- KPI 3
 -- 3) Total payment for Verified Status Vs Total payment for Non Verified Status
 
 SELECT verification_status, CONCAT('$', FORMAT(ROUND(SUM(total_pymnt),2),2)) AS Total_payment
 FROM Finance_1_new INNER JOIN Finance_2_new
 ON (Finance_1_new.id = Finance_2_new.id)
 GROUP BY verification_status;
 
 -- KPI 4
 -- 4) State wise and month wise lon status
 
 select addr_state AS state, DATE_FORMAT(issue_d, '%M') AS 'Month' , loan_status AS 'status'
 FROM finance_1_new INNER JOIN finance_2_new
 ON (finance_1_new.id = finance_2_new.id)
 order by issue_d;
 
 -- KPI 5
 -- 5) Home ownership Vs last payment date stats
 
 select home_ownership AS 'Home Ownership status', last_pymnt_d AS 'Last payment'
 from finance_1_new INNER JOIN finance_2_new
 ON (finance_1_new.id = finance_2_new.id)
 GROUP BY home_ownership, last_pymnt_d
 ORDER BY home_ownership, last_pymnt_d DESC;
 
