       identification division.
       program-id. sort-records.
       environment division.
       input-output section .
       file-control.
           select workfile assign to './work.tmp'.
           select file1 assign to './data.dat'
               organization  is line sequential. 
           select file2 assign to './data3.dat'
               organization  is line sequential. 
           select newFile assign to './data4.dat'
               organization  is line sequential. 
       data division.
       file section.
       fd file1.
       01 studData.
           02 idNum pic 9.
           02 studName pic x(9).
       fd file2.
       01 studData2.
           02 idNum2 pic 9.
           02 studName2 pic x(9).
       sd workfile.
       01 WstudData.
           02 widNum pic 9.
           02 wstudName pic x(9).
       fd NEWFILE.
       01 NstudData.
           02 NidNum pic 9.
           02 NstudName pic x(9).
        *>    fd file2.
        *>    01 sstudData.
        *>        02 sidNum pic 9.
        *>        02 sstudName pic x(9).
       working-storage section.
       procedure division.
        *>    sort workfile on ascending key sidNum
        *>        using  file1
        *>        giving file2.
           MERGE workfile on ascending key NidNum
           using  file1 file2
           GIVING newFile

           stop run.