@echo off
setlocal

:: Nhập số tuần
set /p WEEK=Nhập số tuần (ví dụ 1, 2, 3): 

:: Kiểm tra có phải trong git repo không
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo ERROR: Thu muc hien tai khong phai la Git repository.
  pause
  exit /b 1
)

:: Kiểm tra remote 'origin' tồn tại
git remote get-url origin >nul 2>&1
if errorlevel 1 (
  echo ERROR: Khong tim thay remote 'origin'. Chay: git remote add origin <URL> .
  pause
  exit /b 1
)

echo Dang add tat ca thay doi...
git add .

echo Dang commit voi thong diep: "Nộp bài tuần %WEEK%". Nếu không có thay đổi thì commit sẽ thất bại (no changes).
git commit -m "Nộp bài tuần %WEEK%" || (
  echo Khong co thay doi de commit hoac commit bi loi.
)

echo Dang push len origin/master...
git push origin master

echo Hoan tat.
pause
endlocal
