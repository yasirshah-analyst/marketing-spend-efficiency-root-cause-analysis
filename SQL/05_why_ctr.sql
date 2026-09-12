-- WHY #1 — Is TikTok failing to get clicks?
-- Calculate: Click-through rate (CTR)
SELECT
    Marketing_Channel,
    ROUND(
        100.0 * SUM(Clicks) / NULLIF(SUM(Impressions), 0),
        2
    ) AS ctr_pct
FROM campaigns
GROUP BY Marketing_Channel
ORDER BY ctr_pct;
-- Insight: TikTok is successful at getting people to click, 
-- the problem does not happens during the clicks.