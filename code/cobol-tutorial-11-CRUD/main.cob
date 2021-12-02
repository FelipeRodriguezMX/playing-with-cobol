       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRUD.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT CustomerFile ASSIGN TO "./customer.txt"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS IDNum.
       DATA DIVISION.
       FILE SECTION.
       FD CustomerFile.
       01 CustomerData.
           02 IDNum PIC 99.
           02 FirstName PIC X(31).
           02 LastName PIC X(30).

       WORKING-STORAGE SECTION.
       01 Choice PIC 9.
       01 StayOpen PIC X VALUE 'Y'.
       01 CustExists PIC X.  

       PROCEDURE DIVISION.
       
       StartPara.
           OPEN I-O CustomerFile.
                PERFORM UNTIL StayOpen ='N'
                    DISPLAY ' '
                    DISPLAY 'Customer records'
                    DISPLAY '1 : Agregar'
                    DISPLAY '2 : Eliminar'
                    DISPLAY '3 : Actualizar'
                    DISPLAY '4 : Seleccionar'
                    DISPLAY '0 : Salir'
                    Display ':' WITH NO ADVANCING
                    ACCEPT Choice
                    EVALUATE CHOICE
                        WHEN 1 PERFORM AddCust
                        WHEN 2 PERFORM DeleteCust
                        WHEN 3 PERFORM UptdateCust
                        WHEN 4 PERFORM GetCust
                        WHEN OTHER MOVE 'N' TO StayOpen
                    END-EVALUATE
                END-PERFORM.
           CLOSE CustomerFile.
           STOP RUN.

       AddCust.
           DISPLAY ' '
           DISPLAY 'Inserta Id:' WITH NO ADVANCING.
           ACCEPT IDNum.
           DISPLAY 'Inserta Nombre:' WITH NO ADVANCING.
           ACCEPT FirstName.
           DISPLAY 'Inserta Apellido:' WITH NO ADVANCING.
           ACCEPT LASTNAME.
           DISPLAY ' '
           WRITE CustomerData
               INVALID KEY DISPLAY 'Id ya esta siendo usado'
           END-WRITE.
           
       DeleteCust.
           DISPLAY ' '
           DISPLAY 'Inserta Id de cliente a eliminar:' WITH
           NO ADVANCING.
           ACCEPT IDNum.
           DELETE CUSTOMERFILE
               INVALID KEY DISPLAY 'Id no existe'
           END-DELETE.

       UptdateCust.
           MOVE 'Y' TO CustExists.
           DISPLAY ' '
           DISPLAY 'Inserta Id para actualizar:' WITH NO ADVANCING.
           ACCEPT IDNum.
           READ CUSTOMERFILE
               INVALID KEY MOVE 'N' TO CustExists
           END-READ
           IF CUSTEXISTS IS EQUAL TO 'N' THEN
               DISPLAY 'Cliente no existe'
           ELSE
               DISPLAY 'Inserta Nombre:' WITH NO ADVANCING
               ACCEPT FirstName
               DISPLAY 'Inserta Apellido:' WITH NO ADVANCING
               ACCEPT LASTNAME
           END-IF.
           REWRITE CustomerData
               INVALID KEY DISPLAY 'Cliente no fue actualizado'
           END-REWRITE.

       GetCust.
           MOVE 'Y' TO CustExists.
           DISPLAY ' '
           DISPLAY 'Inserta Id para buscar:' WITH NO ADVANCING.
           ACCEPT IDNum.
           READ CUSTOMERFILE
               INVALID KEY MOVE 'N' TO CustExists
           END-READ
           IF CUSTEXISTS IS EQUAL TO 'N' THEN
               DISPLAY 'Cliente no existe'
           ELSE
               DISPLAY 'Id:' IDNUM
               DISPLAY 'Nombre: ' FIRSTNAME 
               DISPLAY 'Apellido: ' LASTNAME
           END-IF. 