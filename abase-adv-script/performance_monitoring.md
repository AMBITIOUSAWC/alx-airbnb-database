# Performance Monitoring Report

## Monitoring Tools Used
- `EXPLAIN`
- `SHOW PROFILE`
- `EXPLAIN ANALYZE`

## Bottlenecks Identified
- Some queries on `bookings` were still slow due to missing composite indexes.
- `JOIN` operations between `users` and `bookings` were expensive without proper indexing.

## Solutions Implemented
- Created composite index on `(user_id, property_id)` in `bookings`.
- Adjusted SELECT queries to reduce selected columns.
- Added `LIMIT` to paginated queries.

## Results
- Query execution time decreased by ~40%.
- Optimizer now uses indexes instead of full table scans.

## Conclusion
Regular use of `EXPLAIN` and profiling helped identify and resolve key performance issues.

