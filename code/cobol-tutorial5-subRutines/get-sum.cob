       IDENTIFICATION DIVISION.
       PROGRAM-ID. GETSUM.
       DATA DIVISION.
       LINKAGE SECTION.
           01 LNum1 PIC 9 VALUE 5.
           01 LNum2 PIC 9 VALUE 4.
           01 LSum PIC 99.
       PROCEDURE DIVISION USING LNum1, LNum2, LSum,.
           ADD LNum1 TO LNum2 GIVING LSum.
       EXIT PROGRAM.    
         
       