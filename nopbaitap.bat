@echo off
REM Script nộp bài tập lên GitHub
SET /p msg="Nhập nội dung commit: "
git add .
git commit -m "%msg%"
git push
pause
