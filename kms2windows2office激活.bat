@echo off
cd /d %~dp0

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title --KMS����widows��office��ݽű�--
MODE con: COLS=70 lines=15
color 0a





:begin
cls
echo.
echo.
echo     -- KMS ���� widows �� office ��ݽű� --
echo.
echo --[1]--���� widows ϵͳ��Windows 7��8��10��2008��2012��2016��
echo --[2]--���� office �����office 2010��2013��2016��
echo --[0]--�˳��ű�
echo.
echo.
choice /c 120 /n /m "		��ѡ��0-2����"
 
echo %errorlevel%
if %errorlevel% == 1 goto set_ip1_ip
if %errorlevel% == 2 goto set_ip2_ip
if %errorlevel% == 0 goto end 
if %times% == 0 (goto vpn_connect) else (goto begin)  




::����widowsϵͳ
:set_ip1_ip
cls
echo.
echo.
echo --��������KMS��������ַ��
echo.
echo --Ĭ�ϼ��������Ϊ kms.03k.org
echo.
set/p kms=--Ĭ��ֱ�Ӱ��س���
if not defined kms set kms=kms.03k.org
echo.
echo --���óɹ����������������ʼ���
pause>nul
echo.
echo --���ڼ�����Ժ󡣡�����
slmgr /skms %kms%
slmgr /ato
ping localhost -n 3 > nul
slmgr /dlv
echo.
echo --��������ɡ�����������ؿ�ʼ�˵���
pause>nul
goto begin





::����office���
:set_ip2_ip
cls
echo.
echo.
echo --��������KMS��������ַ��
echo.
echo --Ĭ�ϼ��������Ϊ kms.03k.org
echo.
set/p kms=--Ĭ��ֱ�Ӱ��س���
if not defined kms set kms=kms.03k.org
ping localhost -n 3 > nul
cls
echo.
echo.
echo --����������ȷ��office��װĿ¼��
echo.
echo --Ĭ��Ϊ��C:\Program Files (x86)\Microsoft Office\Office14\
echo.
set/p url=--Ĭ��ֱ�Ӱ��س���
if not defined url set url=C:\Program Files (x86)\Microsoft Office\Office14
echo.
echo --���óɹ����������������ʼ���
pause>nul
echo.
echo --���ڼ�����Ժ󡣡�����
cd %url%
cscript ospp.vbs /sethst:%kms%
ping localhost -n 3 > nul
cscript ospp.vbs /act
echo.
echo --��������ɡ�����������ؿ�ʼ�˵���
echo.
pause>nul
goto begin





::�رսű�
:end
exit