-- -- Question 2: WHERE exactly within TikTok?
-- Is one TikTok campaign causing the problem, 
-- or are all TikTok campaigns performing poorly?
SELECT 
    Campaign,
	COUNT(*) AS total_days,
    SUM(Ad_Spend) AS total_spend,
    SUM(New_Customers) AS total_customers,
    ROUND(SUM(Ad_Spend) / NULLIF(SUM(New_Customers), 0), 2) AS cost_per_customer,
    ROUND(100.0 * SUM(New_Customers) / NULLIF(SUM(Clicks), 0), 2) AS conversion_pct
FROM campaigns
WHERE Marketing_Channel = 'TikTok Ads'
GROUP BY Campaign
ORDER BY total_spend DESC;
-- Insight: The problem is not limited to one campaign,
-- TikTok performance is consistently weak across campaigns.