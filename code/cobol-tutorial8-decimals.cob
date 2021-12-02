       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-TUTORIAL8-DECIMALS.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Price PIC 9(4)V99.
       01 TaxRate PIC V999 VALUE .075.
       01 Fullprice PIC 9(4)V99.
       PROCEDURE DIVISION.
           DISPLAY "Enter the price: " WITH NO ADVANCING
           ACCEPT Price
           COMPUTE FullPrice ROUNDED = Price + (Price * TaxRate)
           DISPLAY "Tax + Price: " FullPrice
           STOP RUN.
       