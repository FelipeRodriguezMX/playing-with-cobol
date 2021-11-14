       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-TUTORIALL4.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       SubOne.
           DISPLAY "Paragraph 1"
           PERFORM SubTwo
           DISPLAY "Returned to paragraph 1"
           PERFORM SubFour 2 TIMES
           STOP RUN.
       SubTwo.
           DISPLAY "Paragraph 2".
           PERFORM SubThree
           DISPLAY "Returned to paragraph 2".
       SubThree.
           DISPLAY "Paragraph 3".
       SubFour.
           DISPLAY "Repeat".

       
       STOP RUN.
       