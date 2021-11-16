       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-TUTORIAL10-FILES.
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
       01 WSCustomer.
           02 WSIDNum PIC 9(5).
           02 WSCustName.
               03 WSFirstName PIC X(31).
               03 WSLastName PIC X(30).
       PROCEDURE DIVISION.
       OPEN OUTPUT CustomerFile.
           MOVE 00001 TO IDNum.
           MOVE "Felipe de Jesus" TO FirstName.
           MOVE "Rodriguez Ontiveros" TO LastName.
           WRITE CustomerData
           END-WRITE.
           MOVE 00001 TO IDNum.
           MOVE "Felipe de Jesus2 1111111111111" TO FirstName.
           MOVE "Rodriguez Ontiveros" TO LastName.
           WRITE CustomerData
           END-WRITE.
       CLOSE CustomerFile.
       STOP RUN.
       