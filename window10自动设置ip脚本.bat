@echo off
cd /d %~dp0
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title --IP�Զ����� --
MODE con: COLS=60 lines=18
color 0a
  
:begin  
cls
MODE con: COLS=60 lines=18
echo.
echo.
echo --[1]--��IP����Ϊ�Զ���ȡ
echo --[2]--��IP����Ϊ 192.168.1.167
echo --[3]--��IP����Ϊ 192.168.1.168
echo --[4]--��DNS����Ϊ�Զ���ȡ
echo --[5]--��DNS����Ϊ 119.29.29.29/114.114.114.114
echo --[6]--�鿴��ǰ���� ipconfig/all
echo --[0]--�˳�
echo.
echo.
echo --ע��--��TXT�򿪲������滻WLANΪ��ı�����������
echo --ע��--������·�������ز�ͬ��ͬʱ�����滻���غ�IP
echo --ע��--����1��2��3�ֻ��л����IP��ͻ���µĻ�ɫ̾��
echo.
echo.
choice /c 1234560 /n /m "		��ѡ��0-6����"
 
echo %errorlevel%
if %errorlevel% == 1 goto set_ip1_ip  
if %errorlevel% == 2 goto set_ip2_ip  
if %errorlevel% == 3 goto set_ip3_ip  
if %errorlevel% == 4 goto set_ip4_ip  
if %errorlevel% == 5 goto set_ip5_ip  
if %errorlevel% == 6 goto set_ip6_ip  
if %errorlevel% == 0 goto end 
if %times% == 0 (goto vpn_connect) else (goto begin)  


:set_ip1_ip  
cls
echo.
echo.
echo IP�Զ����ÿ�ʼ....
echo.
echo --[���ڰ�IP����Ϊ�Զ���ȡ]--
netsh interface ip set address name = "WLAN" source = dhcp
echo --[���ڰ�DNS����Ϊ�Զ���ȡ]--
netsh interface ip set dns name = "WLAN" source = dhcp
echo ������ɣ�����������ؿ�ʼ�˵���
pause>nul
goto begin  


:set_ip2_ip  
cls
echo.
echo.
echo IP�Զ����ÿ�ʼ....
echo.
echo --[��������IP��ַ�������롢����]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.167 mask=255.255.255.0 gateway=192.168.1.1
echo ������ɣ�����������ؿ�ʼ�˵���
pause>nul
goto begin 

:set_ip3_ip 
cls
echo.
echo. 
echo IP�Զ����ÿ�ʼ....
echo.
echo --[��������IP��ַ���������롢����]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.168 mask=255.255.255.0 gateway=192.168.1.1
echo ������ɣ�����������ؿ�ʼ�˵���
pause>nul
goto begin 

:set_ip4_ip  
cls
echo.
echo.
echo DNS�Զ����ÿ�ʼ....
echo.
echo --[��������DNSΪ�Զ���ȡ]--
cmd /c netsh interface ip set dns name="WLAN" source=dhcp
echo ������ɣ�����������ؿ�ʼ�˵���
pause>nul
goto begin 

:set_ip5_ip  
cls
echo.
echo.
echo DNS�Զ����ÿ�ʼ....
echo.
echo --[��������DNSΪ119.29.29.29/114.114.114.114]--
cmd /c netsh interface ip set dns name="WLAN" source=static 119.29.29.29
cmd /c netsh interface ip add dns name="WLAN" 114.114.114.114
echo ������ɣ�����������ؿ�ʼ�˵���
pause>nul
goto begin 

:set_ip6_ip  
cls
echo.
echo.
echo.
MODE con: COLS=100 lines=60
ipconfig/all
echo.
echo.
echo ����������ؿ�ʼ�˵�
pause>nul
goto begin 

:end 
exit  