       IDENTIFICATION DIVISION.
       PROGRAM-ID. READDATA.
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
       01 WSEOF PIC A(1).
       PROCEDURE DIVISION.
           OPEN INPUT CustomerFile.
               PERFORM UNTIL WSEOF IS EQUAL TO 'Y'
                   READ CustomerFile INTO WSCUSTOMER
                       AT END MOVE 'Y' TO WSEOF
                       NOT AT END DISPLAY WSCUSTOMER
                   END-READ
               END-PERFORM
           CLOSE CustomerFile.
           STOP RUN.
       