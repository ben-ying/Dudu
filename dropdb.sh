#!/usr/bin/env bash
rm -rf iaer/migrations/00*
#rm -rf db.sqlite3
dropdb myproject
createdb myproject
