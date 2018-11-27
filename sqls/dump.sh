#!bin/bash
DATE=$(date +"%Y-%m-%d")
pg_dump myproject  > ~/app/DjangoApps/sqls/dump_$DATE.sql
