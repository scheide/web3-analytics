-- Title: Top Ethereum Gas Consumers / Burners (Last 24 Hours)
-- Author: scheide
-- Engine: Google BigQuery (Standard SQL)
-- Dataset: bigquery-public-data.crypto_ethereum.transactions

SELECT 
  receipt_contract_address AS contract_or_recipient,
  COUNT(1) AS total_transactions,
  ROUND(SUM(receipt_gas_used * gas_price / 1e18), 4) AS total_gas_eth
FROM `bigquery-public-data.crypto_ethereum.transactions`
WHERE block_timestamp >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)
  AND receipt_contract_address IS NOT NULL
GROUP BY 1
ORDER BY total_gas_eth DESC
LIMIT 10;