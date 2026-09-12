-- Question 3: WHERE exactly by date?
--Is TikTok always performing badly, 
-- or was there just a bad period?
SELECT 
    Order_Date,
    SUM(Ad_Spend) AS total_spend,
    SUM(New_Customers) AS total_customers,
    ROUND(SUM(Ad_Spend) / NULLIF(SUM(New_Customers), 0), 2) AS cost_per_customer,
    ROUND(100.0 * SUM(New_Customers) / NULLIF(SUM(Clicks), 0), 2) AS conversion_pct
FROM campaigns
WHERE Marketing_Channel = 'TikTok Ads'
GROUP BY Order_Date
ORDER BY Order_Date ASC;
-- Insight : TikTok's poor performance is consistent over time, 
-- so it is not just a one-day or short-term problem.