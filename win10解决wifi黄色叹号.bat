@echo off
cd /d %~dp0

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title --IP�Զ����� --
MODE con: COLS=60 lines=16
color 0a

:begin
cls
MODE con: COLS=60 lines=16
echo.
echo.
echo --[1]--��IP����Ϊ�Զ���ȡ
echo --[2]--��IP����Ϊ 192.168.1.167
echo --[3]--�˳�
echo --[4]--��DNS����Ϊ 8.8.8.8
echo.
echo.
echo --ע��--��TXT���滻WLANΪ��ı�����������
echo --ע��--�滻��Ҫ���õ�·�������غ;�̬IP��ַ
echo --ע��--���� 1��2 �ֻ��л����IP��ͻ���µĻ�ɫ̾��
echo.
echo.
choice /c 1234 /n /m "��ѡ��1-4����"

echo %errorlevel%
if %errorlevel% == 1 goto set_ip1_ip
if %errorlevel% == 2 goto set_ip2_ip
if %errorlevel% == 3 goto end
if %errorlevel% == 4 goto set_ip4_ip
else (goto begin)


:set_ip1_ip
cls
echo.
echo.
echo.
echo --IP�Զ����ÿ�ʼ--
echo.
echo --[���ڰ�IP����Ϊ �Զ���ȡ]--
netsh interface ip set address name = "WLAN" source = dhcp
echo.
echo --������ɣ�����������ؿ�ʼ�˵�--
ping localhost -n 2 > nul
goto begin


:set_ip2_ip
cls
echo.
echo.
echo.
echo --[��������IP��ַ�������롢����]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.167 mask=255.255.255.0 gateway=192.168.1.1
echo.
echo --������ɣ�����������ؿ�ʼ�˵�--
ping localhost -n 2 > nul
goto begin

:set_ip4_ip
cls
echo.
echo.
echo.
echo --[��������DNSΪ 8.8.8.8/8.8.4.4]--
cmd /c netsh interface ip set dns name="WLAN" source=static 8.8.8.8
cmd /c netsh interface ip add dns name="WLAN" 8.8.4.4
echo --������ɣ�����������ؿ�ʼ�˵�--
ping localhost -n 3 > nul
goto begin

:end
exit