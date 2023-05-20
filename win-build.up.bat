@echo off

@echo off
if "%~1"=="build" (
    docker build -t qmail .
) else (
    docker run --name=qmail -it --rm -p 10080:80 -p 20025:25 -p 110:110 -p 993:993 -p 143:143 -p 995:995 -v /home/vpopmail/domains:/home/vpopmail/domains qmail
)

