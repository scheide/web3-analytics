SELECT 
  from_address AS wallet_address,
  COUNT(1) AS transaction_count,
  ROUND(SUM(value / 1e18), 4) AS total_eth_sent
FROM `bigquery-public-data.crypto_ethereum.transactions`
WHERE block_timestamp >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)
  AND value > 0
GROUP BY 1
ORDER BY total_eth_sent DESC
LIMIT 10;