SELECT 
  COALESCE(tk.symbol, tk.name, t.receipt_contract_address) AS contract_or_token_label,
  COUNT(1) AS total_transactions,
  ROUND(SUM(t.receipt_gas_used * t.gas_price / 1e18), 4) AS total_gas_eth
FROM `bigquery-public-data.crypto_ethereum.transactions` AS t
LEFT JOIN `bigquery-public-data.crypto_ethereum.tokens` AS tk
  ON t.receipt_contract_address = tk.address
WHERE t.block_timestamp >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)
  AND t.receipt_contract_address IS NOT NULL
GROUP BY contract_or_token_label
ORDER BY total_gas_eth DESC
LIMIT 10;