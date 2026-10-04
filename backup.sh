#!/bin/bash
docker exec postgres pg_dump -U postgres activepieces | gzip > ~/backups/backup-$(date +%F).sql.gz
find ~/backups -name "backup-*.sql.gz" -mtime +7 -delete
aws s3 cp ~/backups/backup-$(date +%F).sql.gz s3://activepieces-backup-vishnu-2026/
