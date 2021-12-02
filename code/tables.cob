       IDENTIFICATION DIVISION.
       program-id. tables.
       data division.
       working-storage section.
       01 table1.
           02 friend pic x(15) occurs 4 times.
       01 custTable.
           02 custName occurs 5 times.
               03 Fname pic x(15).      
               03 Lname pic x(15). 
       01 ordertable.
           02 product occurs 2 times indexed by i.
               03 pname pic x(11).
               03 psize occurs 3 times indexed by j.
                    04 sizetype pic A.
       procedure division.
           set i j to 1
           move 'camisa azul' to product(i)
           move 's' to psize(i,j)
           set j up by 1.
           move 'm' to psize(i,j).
           set j down  by 1.
           move 'camisa azulSMLcamisa rojaSML' to ordertable
           perform GetProduct varying  i from 1 by 1 until i>2.
           go to Lookup.

       GetProduct.
           display  product(i)
           perform  GetSizes varying  j from 1 by 1 until j>3.
       GetSizes.
           display  psize(i,j).
       Lookup.
           set i to 1
           search  product at end display  'producto no encontrado'
               when pname(i) = 'camisa roja' 
                   display 'camisa roja emcontrada'
           end-search.
           stop run.
       