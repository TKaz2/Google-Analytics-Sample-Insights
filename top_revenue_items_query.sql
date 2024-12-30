SELECT
  product.v2productName AS product_name,
  SUM(product.productRevenue) / 1e6 AS total_revenue_usd, 
  COUNT(DISTINCT fullVisitorId) AS total_transactions
FROM
  `project-1-431620.google_analytics_sample_project.ga_sessions`, 
  UNNEST(hits) AS hits,
  UNNEST(hits.product) AS product
WHERE
  product.productRevenue IS NOT NULL 
GROUP BY
  product.v2productName
ORDER BY
  total_revenue_usd DESC
LIMIT 1000;
