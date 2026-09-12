-- WHY #3 — Why don't visitors convert?
SELECT
    b.Marketing_Channel,
    e.cost_per_customer,
    e.conversion_pct,
    b.Bounce_Rate_Pct,
    b.Avg_Session_Duration_Sec,
    b.Primary_Traffic_Intent,
    b.Audience_Age_Match_Pct,
    b.Landing_Page_Match_Score
FROM channel_behavior b
JOIN (
    SELECT
        Marketing_Channel,
        SUM(Ad_Spend) AS total_spend,
        SUM(New_Customers) AS total_customers,
        ROUND(
            SUM(Ad_Spend) / NULLIF(SUM(New_Customers), 0),
            2
        ) AS cost_per_customer,
        ROUND(
            100.0 * SUM(New_Customers) / NULLIF(SUM(Clicks), 0),
            2
        ) AS conversion_pct
    FROM campaigns
    GROUP BY Marketing_Channel
) e
ON b.Marketing_Channel = e.Marketing_Channel
ORDER BY e.total_spend DESC;
-- 76.5% bounce rate
-- → Many visitors leave quickly.
-- 22-second session
-- → They are not spending much time on the website.
-- Insight: TikTok visitors are arriving, 
-- but they are not engaging with the website enough to become customers.