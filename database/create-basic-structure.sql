create schema if not exists ext;
create schema if not exists helpers;
create schema if not exists const;
create schema if not exists unsecure;
create schema if not exists internal;
create schema if not exists stage;

alter default privileges
    in schema public, const
    grant select, insert, update, delete on tables to dynamic_router_dev;
alter default privileges
    in schema public, const, ext, stage, helpers, internal, unsecure grant usage, select on sequences to dynamic_router_dev;

alter role dynamic_router_dev set search_path to public, const, ext, stage, helpers, internal, unsecure;
set search_path = public, const, ext, stage, helpers, internal, unsecure;
alter database dynamic_router_dev set search_path to public, const, ext, stage, helpers, internal, unsecure;