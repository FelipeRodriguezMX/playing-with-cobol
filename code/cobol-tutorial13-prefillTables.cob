       identification division.
       program-id. prefill-tables.
       data division.
       working-storage section.
       01 prodtable.
           02 prodData.
               03 filler pic x(9) value 'Rojo SML'.
               03 filler pic x(9) value 'Azul SML'.
               03 filler pic x(9) value 'Verde SML'.
           02 filler redefines PRODDATA.
               03 shirt occurs 3 times.
                   04 prodName pic x(5).
                   04 prodsize pic a occurs 3 times.
       01 changeme.
           02 textnum pic x(6).
           02 floatnum redefines  textnum pic 9(4)v99. 
       01 Strnum pic x(9).
       01 splitnum.
           02 Wnum pic 9(4) value zero.
           02 fnum pic 99 value zero.
       01 flnum redefines  SPLITNUM pic 9999v99.
       01 dollarnum pic $$,$$9.99.
       procedure division.
           display  shirt(1)
           move '123456' to textnum
           display  floatnum.
           display  'enter float : ' with  no advancing 
           accept  STRNUM.
           unstring Strnum 
               delimited  by '.' or all spaces 
               into Wnum, FNUM
           move flnum  to dollarnum
           display dollarnum.
           stop run.