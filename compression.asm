.386 
.model flat, stdcall 

;includem msvcrt.lib si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf : proc
extern scanf : proc
extern fopen : proc
extern fgets : proc
extern fprintf : proc
extern fclose : proc


;declaram simbolul start ca public - de acolo incepe executia
public start

.data 
	;vect DB 1, 2, 3, 4, 5
	path db 1000 dup(0)
	path1 db "encrdecr.txt",0
	path2 db "text.txt",0
	path3 db "output.txt",0
	path4 db "dict.txt",0
	text db 1000 dup (0)
	text1 db 1000 dup (0)
	text2 db 1000 dup (0)
	dict db 1000 dup (0)
	output db 1000 dup(0)
	counter db 0
	max_length dd 255
	okWord db 0
	startPos dd 0
	endPos dd 0
	encrdecr db 0
	
	max_length1 dd 255
	
	mode_read db "r",0
	mode_write db "w",0
	;lung_sir DB $-vect
	
	fp dd 0
	fp1 dd 0
	fp2 dd 0
	fout dd 0
	fout1 dd 0
	format1 db "%d",0
	format2 db "%s",0
	sentence1 db "Insert absolute path: ",0
	example db "Ana are mere. George are mere.",0
	noLettersWord db 0
	index dd 0
.data? 
   
.code 
start:
	
	;read string from text.txt "Ana are mere. George are mere."
	call open_text_file
	
	;Save file descriptor
	mov fp2,eax
	
	;read string from text.txt
	call busy_waiting_text
	
	;open the file which contains the variable that decides whether there's an encryption/decryption operation
	call open_encr_decr_file
	
	;Save file descriptor
	mov fp1,eax
	
	;busy waiting for encryption/decryption variable to be added into encrdecr.txt
	call busy_waiting_encr_decr
	
	;decide encryption/decryption
	
	call decide_encr_decr
	
	call save_results
	
	push 0 
	call exit
	
	
	open_text_file proc
		push offset mode_read
		push offset path2
		call fopen
		add esp,8
		ret
	open_text_file endp
	
	busy_waiting_text proc
		loop_read_string1:
		
		push fp2
		push max_length1
		push offset text2
		call fgets
		add esp,12
		
		lea esi,text2
		mov ebx,0
		mov bl,[esi]
		cmp bl,0
		je loop_read_string1
		ret
	busy_waiting_text endp
	
	open_encr_decr_file proc
		;open encrdecr.txt
		push offset mode_read
		push offset path1
		call fopen
		add esp,8
		ret
	open_encr_decr_file endp
	
	busy_waiting_encr_decr proc
		loop_read_string:
		
		push fp1
		push max_length1
		push offset text1
		call fgets
		add esp,12
		
		
		lea esi,text1
		mov ebx,0
		mov bl,[esi]
		cmp bl,0
		je loop_read_string
		ret
	busy_waiting_encr_decr endp
	
	decide_encr_decr proc
		lea esi,text1
		mov eax,0
		mov al,[esi]
		sub al,48
		cmp al,0
		je encryption
		jmp final
		
		encryption:
		
		call encryption_proc
		ret
		
		final:
		
		call save_results
		ret
		
	decide_encr_decr endp
	
	encryption_proc proc
	
		call initialize_registers_1
		
		init_registers:
		
		call init_registers_proc
		
		loop1:
		
		mov al,[esi]
		cmp al,0
		je verify_last_word
		jmp big_letter
		
		verify_last_word:
		cmp okWord,0
		je compress
		jmp not_letter
		
		big_letter:
		cmp al,65 ;'A'
		jb not_big_letter
		cmp al,90 ;'Z'
		ja not_big_letter
		;big_letter
		jmp analyze_letter
		
		not_big_letter:
		cmp al,97 ;'a'
		jb not_letter
		cmp al,122 ;'z'
		ja not_letter
		
		;big or small letter
		analyze_letter:
		cmp okWord,0
		je save_start_pos
		inc esi
		inc ecx
		jmp loop1

		not_letter:
		cmp okWord,1
		je save_end_pos
		inc esi
		inc ecx
		jmp loop1
		
		save_start_pos:
		
		call save_start_pos_proc
		jmp loop1
		
		save_end_pos:
		call save_end_pos_proc
		jmp search_word_dict
		
		search_word_dict:
		lea edi,dict
		
		compare_values:
		mov ebx,0
		mov bl,[edi]
		cmp bl,0
		je add_word_to_dict
		
		lea esi,text2
		mov eax,0
		mov edx,0
		mov edx,startPos
		add edx,index
		mov al,[esi+edx]
		cmp al,65 ;'A'
		jb not_bl
		cmp al,90 ;'Z'
		ja not_bl
		add al,32
		not_bl:
		cmp al,97 ;'a'
		jb not_l
		cmp al,122 ;'z'
		ja not_l
		jmp sl
		
		not_l:
		inc endPos
		jmp init_registers
		
		sl:
		cmp al,bl
		jne  next_word_dict
		inc index
		inc edi
		jmp compare_values
		
		next_word_dict:
		mov bl,[edi]
		cmp bl,0
		je add_word_to_dict
		cmp bl,32
		je next_word_dict_found
		inc edi
		jmp next_word_dict
		
		next_word_dict_found:
		inc edi
		mov index,0
		jmp compare_values
		
		add_word_to_dict:
		lea esi,text2
		mov index,0
		mov edx,0
		mov edx,startPos
		
		loop_add_word_to_dict:
		cmp noLettersWord,0
		je add_space
		add edx,index
		mov bl,[esi+edx]
		
		cmp bl,65 ;'A'
		jb add_letter
		cmp bl,90 ;'Z'
		ja add_letter
		add bl,32
		
		add_letter:
		
		call add_letter_proc
		jmp loop_add_word_to_dict
		
		add_space:
		
		call add_space_proc
		jmp init_registers
		
		;compress file 
		
		compress:
		
		call compress_proc
		ret
		
	encryption_proc endp
	
	save_results proc
		
	
		push offset output
		push offset format2
		call printf
		add esp,8
		
		;write output to file output.txt
		push offset mode_write
		push offset path3
		call fopen
		add esp,8
		
		;save file descriptor
		mov fout,eax
		
		push offset output
		push offset format2
		push fout 
		call fprintf
		add esp,12
		
		;write dictionary to file dict.txt
		push offset mode_write
		push offset path4
		call fopen
		add esp,8
		
		;save file descriptor
		mov fout1,eax
		
		push offset dict
		push offset format2
		push fout1 
		call fprintf
		add esp,12		
		
		ret
	save_results endp
	
	initialize_registers_1 proc
		lea edi,dict
		mov ecx,0
		mov eax,0
		ret
	initialize_registers_1 endp
	
	init_registers_proc proc
		lea esi,text2
		mov edx,0
		mov edx,endPos
		lea esi,[esi+edx]
		ret
	init_registers_proc endp
	
	save_start_pos_proc proc
		mov startPos,ecx
		inc okWord
		inc esi
		inc ecx
		ret
	save_start_pos_proc endp
	
	save_end_pos_proc proc
		mov endPos,ecx
		dec endPos
		mov okWord,0
		mov ebx,startPos
		mov edx,endPos
		sub edx,ebx
		inc edx
		mov noLettersWord,dl
		mov index,0
		ret
	save_end_pos_proc endp
	
	save_end_pos_c_proc proc
		mov endPos,ecx
		dec endPos
		mov okWord,0
		mov ebx,startPos
		mov eax,endPos
		sub eax,ebx
		inc eax
		mov noLettersWord,al
		mov index,0
		ret
	save_end_pos_c_proc endp
	
	add_letter_proc proc
		mov [edi],bl
		inc edi
		inc index
		mov edx,startPos
		dec noLettersWord
		ret
	add_letter_proc endp
	
	add_space_proc proc
		mov edx,0
		mov dl,32
		mov [edi],dl
		inc edi
		inc endPos
		ret
	add_space_proc endp
	
	compress_proc proc
		;lea esi,example
		
		call init_compress_proc_registers
		
		init_registers_c:
		
		call init_registers_c_proc
		
		loop_compress:
		
		mov al,[esi]
		cmp al,0
		je finish
		
		big_letter_c:
		cmp al,65 ;'A'
		jb small_letter_c
		cmp al,90 ;'Z'
		ja small_letter_c
		jmp analyze_letter_c
		
		
		small_letter_c:
		cmp al,97 ;'a'
		jb not_letter_c
		cmp al,122 ;'z'
		ja not_letter_c
		
		analyze_letter_c:
		cmp okWord,0
		je save_start_pos_c
		inc esi
		inc ecx
		jmp loop_compress
		
		save_start_pos_c:
		mov startPos,ecx
		inc okWord
		inc esi
		inc ecx
		jmp loop_compress
		
		
		not_letter_c:
		cmp okWord,1
		je save_end_pos_c
		mov [edi],al
		inc esi
		inc edi
		inc ecx
		jmp loop_compress
		
		save_end_pos_c:
		call save_end_pos_c_proc
		jmp search_word_dict_c
		;jmp finish
		
		search_word_dict_c:
		lea edx,dict
		mov counter,0
		
		compare_values_c:
		lea esi,text2
		mov bl,[edx]
		push ecx
		mov ecx,0
		mov ecx,startPos
		add ecx,index
		mov al,[esi+ecx]
		pop ecx
		
		cmp al,65
		jb not_bl_c
		cmp al,90
		ja not_bl_c
		add al,32
		not_bl_c:
		cmp al,97 ;'a'
		jb not_l_c
		cmp al,122 ;'z'
		ja not_l_c
		jmp sl_c
		
		not_l_c:
		inc endPos
		mov ebx,0
		mov bl,counter
		add bl,48
		mov [edi],bl
		inc edi
		jmp init_registers_c
		
		sl_c:
		cmp al,bl
		jne next_word_dict_c
		inc index
		inc edx
		jmp compare_values_c
		
		next_word_dict_c:
		mov bl,[edx]
		;cmp bl,0
		;je add_word_to_dict
		cmp bl,32
		je next_word_dict_found_c
		inc edx
		jmp next_word_dict_c
		
		next_word_dict_found_c:
		inc edx
		inc counter
		mov index,0
		jmp compare_values_c
		
		finish:
		ret
	compress_proc endp
	
	
	init_compress_proc_registers proc
		lea edi,output
		mov endPos,0
		mov eax,0
		mov ecx,0
		ret
	init_compress_proc_registers endp
	
	init_registers_c_proc proc
		lea esi,text2
		mov edx,0
		mov edx,endPos
		lea esi,[esi+edx]
		mov okWord,0
		ret
	init_registers_c_proc endp
	
	
end start 
