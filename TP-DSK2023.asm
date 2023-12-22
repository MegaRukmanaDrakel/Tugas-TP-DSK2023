;Program ini menghitung luas persegi
;dengan dua buah input variable bebas panjang dan lebar yang dapat bernilai positif maupun negatif
;output luas sebagai variable terikat
;Loki Lang
NAME "EUNNIKE"        
INCLUDE 'emu8086.inc' 
#MAKE_COM#            
ORG 100H              
JMP MULAI             
PSN1    DB "EUNNIKE MENGHITUNG LUAS PERSEGI, DENGAN INPUT VARIABLE PANJANG DAN LEBAR",13,10
        DB "OUTPUT LUAS HASIL KALI VARIABLE PANJANG DENGAN LEBAR",13,10,13,10,'$'
PSN2    DB "MASUKKAN NILAI PANJANG PERSEGI: $"
PSN3    DB "MASUKKAN NILAI LEBAR PERSEGI: $"
PSN4    DB "LUAS PERSEGI TERSEBUT ADALAH: $"
PSN5    DB 13,10,13,10,"TERIMA KASIH TELAH MENGGUNAKAN PROGRAM EUNNIKE..."
        DB 13,10,13,10,"TEKAN SEMBARANG UNTUK KELUAR $"
PJG     DW ?
LBR     DW ?
ARE     DW ?

MULAI:
LEA DX,PSN1           
MOV AH,9              
INT 21H               

LEA DX,PSN2
MOV AH,9              
INT 21H

CALL SCAN_NUM         

MOV PJG,CX            

PUTC 13               
PUTC 10

LEA DX,PSN3
MOV AH,9              
INT 21H

CALL SCAN_NUM         

MOV LBR,CX            

MOV AX,LBR            
MOV BX,PJG            
IMUL BX
PUSH AX

PUTC 13               
PUTC 10

LEA DX,PSN4
MOV AH,9              
INT 21H

POP AX
MOV ARE,AX            

CALL PRINT_NUM        
                      
PUTC 13               
PUTC 10
LEA DX,PSN5
MOV AH,9              
INT 21H

MOV AH,0              
INT 16H

RET                   

DEFINE_SCAN_NUM       
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END
