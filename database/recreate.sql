-- create role dynamic_router_dev with password 'Dynamic' login;

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'dynamic_router_dev'
  AND pid <> pg_backend_pid();

drop database if exists dynamic_router_dev;
create database dynamic_router_dev with owner dynamic_router_dev;
