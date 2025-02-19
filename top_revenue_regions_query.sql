SELECT
  geoNetwork.country AS region,  
  device.deviceCategory AS device,  
  COUNT(DISTINCT fullVisitorId) AS total_transactions, 
  SUM(SAFE_CAST(totals.transactionRevenue AS FLOAT64)) / 1e6 AS total_revenue_usd  
FROM
  `project-1-431620.google_analytics_sample_project.ga_sessions`,  
  UNNEST(hits) AS hits  
GROUP BY
  region, device
ORDER BY
  total_revenue_usd DESC  
LIMIT 1000;

