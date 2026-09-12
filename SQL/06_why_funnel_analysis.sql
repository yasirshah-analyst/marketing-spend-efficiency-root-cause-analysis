-- WHY #2 — Are people dropping after clicking?
-- Now look at the complete funnel:
SELECT
    Marketing_Channel,
    ROUND(100.0 * SUM(Clicks) / NULLIF(SUM(Impressions), 0), 2) AS ctr_pct,
    ROUND(100.0 * SUM(Website_Visitors) / NULLIF(SUM(Clicks), 0), 2) AS click_to_visitor_pct,
    ROUND(100.0 * SUM(New_Customers) / NULLIF(SUM(Website_Visitors), 0), 2) AS visitor_to_customer_pct,
    SUM(New_Customers) AS total_customers,
    SUM(Revenue) AS total_revenue,
    ROUND(SUM(Revenue) / NULLIF(SUM(New_Customers), 0), 2) AS revenue_per_customer
FROM campaigns
GROUP BY Marketing_Channel
ORDER BY visitor_to_customer_pct;
-- Insight: TikTok can bring people to the website, 
-- but most visitors do not become customers.
-- This tells the problem happens after people arrive at the website.