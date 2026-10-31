# Ethereum On-Chain Data Analytics

An end-to-end Web3 data engineering repository leveraging Google BigQuery public datasets to analyze real-time EVM metrics, volume distributions, and smart contract execution activity.

---

## Executive Summary
This project extracts raw Ethereum blockchain transaction logs directly from BigQuery without third-party API rate limits, modeling analytical views and exposing executive visualizations via Google Looker Studio.

### Analytics Suite:
1. Top ETH Senders (24h Window): Analyzes high-net-worth wallet addresses and aggregated ETH transfer distribution.
2. Top Gas Burners (24h Window): Measures high-frequency smart contracts driving execution costs.

---

## Data Architecture Pipeline

Ethereum Network -> Google BigQuery Public Datasets -> Custom Schema Views -> Google Looker Studio

---

## Interactive Visualizations
- Live Executive Dashboard: Looker Studio (https://datastudio.google.com/reporting/44e3331b-89f6-4cca-b510-29194fdec1e8)

---

## On-Chain Insights & Observations
- Contract Classification: High-gas addresses predominantly map to decentralized exchanges and Layer-2 roll-up batch submitters.
- Volume Skewness: Top transfer volumes in 24h rolling windows exhibit clear Pareto distribution.

---

## How to Run Queries

1. Clone the repository:
   git clone git@github.com:scheide/web3-analytics.git

2. Execute scripts directly in the Google BigQuery Console:
   - sql/01_top_eth_senders_24h.sql
   - sql/02_gas_burners_24h.sql

---
Author: scheide
