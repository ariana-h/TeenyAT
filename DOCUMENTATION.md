
# TeenyAT Robot Architecture
**/ˈtē∙nē∙ət/**  
**An Architecture to Virtualize**

---

#### Reference Manual


## Contents
### 1. Overview
### 2. Core Architectural Elements
### 3. Instruction Encodings
### 4. Instruction Set
### 5. Instruction Opcodes
### 6. Syntax
### 7. Sample Program

## 1. Overview
*Write overview here*

***Note:** add a note about the TeenyAT*

## 2. Core Architectural Elements
The architecture contains:
-   16 bit words (each memory address points to a 16 bit value)
-   32K words of RAM from 0x0000 through 0x7FFF
	-   Address 0x8000-0xFFFF: available for hardware access
-   8 registers available to all register-use instructions
	-   PC (reg[0]) is the program counter, contains address of next instruction, initially 0x0000    
	-   SP (reg[1]) is the stack pointer, contains address of the next top element, initially 0x7FFF (empty)
		-   stack grows down in memory
	-   rZ (reg[2]) is the "Zero" register, which always contains the value 0.
		-   all attempts to modify rZ are ignored
	-   rA through rE (reg[3] through reg[7]) are general purpose registers
-   Instructions encoded in either one or two 16 bit words
	-   Fetch must set PC = PC + 1 - T, where T is the "teeny" bit to account for this
		-   if teeny == 1, the instruction is 16 bits (essentially assumes 2nd word is 0x0000)
		-   if teeny == 0, the instruction is 32 bits and  requires an additional cycle

## 3. Instruction Encodings

**First Word**
```
     -------------------------------------------------------------------------------------
    | 15 | 14 | 13 | 12 | 11 |   10  | 9 | 8 | 7 | 6 | 5 | 4 |   3   |   2  |   1  |   0  |
    |-------------------------------------------------------------------------------------|
    |          opcode        | Teeny |   Reg_1   |   Reg_2   | Carry | Eqls | Less | Grtr |
    |-------------------------------------------------------------------------------------|
    |    |    |    |    |    |       |   |   |   |   |   |   |      Immed_4 / Addr_4      |
     -------------------------------------------------------------------------------------
```
**Second Word**
```
     -------------------------------------------------------------------------------------
    | 15 | 14 | 13 | 12 | 11 |   10  | 9 | 8 | 7 | 6 | 5 | 4 |   3   |   2  |   1  |   0  |
    |-------------------------------------------------------------------------------------|
    |                                Immed_16 / Addr_16                                   |
    |-------------------------------------------------------------------------------------|
    |    |    |    |    |    |       |   |   |   |   |   |   |       |      |      |      |
     -------------------------------------------------------------------------------------
```

## 4. Instruction Set
### 4.1 SET
Opcode: 0
### 4.2 LOD
Opcode: 1
### 4.3 STR
Opcode: 2
### 4.4 PSH
Opcode: 3
### 4.5 POP
Opcode: 4
### 4.6 BTS
Opcode: 5
### 4.7 BTC
Opcode: 6
### 4.8 BTF
Opcode: 7
### 4.9 CAL
Opcode: 8
### 4.10 ADD
Opcode: 9
### 4.11 SUB
Opcode: 10
### 4.12 MPY
Opcode: 11
### 4.13 DIV
Opcode: 12
### 4.14 MOD
Opcode: 13
### 4.15 AND
Opcode: 14
### 4.16 OR
Opcode: 15
### 4.17 XOR
Opcode: 16
### 4.18 SHF
Opcode: 17
### 4.19 ROT
Opcode: 18
### 4.20 NEG
Opcode: 19
### 4.21 CMP
Opcode: 20
### 4.22 DLY
Opcode: 23
### 4.23 JMP
Opcode: 21  
Jumps on:  
0000   
0001   
0010   
0011   
0100   
0101  
0110  
0111  
1000  
1001  
1010  
1011  
1100  
1101  
1110  
1111  
### 4.24 JE
Opcode: 21  
Jumps on:  
0000  
0001  
0010  
0011  
0100  
0101  
0110  
0111  
1000  
1001  
1010  
1011  
1100  
1101  
1110  
1111  
### 4.25 JNE
Opcode: 21  
Jumps on:  
0000  
0001  
0010  
0011  
0100  
0101  
0110  
0111  
1000  
1001  
1010  
1011  
1100  
1101  
1110  
1111 
### 4.26 JL
Opcode: 21  
Jumps on:  
0000  
0001  
0010  
0011  
0100  
0101  
0110  
0111  
1000  
1001  
1010  
1011  
1100  
1101  
1110  
1111 
### 4.27 JLE
Opcode: 21  
Jumps on:  
0000  
0001  
0010  
0011  
0100  
0101  
0110  
0111  
1000  
1001  
1010   
1011  
1100  
1101  
1110  
1111  
### 4.28 JG
Opcode: 21  
Jumps on:  
0000  
0001  
0010  
0011  
0100  
0101  
0110  
0111  
1000  
1001  
1010  
1011  
1100  
1101  
1110  
1111  
### 4.29 JGE
Opcode: 21   
Jumps on:  
0000  
0001    
0010   
0011   
0100   
0101  
0110  
0111  
1000  
1001  
1010  
1011  
1100  
1101  
1110  
1111 
### 4.30 DJZ
Opcode: 22
### 4.31 INC
Opcode: 9  
*Psuedo instruction 
### 4.32 DEC
Opcode: 10  
*Psuedo instruction 
### 4.33 RET
Opcode: 4  
*Psuedo instruction  

</br></br>

***Note:** Notice that all instructions are either three characters or less to maintain a sense of order when looking at the assembly code.*

***\*Pseudo instructions:** These instructions can be synthesized with a single different instruction. Reference the opcode for this.*

## 5. Instruction Opcodes
|       Instructions             |      Opcode  |
|--------------------------------|:------------:|
|      SET                       |     0        |
|      LOD                       |     1        |
|      STR                       |     2        |
|      PSH                       |     3        |
|      POP                       |     4        |
|      BTS                       |     5        |
|      BTC                       |     6        |
|      BTF                       |     7        |
|      CAL                       |     8        |
|      ADD                       |     9        |
|      SUB                       |     10       |
|      MPY                       |     11       |
|      DIV                       |     12       |
|      MOD                       |     13       |
|      AND                       |     14       |
|      OR                        |     15       |
|      XOR                       |     16       |
|      SHF                       |     17       |
|      ROT                       |     18       |
|      NEG                       |     19       |
|      CMP                       |     20       |
|      JMP/JE/JNE/JL/JLE/JG/JGE  |     21       |
|      DJZ                       |     22       |
|      DLY                       |     23       |

</br></br>

***Fun fact:** If all words of memory are initialized to 0x0000, then if-ever a program should try to run code beyond that loaded into memory, the fetched instruction will be 0x0000_0000, which decodes into "set pc, 0x0000"... so the program will start over automatically since the first line of code is at 0x0000.​*

## 6. Syntax
### 6.1 Comments
### 6.2 Labels
### 6.3 Etc.

## 7. Sample Program