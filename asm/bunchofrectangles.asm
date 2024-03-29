JMP !main
.const LIVESCREEN 0x8000 
.const UPDATESCREEN 0x9000 
.const X1 0xD000 
.const Y1 0xD001 
.const X2 0xD002
.const Y2 0xD003 
.const STROKE 0xD010 
.const FILL 0xD011 
.const DRAWFILL 0xD012 
.const DRAWSTROKE 0xD013 
.const RAND 0xD700 
.const UPDATE 0xE000 
.const RECT 0xE010 
.const LINE 0xE011 
.const POINT 0xE012 
.const MOUSEX 0xFFFC 
.const MOUSEY 0xFFFD 
.const TERM 0xFFFF 
.const KEY 0xFFFE 

!main
    SET rA, 0
    SET rB, 0
    SET rC, 15
    SET rD, 15

!loop
    STR [X1], rA
    STR [Y1], rB
    STR [X2], rC
    STR [Y2], rD
    
    STR [FILL], rC
    STR [STROKE], rZ
    STR [RECT], rC
    STR [UPDATE], rZ

    INC rC
    INC rD
    ADD rA, 2
    ADD rB, 2 
    JMP !loop