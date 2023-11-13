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
    str $z !X1 $z 
    str $z !Y1 $z 
    set $a 63 
    str $z !X2 $a 
    str $z !Y2 $a 
    str $z !STROKE PC      ;turns on border, but we’ll turn off 
    str $z !DRAWSTROKE $z  ;no stroke 
    XOR $c, $c
!top 
    str $z !FILL $c 
    str $z !RECT $d 
    str $z !UPDATE SP 
    inc $c 
    jmp !top 