@echo off

rem /!\ This is an EXAMPLE of miner start script, replace all EXAMPLE values with yours /!\

rem Pool address, can be a name or a dotted IP
rem Replace that EXAMPLE value with yours
set POOL=xmrpool.eu

rem Pool port, can be standard or SSL.
rem If SSL, see note below.
rem Replace that EXAMPLE value with yours
set PORT=3333

rem If you use a SSL port, change to: set SSL=--ssl
rem Otherwise leave empty
set SSL=

rem Your wallet. Some pools let you add extra information at the end like .PAYMENTID or .FIXEDDIFF
rem no problem, that's supported.
rem Replace that EXAMPLE value with yours
rem This is the donation wallet.
set WALLET=43iTLAWVGiv5T53hXS7S35ehZtvJ7zmP6gnyMqoCP66gPoqRNiSY34TXhiaQEGiCaMe79YVzRicRA1wAnYsvTNTEJ5ojZPu

rem 'x' almost always works, some pools let you put a Worker name here. Rarely important.
set PASSWORD=x

rem 0 is "automatic", you can force one of:
rem 1 = Original Cryptonight
rem 2 = Original Cryptolight
rem 3 = Cryptonight V7 fork of April-2018
rem 4 = Cryptolight V7 fork of April-2018
rem 5 = Cryptonight-Heavy
rem 6 = Cryptolight-IPBC
rem 7 = Cryptonight-XTL fork of May-2018
set FORK=0

rem Auto-Select 32 or 64 bits
if defined BITS goto :SkipBits
set BITS=64
if x%PROCESSOR_ARCHITECTURE%==xx86 set BITS=32
:SkipBits

rem All is good ! Let's mine
@echo on
jce_cn_cpu_miner%BITS%.exe --auto --any --forever --variation %FORK% --low -o %POOL%:%PORT% -u %WALLET% -p %PASSWORD% %SSL% %*
@pause
