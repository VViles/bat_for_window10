@echo off
cd /d %~dp0

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title -- UWF��ͳһд��ɸѡ�� --
color 0a

:begin
cls
echo.
echo.
echo --[1]--����UWF��ͳһд��ɸѡ��
echo --[2]--�鿴UWF��������
echo --[3]--�ر�UWF��ͳһд��ɸѡ��
echo --[4]--�رմ���
echo.
echo.
echo --ע��--�������߹ر�ʱ ����ϵͳ������Ч
echo.
echo.
choice /c 1234 /n /m "��ѡ��1-4����"

echo %errorlevel%
if %errorlevel% == 1 goto set_1
if %errorlevel% == 2 goto set_2
if %errorlevel% == 3 goto set_3
if %errorlevel% == 4 goto end
else (goto begin)

:set_1
cls
echo.
echo.
uwfmgr filter enable
uwfmgr servicing enable
uwfmgr overlay set-size 2048
uwfmgr overlay set-warningthreshold 1536
uwfmgr overlay set-criticalthreshold 1792
uwfmgr overlay set-passthrough on
uwfmgr volume protect c:
uwfmgr file add-exclusion c:\users
uwfmgr servicing Update-Windows
pause > nul
goto begin

:set_2
cls
echo.
echo.
uwfmgr get-config
pause > nul
goto begin

:set_3
cls
echo.
echo.
uwfmgr filter disable
pause > nul
goto begin

:end
exit
