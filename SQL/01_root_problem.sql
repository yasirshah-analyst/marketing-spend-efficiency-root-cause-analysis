-- Root Problem
-- Which marketing channels are using the marketing budget effectively,
-- and which are not?
SELECT
    Marketing_Channel,
    COUNT(*) AS total_days,
    SUM(CASE WHEN Conversion_Status = 'Converted' THEN 1 ELSE 0 END) AS converted_days,
    ROUND(100.0 * SUM(CASE WHEN Conversion_Status = 'Converted' THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_days_converted,
    SUM(Ad_Spend) AS total_spend,
    SUM(New_Customers) AS total_new_customers,
    SUM(Revenue) AS total_revenue
FROM campaigns
GROUP BY Marketing_Channel
ORDER BY total_spend DESC;
-- insight: TikTok Ads consume the largest share of marketing spend, 
-- yet generate far fewer customers than other channels. 
-- This suggests that marketing efficiency is concentrated in TikTok 
-- and requires further investigation.