       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltutorial.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.

       *> WORKING-STORAGE SECTION: DECLARACION DE VARIABLES PARA TODO EL
       *> PROGRAMA.
       WORKING-STORAGE SECTION.
       01 UserName PIC X(30) VALUE "you".
       01 num1     PIC 99 VALUE ZEROS.
       01 num2     PIC 99 VALUE ZEROS.
       01 total    PIC 99 VALUE 0.
       01 SSnum.
           02 SSarea   PIC 999.
           02 SSgroup  PIC 999.
           02 SSSerial PIC 999.

       PROCEDURE DIVISION.
           DISPLAY "Cual es tu nombre ".
           ACCEPT UserName
           DISPLAY "Hola " UserName
    
           MOVE ZERO TO UserName
           DISPLAY UserName
           DISPLAY "Inserta 2 numeros"
           ACCEPT num1
           ACCEPT num2
           COMPUTE total = num1 + num2
           DISPLAY num1 " + " num2 " = " total
           DISPLAY "Introduce tu numero de seguro social"
           ACCEPT SSnum
           DISPLAY "Area " SSarea
    
           STOP RUN.
