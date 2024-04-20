load rom a 4
save a ram[0]

load rom a 0x0
save a ram[1]
load rom a 0x0
save a ram[2]
load rom a 0x0
save a ram[3]
load rom a 0x0
save a ram[4]

load rom a 0x1
save a ram[6]
load rom a 0x0
save a ram[7]
load rom a 0x0
save a ram[8]
load rom a 0x0
save a ram[9]

:start
load rom a 0
save a ram[5] //i=0

:repeat

load ram[5] b //i
load rom a 6  //arr2
opp a+b      
load ram[a] a //arr2[i]

mov a c      
//b should still have i
load rom a 1   //arr1
opp a+b
load ram[a] a  //arr1[i]
mov a b

load ram[11] a
cmp a a
jmp = nocarry //if carry
opp b+1       //b += 1
mov a b
:nocarry
mov c a
opp a+b         //arr1[i] + arr2[i]
save a ram[10] //fn = arr1[i] + arr2[i]

load rom a 0
jmp >= nocarrygen
load rom a 1
:nocarrygen
save a ram[11]

//TODO: Think about a half carry flag
load rom a 0x0f
opp a&b
mov c b
mov a c
load rom a 0x0f
opp a&b
mov c b
opp a+b
load rom b 0x0a
cmp a b
load ram[10] a   //a = fn
jmp < dontaddsix //if arr1[i]&0x0f + arr2[i]&0x0f > 9
load rom b 6
opp a+b          //fn += 6
save a ram[10]
jmp < addsix    //Jump if carry
:dontaddsix

load ram[11] a
cmp a a
jmp != addsix //Jump if carry

load ram[10] a   //a = fn
load rom b 0xa0
cmp a b
jmp < dontaddsix2
:addsix
load ram[10] a   //a = fn
load rom b 0x60
opp a+b
save a ram[10]
opp 1
save a ram[11] //Set carry to 1
:dontaddsix2

load ram[5] b
load rom a 6 //arr2
opp a+b      
load ram[a] a   //arr2[i]
mov a c
load ram[5] b   //i
load rom a 1 //arr1
opp a+b
save a mar
save c ram   //arr1[i] = arr2[i]

load ram[5] b   //i
load rom a 6 //arr2
opp a+b
load ram[10] c   //fn
save a mar  //arr2[i] = ...
save c ram  //arr2[i] = fn

load ram[5] a  //i
load ram[0] b  //size
opp a+1     
cmp a b 
save a ram[5]  //i++
jmp < repeat //i < size

opp 0
save a ram[12]

load ram[0] a
opp a-1
save a ram[5] //i=size-1
:reverseloop

//Print out BCD digits

load rom a 6   //arr2
load ram[5] b  //i
opp a+b
load ram[a] a  //arr2[i]
mov a c

load rom b 4
opp a>>b
mov a b

cmp a a
jmp = notrim
opp 1
save a ram[12]
:notrim
load ram[12] a
cmp a a
jmp = noout

mov b a
load rom b 48
opp a+b
out a    //(arr2[i] >> 4) + 48
load rom b 0b10000000
opp a|b
out a    //((arr2[i] >> 4) + 48) | 0b10000000
:noout

mov c a
load rom b 0x0f
opp a&b
mov a b

cmp a a
jmp = notrim2
opp 1
save a ram[12]
:notrim2
load ram[12] a
cmp a a
jmp = noout2

mov b a
load rom b 48
opp a+b
out a   //(arr2[i] & 0x0f) + 48
load rom b 0b10000000
opp a|b
out a   //((arr2[i] & 0x0f) + 48) | 0b10000000
:noout2

load ram[5] a  //i
opp a-1
save a ram[5]  //i--
jmp .> reverseloop //i >= 0

//Print out a newline
load rom a 10
out a
load rom b 0b10000000
opp a|b
out a

jmp start
