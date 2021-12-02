       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITEDATA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CustomerFile ASSIGN TO "./Customer.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS IS SEQUENTIAL.
     
       DATA DIVISION.
       FILE SECTION.
       FD CustomerFile.
       01 CustomerData.
           02 IDNum PIC 9(5).
           02 CustName.
               03 FirstName PIC X(31).
               03 LastName PIC X(30).
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           OPEN EXTEND CustomerFile.
               DISPLAY "Insert id: " WITH NO ADVANCING
               ACCEPT IDNum
               DISPLAY "First Name: " WITH NO ADVANCING
               ACCEPT FirstName
               DISPLAY "Last Name: " WITH NO ADVANCING
               ACCEPT LastName
               WRITE CustomerData
               END-WRITE.
           CLOSE CustomerFile.
           STOP RUN.
