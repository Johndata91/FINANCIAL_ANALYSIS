-- FINANCIAL ANALYSIS REQUEST  

QUESTIONS 
-- What are the names of all the customers who live in New York?
	
	SELECT firstname, lastname 
	FROM Customers
	WHERE city = 'New York'


2--. What is the total number of accounts in the Accounts table?
	
	SELECT COUNT(accountid)
	FROM accounts;

3.-- What is the total balance of all checking accounts?
	
	SELECT accounttype , SUM(balance) as balance
			FROM accounts
			WHERE accounttype = 'Checking'
			GROUP BY accounttype 
			

4. -- What is the total balance of all accounts associated with customers who live in Los Angeles?
	
	SELECT c.city, SUM(a.balance) 
		FROM accounts  as a
		JOIN  customers as c
		ON  a.customerid = C.customerid
		WHERE C.CITY = 'Los Angeles'
		GROUP BY C.city
		
		
5. Which branch has the highest average account balance?

		SELECT branchname , ROUND(AVG(balance),2) AS Balance 
		FROM accounts a
		JOIN branches b
		ON a.branchid = b.branchid 
		GROUP BY branchname 
		ORDER BY Balance DESC ;

6. Which customer has the highest current balance in their accounts?

		SELECT c.firstname , c.lastname , SUM(a.balance) as Balance
		FROM accounts a
		JOIN customers c
		ON a.customerid = c.customerid
		GROUP BY c.firstname ,c.lastname 
		ORDER BY balance DESC 

--7. Which customer has made the most transactions in the Transactions table?

	SELECT firstname, count(t.accountid)
	FROM accounts a
	JOIN customers c
	ON a.customerid = c.customerid
	JOIN transactions t
	ON a.accountid = t.accountid
	GROUP BY firstname

--8.Which branch has the highest total balance across all of its accounts?

		SELECT branchname, SUM(balance) as Balance 
			FROM accounts a
			JOIN branches b
			ON a.branchid = b.branchid 
			GROUP BY branchname 
			ORDER BY Balance DESC 

	
-- 9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?

		SELECT firstname, lastname, SUM(balance) balance 
			FROM accounts a
			JOIN customers c
			ON a.customerid = c .customerid 
			GROUP BY firstname , lastname 
			ORDER BY balance DESC
-- 10. Which branch has the highest number of transactions in the Transactions table?

	SELECT b.branchname, COUNT(branchname)
	FROM accounts a
	JOIN branches b
	ON a.branchid = b.branchid
	JOIN transactions t
	ON a.accountid = t.accountid
	GROUP BY b.branchname
	
 