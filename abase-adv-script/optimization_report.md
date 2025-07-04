# Optimization Report

## Initial Query
The original query used multiple joins without indexes and selected all columns.

## Performance Issues
- Full table scans were observed.
- Joins were expensive due to lack of indexes on `user_id`, `property_id`, and `booking_id`.

## Optimization Actions
- Reduced selected columns to only what was needed.
- Added appropriate indexes in a previous task.
- Query response time improved significantly.

## Tools Used
- EXPLAIN
- Query planner analysis

