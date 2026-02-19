SELECT * FROM caption_project.`combined orginal`;
### 1) Calculate the overall churn rate from the main customer data. 
SELECT 
  (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) AS Churn_Rate
FROM 
    caption_project.`combined orginal`;
### 2) Find the average monthly charges for churned vs non-churned customers. 
SELECT 
    Churn,
    AVG(MonthlyCharges) AS Avg_Monthly_Charges
FROM 
    caption_project.`combined orginal`
GROUP BY 
    Churn;
### 3) List the top 5 payment methods with the highest churn rates. 
SELECT 
    PaymentMethod,
    (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) AS Churn_Rate
FROM 
    caption_project.`combined orginal`
GROUP BY 
    PaymentMethod
ORDER BY 
    Churn_Rate DESC
LIMIT 5;
### 4) Display the number of customers on each contract type who have churned. 
SELECT 
    Contract,
    COUNT(*) AS Churned_Customers
FROM 
    caption_project.`combined orginal`
WHERE 
    Churn = 'Yes'
GROUP BY 
    Contract;
### 5) Count how many customers have tenure less than 12 months and have churned. 
SELECT 
    COUNT(*) AS Churned_Under_12_Months
FROM 
    caption_project.`combined orginal`
WHERE 
    tenure < 12
    AND Churn = 'Yes';
### 6) Identify how many customers have paperless billing and are paying through electronic check. 
SELECT 
    COUNT(*) AS Paperless_Billing_Customers_Electronic
FROM 
    caption_project.`combined orginal`
WHERE 
    PaperlessBilling = 'Yes'
    AND PaymentMethod = 'Electronic check';
### 7) Calculate the total revenue generated from non-churned customers only. 
SELECT 
    SUM(MonthlyCharges * tenure) AS Total_Revenue_Non_Churned
FROM 
    caption_project.`combined orginal`
WHERE 
    Churn = 'No';
### 8) List customers who have never used phone service or internet service.
SELECT 
    *
FROM 
    caption_project.`combined orginal`
WHERE 
    PhoneService = 'No'
    OR InternetService = 'No';
### 9) Find the number of customers with ‘Month-to-month’ contracts and no online security. 
SELECT 
    COUNT(*) AS Month_To_Month_No_Security
FROM 
    caption_project.`combined orginal`
WHERE 
    Contract = 'Month-to-month'
    AND OnlineSecurity = 'No';
### 10) Show the churn rate grouped by senior citizen status.
SELECT 
    SeniorCitizen,
    (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) AS churn_rate
FROM 
    caption_project.`combined orginal`
GROUP BY 
    SeniorCitizen;
### END










