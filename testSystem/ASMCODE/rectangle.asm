JMP !main
!LIVESCREEN #8000 
!UPDATESCREEN #9000 
!X1 #D000 
!Y1 #D001 
!X2 #D002
!Y2 #D003 
!STROKE #D010 
!FILL #D011 
!DRAWFILL #D012 
!DRAWSTROKE #D013 
!RAND #D700 
!UPDATE #E000 
!RECT #E010 
!LINE #E011 
!POINT #E012 
!MOUSEX #FFFC 
!MOUSEY #FFFD 
!TERM #FFFF 
!KEY #FFFE 

!main
    SET $a $z
    SET $b $z
    SET $c 20
    SET $d 34
    STR $z !X1 $a
    STR $z !Y1 $b
    STR $z !X2 $c
    STR $z !Y2 $d
    STR $z !FILL $z
    STR $z !STROKE $z
    STR $z !RECT $c
    STR $z !UPDATE $z