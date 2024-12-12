Before accessing memory, always verify the address is valid. This often requires checking against known limits or validating pointers.

; Check if ecx is within bounds 
mov ecx, 10; Example valid value of ecx
mov edx, 1000; Example maximum address limit
cmp ecx, edx 
jge error_handling; Jump to error handling if ecx is out of bounds

mov eax, [ebx+4*ecx] ; Access memory after bounds check

; Check if eax points to a valid address 
mov edx, [eax]; Load a value from the address pointed by eax
cmp edx, 0; Compare to a null pointer
je error_handling; Jump to error handling if eax is invalid

mov edi, [eax] ; Access memory after validation

; ... further code using edi and eax ...

error_handling:
;Handle the error, for example, by exiting the program or using a default value.
mov eax, 1 ; Exit code
int 0x80