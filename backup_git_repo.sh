#!/bin/bash

# กำหนดวันที่สำหรับชื่อโฟลเดอร์สำรอง (ปีเดือนวัน_ชั่วโมงนาทีวินาที)
DATE=$(date +%Y%m%d_%H%M%S)

# โฟลเดอร์ต้นทาง git repo (แก้ตาม path จริงของคุณ)
REPO_PATH="$HOME/your_git_repo"  # <-- แก้ตรงนี้

# โฟลเดอร์ปลายทางสำหรับสำรองใน Data ClickHouse (แก้ตาม path จริง)
BACKUP_DIR="$HOME/clickhouse_backup/commit_backup_$DATE"  # <-- แก้ตรงนี้

# สร้างโฟลเดอร์สำรอง
mkdir -p "$BACKUP_DIR"

# คัดลอกไฟล์ทั้งหมดจาก repo ไปยังโฟลเดอร์สำรอง (copy)
cp -r "$REPO_PATH/." "$BACKUP_DIR/"

# บันทึกประวัติการสำรอง (ไฟล์นี้จะเก็บไว้ที่เดียวกับโฟลเดอร์สำรอง)
echo "$(date): Backup copied from $REPO_PATH to $BACKUP_DIR" >> "$HOME/clickhouse_backup/backup_history.log"

echo "Backup completed to $BACKUP_DIR"


