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
    SET $a 0
    SET $b 0
    SET $c 0
    SET $d 63
!loop
    STR $z !X1 $a
    STR $z !Y1 $b
    STR $z !X2 $c
    STR $z !Y2 $d
    STR $z !FILL $c
    STR $z !STROKE $c
    STR $z !LINE $z
    STR $z !UPDATE $z
    ADD $a 2
    ADD $c 2
    CMP $a 64
    JE !end
    JMP !loop
!end
