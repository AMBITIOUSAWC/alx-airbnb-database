# Partitioning Performance Report

## Problem
The `bookings` table had slow performance when querying large date ranges.

## Solution
Implemented partitioning by `YEAR(start_date)` into yearly partitions.

## Results
- Querying bookings by specific years or date ranges became significantly faster.
- Reduced scanned rows and improved use of indexes.

## Tools Used
- EXPLAIN
- Benchmark tests before and after partitioning

