-- Question 1: Which channel is inefficient?
-- Calculate:
-- Total advertising spend
-- Total customers
-- Cost per customer
-- Conversion rate
SELECT 
    Marketing_Channel,
    SUM(Ad_Spend) AS total_spend,
    SUM(New_Customers) AS total_customers,
    ROUND(SUM(Ad_Spend) / NULLIF(SUM(New_Customers), 0), 2) AS cost_per_customer,
    ROUND(100.0 * SUM(New_Customers) / NULLIF(SUM(Clicks), 0), 2) AS conversion_pct
FROM campaigns
GROUP BY Marketing_Channel
ORDER BY total_spend DESC;
-- -- Insight: TikTok is the main source of marketing inefficiency 
-- because it costs much more to acquire a customer than the other channels.