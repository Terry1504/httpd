//LOADSET  JOB MSGLEVEL=1,CLASS=S,MSGCLASS=S
/*ROUTE PRINT <your-id-here>
/*ROUTE PUNCH <your-id-here>
//TLDR   EXEC  PGM=TPFLDR40,REGION=8M,
//             PARM='OLDR,SYS=ACP,CLMSIZE=8000000'
//STEPLIB  DD  DSN=ACP.LINK.RLSE40.BSS,DISP=SHR
//         DD  DSN=SYS1.CEE.SCEERUN,DISP=SHR
//SALTB    DD  DSN=ACP.SALTBL.RLSE40.BSS,DISP=SHR
//OBJLIB   DD  DSN=ACP.OBJ.RLSE40.BSS,DISP=SHR
//LOADMOD  DD  DSN=<your-source-dsn-here>,DISP=SHR
//         DD  DSN=ACP.LINK.RLSE40.BSS,DISP=SHR
//LOADSUM  DD  DSN=&&LOADSUM,DISP=(NEW,PASS),UNIT=SYSDA,
//             LRECL=133,SPACE=(TRK,(10,10)),RECFM=FBA
//CPRTEMP  DD  UNIT=SYSDA,
//             DSN=&&CPRTEMP,SPACE=(TRK,(100,20)),
//             DCB=(RECFM=FB,BLKSIZE=4095,LRECL=4095),
//             DISP=(NEW,DELETE)
//PROGTEMP DD  UNIT=SYSDA,
//             DSN=&&PRTEMP,SPACE=(TRK,(100,20)),
//             DCB=(RECFM=FB,BLKSIZE=4095,LRECL=4095),
//             DISP=(NEW,DELETE)
//OUTPUT   DD  DSN=&&VRDROUT,DISP=(NEW,PASS),UNIT=SYSDA,
//             DCB=(RECFM=F,BLKSIZE=4095,LRECL=4095)
//SYSUDUMP DD  DUMMY
//SYSABEND DD  DUMMY
//SYSOUT   DD  SYSOUT=A
//SYSPRINT DD  SYSOUT=A
//PRINTER  DD  SYSOUT=A
//CEEDUMP  DD  SYSOUT=A
//SYSIN    DD  *
SYSID=BSS
PATVERS=NONE
SALVERS=40
LOADER   LOADSET  HTTPD<vv>
LOADER   CALL  PROG CHTA<vv>
/*
//TRANSMIT EXEC PGM=IKJEFT01,
//  PARM='TRANSMIT <your-id-here> DDNAME(SYSTSIN) NOLOG NONOTIFY SEQ'
//SYSTSIN  DD  UNIT=SYSDA,
//             DSN=&&VRDROUT,DISP=(OLD,DELETE)
//SYSTSPRT DD  DUMMY
