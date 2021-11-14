       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-TUTORIAL3.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS PassingScore IS "A" THRU "C" ,"D".
        *>    CLASS AcceptedScores IS "A" THRU "F".
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Age PIC 99 VALUE 0.
       01 Grade PIC 99 VALUE 0.
       01 Score PIC X(1) VALUE "B".
       01 CanVoteFlag PIC 9 VALUE 0.
           88 CanVote value  1.
           88 CantVote value  0.
       01 TestNumber PIC X.
           88 IsPrime VALUE "1","3","5","7".
           88 IsOdd VALUE "1","3","5","7","9".
           88 IsEven VALUE "2","4","6","8". 
           88 LessThan5 VALUE "1" THRU "4".
           88 ANumber VALUE  "0" THRU "9".
       PROCEDURE DIVISION.
       DISPLAY "Enter age : " WITH NO ADVANCING
       ACCEPT Age
       IF Age > 18 THEN 
           DISPLAY "You can vote"
       ELSE 
           DISPLAY "You can not vote"
       END-IF 
       IF Age LESS THAN 5 THEN 
           DISPLAY "STAY HOME"
       END-IF
       IF Age IS EQUAL TO 5 THEN 
           DISPLAY "Go to kindergarden"
       END-IF
       IF Age IS GREATER THAN 5 AND LESS THAN 18 THEN 
           SUBTRACT Age FROM 5 GIVING Grade
           DISPLAY "Go to grade " Grade  
       END-IF
       IF Age GREATER THAN OR EQUAL TO 18
           DISPLAY "Go to college"
       END-IF
       DISPLAY "Enter a letter from A TO F: "
       ACCEPT Score
       MOVE FUNCTION UPPER-CASE(Score) TO Score
       IF Score IS PassingScore THEN 
           DISPLAY "You passed"
       ELSE 
           DISPLAY "You failed"
       END-IF
       *>    EVALUATE Score
       *>        WHEN Score IS NOT AcceptedScores
       *>           DISPLAY "Score not valid"
       *>        WHEN Score IS PassingScore
       *>            DISPLAY "You passed"
       *>        WHEN OTHER 
       *>            DISPLAY "You failed"
       *>    END-EVALUATE.
       IF Age > 18 THEN
           SET CanVote TO TRUE
       ELSE
           SET CantVote TO TRUE
       END-IF
       DISPLAY "Vote: " CanVoteFlag

       DISPLAY "Enter single number or X to exit: "
       ACCEPT TestNumber
       PERFORM UNTIL NOT ANumber
           EVALUATE TRUE
               WHEN IsPrime DISPLAY "IsPrime"
               WHEN IsOdd DISPLAY "IsOdd"
               WHEN IsEven DISPLAY "IsEven"
               WHEN LessThan5 DISPLAY "LessThan5"                   
               WHEN OTHER DISPLAY "Default acction"                   
           END-EVALUATE
           ACCEPT TestNumber
       END-PERFORM      
       STOP RUN.
    