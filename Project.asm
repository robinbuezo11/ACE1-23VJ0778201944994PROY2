NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
CUBIERTO	equ      06  ;Caja sobre objetivo
.MODEL SMALL
.RADIX 16
.STACK
.DATA

; Header
usac            db  "Universidad de San Carlos de Guatemala", "$"
facul           db  "Facultad de Ingenieria", "$"
school          db  "Escuela de Vacaciones", "$"
course          db  "Arquitectura de Computadores y E. 1", "$"
student         db  "Robin Omar Buezo Diaz", "$"
carne 		 	db  "201944994", "$"

dim_sprite_jug    db   08, 08
data_sprite_jug   db   5c, 02, 02, 02, 02, 5c, 5c, 08
                  db   5c, 5c, 02, 02, 02, 02, 5c, 08
                  db   5c, 5c, 0e, 00, 5a, 00, 5c, 08
                  db   5c, 5c, 5a, 5a, 40, 5a, 5c, 08
                  db   5a, 02, 02, 02, 02, 02, 02, 5a
                  db   5c, 5c, 02, 02, 02, 02, 5c, 01
                  db   5c, 5c, 04, 04, 04, 04, 5c, 5c
                  db   5c, 5c, 06, 5c, 5c, 06, 5c, 5c
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 37, 00, 00, 00, 00, 00
                    db   00, 00, 37, 37, 00, 00, 00, 00
                    db   37, 37, 37, 37, 37, 00, 00, 00
                    db   37, 37, 37, 37, 37, 37, 00, 00
                    db   37, 37, 37, 37, 37, 37, 00, 00
                    db   37, 37, 37, 37, 37, 00, 00, 00
                    db   00, 00, 37, 37, 00, 00, 00, 00
                    db   00, 00, 37, 00, 00, 00, 00, 00
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
                  db   5c, 5c, 5c, 5c, 5c, 5c, 5c, 5c
dim_sprite_pared  db   08, 08
data_sprite_pared db   1e, 1e, 1e, 1e, 1b, 1b, 1b, 1b
                  db   1e, 1e, 1e, 1e, 1b, 1b, 1b, 1b
                  db   1e, 1e, 1e, 1e, 1b, 1b, 1b, 1b
                  db   1e, 1e, 1e, 1e, 1b, 1b, 1b, 1b
                  db   1b, 1b, 1b, 1b, 1e, 1e, 1e, 1e
                  db   1b, 1b, 1b, 1b, 1e, 1e, 1e, 1e
                  db   1b, 1b, 1b, 1b, 1e, 1e, 1e, 1e
                  db   1b, 1b, 1b, 1b, 1e, 1e, 1e, 1e
dim_sprite_obj    db   08, 08
data_sprite_obj   db  5c,5c,5c,5c,5c,5c,5c,5c
                  db  5c,5c,5c,5c,5c,5c,5c,5c
				  db  5c,5c,5c,40,40,5c,5c,5c
				  db  5c,5c,40,40,40,40,5c,5c
				  db  5c,5c,40,40,40,40,5c,5c
				  db  5c,5c,5c,40,40,5c,5c,5c
				  db  5c,5c,5c,5c,5c,5c,5c,5c
				  db  5c,5c,5c,5c,5c,5c,5c,5c
dim_sprite_caja   db   08, 08
data_sprite_caja  db  71,71,71,71,71,71,71,71
                  db  71,71,06,06,06,06,71,71
                  db  71,06,71,06,06,71,06,71
                  db  71,06,06,71,71,06,06,71
                  db  71,06,06,71,71,06,06,71
                  db  71,06,71,06,06,71,06,71
                  db  71,71,06,06,06,06,71,71
                  db  71,71,71,71,71,71,71,71
dim_sprite_cubierto  db 08, 08
data_sprite_cubierto db  29,29,29,29,29,29,29,29
                  	 db  29,29,04,04,04,04,29,29
					 db  29,04,29,04,04,29,04,29
					 db  29,04,04,29,29,04,04,29
					 db  29,04,04,29,29,04,04,29
					 db  29,04,29,04,04,29,04,29
					 db  29,29,04,04,04,04,29,29
					 db  29,29,29,29,29,29,29,29 
mapa              	db   3e8 dup (0)
sobre_objetivo		db   00
sobre_obj_tmp		db   00
mover_cubierto		db   00
es_nivel_cargado 	db   00
iniciar_juego db "INICIAR JUEGO$"
cargar_nivel  db "CARGAR NIVEL$"
configuracion db "CONFIGURACION$"
puntajes      db "PUNTAJES ALTOS$"
salir         db "SALIR$"
iniciales     db "ROBD - 201944994$"

continuar_juego db "CONTINUAR JUEGO$"
salir_juego	 	db "SALIR AL MENU$"
;; JUEGO
xJugador      db 0
yJugador      db 0
puntos        dw 0
puntos_tmp    dw 1
nivel         db 01
seconds	      db 00
minutes	      db 00
hours 	   	  db 00
seconds_tmp	  db 00
time 		  db "00:00:00","$"
objetivos     db 0
cubiertos	  db 0
;; MENÚS
opcion        db 0
maximo        db 0
xFlecha       dw 0
yFlecha       dw 0
;; CONTROLES
control_arriba    db  48
control_abajo     db  50
control_izquierda db  4b
control_derecha   db  4d
;; NIVELES
nivel_actual      db  06 dup (0),00
nivel_1 		  db  "NIV.00",00
nivel_2 		  db  "NIV.01",00
nivel_3 		  db  "NIV.10",00
handle_nivel      dw  0000
linea             db  100 dup (0)
elemento_actual   db  0
xElemento         db  0
yElemento         db  0
;; TOKENS
tk_pared      db  05,"pared"
tk_suelo      db  05,"suelo"
tk_jugador    db  07,"jugador"
tk_caja       db  04,"caja"
tk_objetivo   db  08,"objetivo"
tk_coma       db  01,","
;;
numero        db  5 dup (30), "$"
.CODE
.STARTUP
jmp inicio

;---------------------------- MACROS -----------------------------------
; print - print string with delimiter $
print macro string
    mov DX, offset string
    mov AH, 09
    int 21
endm

inicio:
		;; MODO VIDEO 
		mov AH, 00
		mov AL, 13
		int 10

		;; MENSAJE INICIAL

		call mensaje_inicial			;ESTO LLAMA AL MENSAJE INICIAL

		;; MENU PRINCIPAL
ir_al_menu_principal:
		mov [es_nivel_cargado], 00
		call menu_principal
		mov AL, [opcion]
		;; > INICIAR JUEGO
		cmp AL, 0
		je juego
		;; > CARGAR NIVEL
		cmp AL, 1
		je cargar_un_nivel
		;; > CONFIGURACION
		cmp AL, 2
		je menu_configuracion
		;; > PUNTAJES ALTOS
		;; > SALIR
		cmp AL, 4
		je fin
		;;;;;;;;;;;;;;;;
juego:
		call set_current_time
		mov [puntos], 0
		mov [puntos_tmp], 1
		mov [nivel], 1
		push AX
		push CX
		push DI
		mov DI, offset mapa
		mov CX, 3e8
		mov AL, 00
		call memset
		pop DI
		pop CX
		pop AX
corroborar_nivel:
		push SI
		push DI
		push CX
		cmp [nivel], 01
		je cargar_nivel_1
		cmp [nivel], 02
		je cargar_nivel_2
		cmp [nivel], 03
		je cargar_nivel_3
cargar_nivel_1:
		mov SI, offset nivel_1
		mov DI, offset nivel_actual
		mov CX, 6
		call copy_string
		jmp inicio_juego
cargar_nivel_2:
		mov SI, offset nivel_2
		mov DI, offset nivel_actual
		mov CX, 6
		call copy_string
		jmp inicio_juego
cargar_nivel_3:
		mov SI, offset nivel_3
		mov DI, offset nivel_actual
		mov CX, 6
		call copy_string
		jmp inicio_juego
inicio_juego:
		pop CX
		pop DI
		pop SI
		call cargar_un_nivel
		;;;;;;;;;;;;;;;;
ciclo_juego:
		call calculate_time
		call pintar_mapa
		call entrada_juego
		cmp AH, 4c				
		je ir_a_menu_pausa		
		;; COMPROBAR SI SE COMPLETÓ EL NIVEL
		mov AL, [cubiertos]
		cmp [objetivos], AL
		je nivel_completado
		jmp ciclo_juego
		;;;;;;;;;;;;;;;;
ir_a_menu_pausa:
		call menu_pausa
		mov AL, [opcion]
		;; > CONTINUAR JUEGO
		cmp AL, 0
		je ciclo_juego
		;; > SALIR AL MENU
		cmp AL, 1
		je ir_al_menu_principal
		;;;;;;;;;;;;;;;;
nivel_completado:
		push AX
		push CX
		push DI
		mov DI, offset mapa
		mov CX, 3e8
		mov AL, 00
		call memset
		pop DI
		pop CX
		pop AX
		inc [nivel]
		cmp [es_nivel_cargado], 01
		je ir_al_menu_principal
		jmp corroborar_nivel
		;;;;;;;;;;;;;;;;

cargar_un_nivel: ; ------------------------------------- CARGAR UN NIVEL
		; Input: nivel_actual
		mov [objetivos], 0
		mov [cubiertos], 0
		mov AL, 00
		mov DX, offset nivel_actual
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		;;
ciclo_lineas:
		mov BX, [handle_nivel]
		call siguiente_linea
		cmp DL, 0ff      ;; fin-del-archivo?
		je ver_si_hay_algo_en_linea
		cmp DH, 00      ;; línea-con-algo?
		je ciclo_lineas
		jmp logica_parseo
ver_si_hay_algo_en_linea:
		cmp DH, 00	  ;; línea-vacía
		je fin_parseo
		;;;;;;;;;;;;;;;;;;;;;;;
		;; lógica del parseo ;;
		;;;;;;;;;;;;;;;;;;;;;;;
		;; ignorar espacios o retornos de carro
logica_parseo:
		mov DI, offset linea
		push DI
		;; verificar retorno de carro
		mov AL, [DI]
		cmp AL, 20
		je ignorar0
		cmp AL, 0d
		je ignorar0
		jmp iniciar_parseo
ignorar0:
		call ignorar_espacios
		;;
		;; al principio del buffer de la línea está: pared, caja, jugador, suelo, objetivo
iniciar_parseo:
		mov SI, offset tk_pared
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_pared
		pop DI
		push DI
		mov SI, offset tk_caja
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_caja
		pop DI
		push DI
		mov SI, offset tk_suelo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_suelo
		pop DI
		push DI
		mov SI, offset tk_objetivo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_objetivo
		pop DI
		push DI
		mov SI, offset tk_jugador
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_jugador
		pop DI
		jmp ciclo_lineas
es_pared:
		mov AL, PARED
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_caja:
		mov AL, CAJA
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_suelo:
		mov AL, SUELO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_objetivo:
		mov AL, OBJETIVO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_jugador:
		mov AL, JUGADOR
		mov [elemento_actual], AL
		jmp continuar_parseo0
		;; ignorar espacios
continuar_parseo0:
		pop SI         ; ignorara valor inicial de DI
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [xElemento], AL
		pop DI
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		je continuar_parseo1
		cmp AL, ','
		je continuar_parseo2
		jmp ciclo_lineas
continuar_parseo1:
		;; ignorar espacios
		call ignorar_espacios
continuar_parseo2:
		;; obtener una coma
		mov SI, offset tk_coma
		call cadena_igual
		cmp DL, 0ff
		jne ciclo_lineas
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		mov AL, [elemento_actual]
		cmp AL, JUGADOR
		jne seguir_normal_debug
seguir_normal_debug:
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [yElemento], AL
		pop DI
		;; ignorar_espacios
		mov AL, [DI]
		cmp AL, 20
		je ignorar1
		cmp AL, 0d
		je ignorar1
		jmp ver_final_de_linea
ignorar1:
		call ignorar_espacios
		;; ver si es el final de la cadena
ver_final_de_linea:
		mov AL, [DI]
		cmp AL, 00
		jne ciclo_lineas
		;; usar la información
		;;
		mov DL, [elemento_actual]
		mov AH, [xElemento]
		mov AL, [yElemento]
		call colocar_en_mapa
		mov AL, JUGADOR
		cmp AL, [elemento_actual]
		je guardar_coordenadas_jugador
		mov AL, OBJETIVO
		cmp AL, [elemento_actual]
		je contar_objetivo
		jmp ciclo_lineas
contar_objetivo:
		inc [objetivos]
		jmp ciclo_lineas
guardar_coordenadas_jugador:
		mov AH, [xElemento]
		mov AL, [yElemento]
		mov [xJugador], AH
		mov [yJugador], AL
		jmp ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
fin_parseo:
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_nivel]
		int 21
		;;
		jmp ciclo_juego

menu_configuracion:
		jmp ir_al_menu_principal

;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; 	posicionarse en X
		mov SI, AX
		;;  posicionarse en Y
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;; pintar
		mov [DI], CL  
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI		  ;; dirección de tam vertical
		mov DH, [SI]  
		dec SI        ;; dirección de tam horizontal

inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 0200
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret

;; delay - subrutina de retardo
delay_msg:
		push SI
		push DI
		mov SI, 0900
cicloC:
		mov DI, 0900
		dec SI
		cmp SI, 0000
		je fin_delay_msg
cicloD:
		dec DI
		cmp DI, 0000
		je cicloC
		jmp cicloD
fin_delay_msg:
		pop DI
		pop SI
		ret


		

;; clear_pantalla - limpia la pantalla
;; ..
;; ..
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret


;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 5
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0c ;; <<-- posicionar el cursor
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10

		push DX
		mov DX, offset iniciar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset cargar_nivel
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; PUNTAJES ALTOS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset puntajes
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CONFIGURACION
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset configuracion
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_principal
		cmp AH, 50
		je sumar_opcion_menu_principal
		cmp AH, 3b  ;; Tecla F1
		je fin_menu_principal
		jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
		;;
fin_menu_principal:
		ret

;; menu_pausa - menu pausa
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_pausa:
		call clear_pantalla
		call time_pause
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 2
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; CONTINUAR JUEGO
		mov DL, 0c ;; <<-- posicionar el cursor
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10

		push DX
		mov DX, offset continuar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR AL MENÚ PRINCIPAL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir_juego
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_pausa:
		call time_pause
		mov AH, 01
		int 16
		jz entrada_menu_pausa
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_pausa
		cmp AH, 50
		je sumar_opcion_menu_pausa
		cmp AH, 3b  ;; Tecla F1
		je fin_menu_pausa
		jmp entrada_menu_pausa
restar_opcion_menu_pausa:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_menu_pausa
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
sumar_opcion_menu_pausa:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo_menu_pausa
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
volver_a_cero_menu_pausa:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
volver_a_maximo_menu_pausa:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_pausa
mover_flecha_menu_pausa:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_pausa:
		cmp CL, 0
		je pintar_flecha_menu_pausa
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_pausa
pintar_flecha_menu_pausa:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_pausa
		;;
fin_menu_pausa:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 01   ;; fila
		;;
ciclo_v:
		cmp AL, 18
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
                cmp DL, NADA
		je pintar_vacio_mapa
		;;
                cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
                cmp DL, PARED
		je pintar_pared_mapa
		;;
                cmp DL, CAJA
		je pintar_caja_mapa
		;;
                cmp DL, OBJETIVO
		je pintar_objetivo_mapa
		;;
                cmp DL, SUELO
		je pintar_suelo_mapa
		;;
		        cmp DL, CUBIERTO
		je pintar_cubierto_mapa
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_suelo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_suelo
		mov DI, offset data_sprite_suelo
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_pared_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_pared
		mov DI, offset data_sprite_pared
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_caja_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_caja
		mov DI, offset data_sprite_caja
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_cubierto_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_cubierto
		mov DI, offset data_sprite_cubierto
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
		push AX
		push BX
		push DX
		;; PINTAR LAS INICIALES
		mov DH, 18
		mov DL, 00
		mov BH, 00
		mov AH, 02
		int 10
		print iniciales
		;; PINTAR TIEMPO
		mov DH, 18
		mov DL, 1f
		mov BH, 00
		mov AH, 02
		int 10
		print time
		;; PINTAR PUNTAJES
		mov AX, [puntos_tmp]
		cmp AX, [puntos]
		je return_pintar_mapa
		mov AX, [puntos]
		call num_to_string
		mov DH, 00
		mov DL, 23
		mov BH, 00
		mov AH, 02
		int 10
		print numero
		mov [puntos_tmp], AX
return_pintar_mapa:
		pop DX
		pop BX
		pop AX
		ret


;; entrada_juego - manejo de las entradas del juego
entrada_juego:
		mov AH, 01
		int 16
		jz fin_entrada_juego  ;; nada en el buffer de entrada
		mov AH, 00
		int 16
		;; AH <- scan code
		cmp AH, [control_arriba]
		je mover_jugador_arr
		cmp AH, [control_abajo]
		je mover_jugador_aba
		cmp AH, [control_izquierda]
		je mover_jugador_izq
		cmp AH, [control_derecha]
		je mover_jugador_der
		cmp AH, 3c
		je pausa
		ret
mover_jugador_arr:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, CUBIERTO
		je hay_cubierto_arriba
		cmp DL, PARED
		je hay_pared_arriba
		cmp DL, CAJA
		je hay_caja_arriba
		cmp DL, OBJETIVO
		jne no_obj_arriba
		mov [sobre_obj_tmp], 01
no_obj_arriba:
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_abajo
		jmp pintar_suelo_abajo
hay_pared_arriba:
		mov [sobre_obj_tmp], 00
		mov [mover_cubierto], 00
		ret
hay_cubierto_arriba:
		mov [mover_cubierto], 01
		mov [sobre_obj_tmp], 01
hay_caja_arriba:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AL
		dec AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_arriba
		cmp DL, CAJA
		je hay_pared_arriba
		cmp DL, OBJETIVO
		je hay_objetivo_arriba_caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
colocar_jugador_arriba:
		cmp [mover_cubierto], 01
		jne no_mover_cubierto_arriba
		dec [cubiertos]
no_mover_cubierto_arriba:
		mov [mover_cubierto], 00
		inc AL
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_abajo
		jmp pintar_suelo_abajo
hay_objetivo_arriba_caja:
		inc [cubiertos]
		mov DL, CUBIERTO
		push AX
		call colocar_en_mapa
		pop AX
		jmp colocar_jugador_arriba
pintar_suelo_abajo:
		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
pintar_objetivo_abajo:
		mov DL, OBJETIVO
		inc AL
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
mover_jugador_aba:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, CUBIERTO
		je hay_cubierto_abajo
		cmp DL, PARED
		je hay_pared_abajo
		cmp DL, CAJA
		je hay_caja_abajo
		cmp DL, OBJETIVO
		jne no_obj_abajo
		mov [sobre_obj_tmp], 01
no_obj_abajo:
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_arriba
		jmp pintar_suelo_arriba
hay_pared_abajo:
		mov [sobre_obj_tmp], 00
		mov [mover_cubierto], 00
		ret
hay_cubierto_abajo:
		mov [mover_cubierto], 01
		mov [sobre_obj_tmp], 01
hay_caja_abajo:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AL
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_abajo
		cmp DL, CAJA
		je hay_pared_abajo
		cmp DL, OBJETIVO
		je hay_objetivo_abajo_caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
colocar_jugador_abajo:
		cmp [mover_cubierto], 01
		jne no_mover_cubierto_abajo
		dec [cubiertos]
no_mover_cubierto_abajo:
		mov [mover_cubierto], 00
		dec AL
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_arriba
		jmp pintar_suelo_arriba
hay_objetivo_abajo_caja:
		inc [cubiertos]
		mov DL, CUBIERTO
		push AX
		call colocar_en_mapa
		pop AX
		jmp colocar_jugador_abajo
pintar_suelo_arriba:
		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
pintar_objetivo_arriba:
		mov DL, OBJETIVO
		dec AL
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
mover_jugador_izq:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, CUBIERTO
		je hay_cubierto_izquierda
		cmp DL, PARED
		je hay_pared_izquierda
		cmp DL, CAJA
		je hay_caja_izquierda
		cmp DL, OBJETIVO
		jne no_obj_izq
		mov [sobre_obj_tmp], 01
no_obj_izq:
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_derecha
		jmp pintar_suelo_derecha
hay_pared_izquierda:
		mov [sobre_obj_tmp], 00
		mov [mover_cubierto], 00
		ret
hay_cubierto_izquierda:
		mov [mover_cubierto], 01
		mov [sobre_obj_tmp], 01
hay_caja_izquierda:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AH
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_izquierda
		cmp DL, CAJA
		je hay_pared_izquierda
		cmp DL, OBJETIVO
		je hay_objetivo_izq_caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
colocar_jugador_izquierda:
		cmp [mover_cubierto], 01
		jne no_mover_cubierto_izquierda
		dec [cubiertos]
no_mover_cubierto_izquierda:
		mov [mover_cubierto], 00
		inc AH
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_derecha
		jmp pintar_suelo_derecha
hay_objetivo_izq_caja:
		inc [cubiertos]
		mov DL, CUBIERTO
		push AX
		call colocar_en_mapa
		pop AX
		jmp colocar_jugador_izquierda
pintar_suelo_derecha:
		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
pintar_objetivo_derecha:
		mov DL, OBJETIVO
		inc AH
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
mover_jugador_der:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, CUBIERTO
		je hay_cubierto_derecha
		cmp DL, PARED
		je hay_pared_derecha
		cmp DL, CAJA
		je hay_caja_derecha
		cmp DL, OBJETIVO
		jne no_obj_der
		mov [sobre_obj_tmp], 01
no_obj_der:
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_izquierda
		jmp pintar_suelo_izquierda
hay_pared_derecha:
		mov [sobre_obj_tmp], 00
		mov [mover_cubierto], 00
		ret
hay_cubierto_derecha:
		mov [mover_cubierto], 01
		mov [sobre_obj_tmp], 01
hay_caja_derecha:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AH
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_derecha
		cmp DL, CAJA
		je hay_pared_derecha
		cmp DL, OBJETIVO
		je hay_objetivo_der_caja
		mov DL, CAJA
		push AX
		call colocar_en_mapa
		pop AX
		;;
colocar_jugador_derecha:
		cmp [mover_cubierto], 01
		jne no_mover_cubierto_derecha
		dec [cubiertos]
no_mover_cubierto_derecha:
		mov [mover_cubierto], 00
		dec AH
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		cmp [sobre_objetivo], 01
		je pintar_objetivo_izquierda
		jmp pintar_suelo_izquierda
hay_objetivo_der_caja:
		inc [cubiertos]
		mov DL, CUBIERTO
		push AX
		call colocar_en_mapa
		pop AX
		jmp colocar_jugador_derecha
pintar_suelo_izquierda:
		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
pintar_objetivo_izquierda:
		mov DL, OBJETIVO
		dec AH
		call colocar_en_mapa
		;;
		push AX
		mov AL, [sobre_obj_tmp]
		mov [sobre_objetivo], AL
		pop AX
		mov [sobre_obj_tmp], 00
		cmp [sobre_objetivo], 01
		je hay_objetivo
		jmp no_hay_objetivo
fin_entrada_juego:
		ret
pausa:							
		call clear_pantalla
		mov AH, 4c
		ret
hay_objetivo:
		push AX
		mov AL, 01
		mov [sobre_objetivo], AL
		mov AX, [puntos]
		inc AX
		mov [puntos], AX
		pop AX
		ret
no_hay_objetivo:
		push AX
		mov AL, 00
		mov [sobre_objetivo], AL
		mov AX, [puntos]
		inc AX
		mov [puntos], AX
		pop AX
		ret


;; siguiente_linea - extrae la siguiente línea del archivo referenciado por el handle en BX
;; ENTRADA:
;;    - BX: handle
;; SALIDA:
;;    - [linea]: contenido de la línea que se extrajo, finalizada en 00 (nul0)
;;    - DL: si el archivo llegó a su fin
;;    - DH: la cantidad de caracteres en la línea
siguiente_linea:
		mov SI, 0000
		mov DI, offset linea
		;;
ciclo_sig_linea:
		mov AH, 3f
		mov CX, 0001
		mov DX, DI
		int 21
		cmp AX, 0000
		je fin_siguiente_linea
		mov AL, [DI]
		cmp AL, 0a
		je quitar_nl_y_fin
		inc SI
		inc DI
		jmp ciclo_sig_linea
quitar_nl_y_fin:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 00    ;; no ha finalizado el archivo
		ret
fin_siguiente_linea:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 0ff   ;; ya finalizó el archivo
		ret


;; cadena_igual - verifica que dos cadenas sean iguales
;; ENTRADA:
;;    - SI: cadena 1, con su tamaño en el primer byte
;;    - DI: cadena 2
;; SALIDA:
;;    - DL: 0ff si son iguales, 00 si no lo son
cadena_igual:
		mov CH, 00
		mov CL, [SI]
		inc SI
ciclo_cadena_igual:
		mov AL, [SI]
		cmp AL, [DI]
		jne fin_cadena_igual
		inc SI
		inc DI
		loop ciclo_cadena_igual
cadenas_son_iguales:
		mov DL, 0ff
		ret
fin_cadena_igual:
		mov DL, 00
		ret


;; ignorar_espacios - ignora una sucesión de espacios
;; ENTRADA:
;;    - DI: offset de una cadena cuyo primer byte se supone es un espacio
;; ...
ignorar_espacios:
ciclo_ignorar:
		mov AL, [DI]
		cmp AL, 20
		je ignorar_caracter
		cmp AL, 0d
		je ignorar_caracter
		jmp fin_ignorar
ignorar_caracter:
		inc DI
		jmp ciclo_ignorar
fin_ignorar:
		ret


;; memset - memset
;; ENTRADA:
;;    - DI: offset del inicio de la cadena de bytes
;;    - CX: cantidad de bytes
;;    - AL: valor que se pondrá en cada byte
memset:
		push DI
ciclo_memset:
		mov [DI], AL
		inc DI
		loop ciclo_memset
		pop DI
		ret


;; leer_cadena_numerica - lee una cadena que debería estar compuesta solo de números
;; ENTRADA:
;;    - DI: offset del inicio de la cadena numérica
;; SALIDA:
;;    - [numero]: el contenido de la cadena numérica
leer_cadena_numerica:
		mov SI, DI
		;;
		mov DI, offset numero
		mov CX, 0005
		mov AL, 30
		call memset
		;;
		mov DI, SI
		mov CX, 0000
ciclo_ubicar_ultimo:
		mov AL, [DI]
		cmp AL, 30
		jb copiar_cadena_numerica
		cmp AL, 39
		ja copiar_cadena_numerica
		inc DI
		inc CX
		jmp ciclo_ubicar_ultimo
copiar_cadena_numerica:
		push DI   ;;   <----
		dec DI
		;;
		mov SI, offset numero
		add SI, 0004
ciclo_copiar_num:
		mov AL, [DI]
		mov [SI], AL
		dec DI
		dec SI
		loop ciclo_copiar_num
		pop DI
		ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

num_to_string: ;------------------------------------Start of int_to_string
        ; Convert int to string
        ; Input: AX = int
        ; Output: [numero] = string
        cmp AX, 0000
        je end_num_zero
        mov CX, 0005
        mov DI, offset numero
cycle_set30:
        mov BL, 30
        mov [DI], BL
        inc DI
        loop cycle_set30
        
        mov CX, AX
        mov DI, offset numero
        add DI, 04
cycle_num_to_string:
        mov BL, [DI]
        inc BL
        mov [DI], BL
        cmp BL, 3a
        je increase_next
        loop cycle_num_to_string
        jmp end_num_to_string
increase_next:
        push DI
increase_next_cycle:
        mov BL, 30
        mov [DI], BL
        dec DI
        mov BL, [DI]
        inc BL
        mov [DI], BL
        cmp BL, 3a
        je increase_next_cycle
        pop DI
        loop cycle_num_to_string
end_num_to_string:
        ret
end_num_zero:
        mov DI, offset numero
        mov CX, 0005
        mov AL, 30
        call memset
        ret
        ;------------------------------------End of int_to_string

mensaje_inicial:
		mov DH, 04 ;; <<-- posicionar el cursor
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		print usac
		;;
		mov DH, 07
		mov DL, 09
		mov BH, 00
		mov AH, 02
		int 10
		print facul
		;;
		mov DH, 0a
		mov DL, 0a
		mov BH, 00
		mov AH, 02
		int 10
		print school
		;;
		mov DH, 0d
		mov DL, 02
		mov BH, 00
		mov AH, 02
		int 10
		print course
		;;
		mov DH, 10
		mov DL, 0a
		mov BH, 00
		mov AH, 02
		int 10
		print student
		;;
		mov DH, 13
		mov DL, 10
		mov BH, 00
		mov AH, 02
		int 10
		print carne
		call delay_msg
		ret

copy_string: ;------------------------------------Start of copy_string
        ; Copy string
        ; Input: SI = Source string
        ;        DI = Destination string
        ;        CX = length max
        ; Output:DI = Source string
        mov AL, [SI]
        mov [DI], AL
        inc SI
        inc DI
        loop copy_string
        ret
        ;------------------------------------End of copy_string

set_current_time: ;-------------------------------- Start of set current time
		push AX
		push CX
		push DX
		mov AH, 2c
		int 21
		mov [hours], CH
		mov [minutes], CL
		mov [seconds], DH
		pop DX
		pop CX
		pop AX
		ret

calculate_time: ;-------------------------------- Start of calculate time
		push AX
		push CX
		push DX
		push DI
		push SI
		mov AH, 2c
		int 21
		mov AX, 0000
		mov [seconds_tmp], DH

		cmp [seconds], DH
		je set_seconds
		cmp [seconds], DH
		jb set_seconds
		add DH, 3c
		sub CL, 01
set_seconds:
		sub DH, [seconds]
		push CX
		mov AH, 00
		mov AL, DH
		call num_to_string
		mov SI, offset numero
		add SI, 03
		mov DI, offset time
		add DI, 06
		mov CX, 0002
		call copy_string
		pop CX

		cmp [minutes], CL
		je set_minutes
		cmp [minutes], CL
		jb set_minutes
		add CL, 3c
		sub CH, 01
set_minutes:
		sub CL, [minutes]
		push CX
		mov AL, CL
		call num_to_string
		mov SI, offset numero
		add SI, 03
		mov DI, offset time
		add DI, 03
		mov CX, 0002
		call copy_string
		pop CX

		sub CH, [hours]
		push CX
		mov AL, CH
		call num_to_string
		mov SI, offset numero
		add SI, 03
		mov DI, offset time
		mov CX, 0002
		call copy_string
		pop CX

		pop SI
		pop DI
		pop DX
		pop CX
		pop AX
		ret

time_pause: ;-------------------------------- Start of time pause
		push AX
		push CX
		push DX
		mov AH, 2c
		int 21
		cmp [seconds_tmp], DH
		je end_time_pause

		cmp [seconds], 3b
		jne set_seconds_pause
		mov [seconds], 00
		cmp [minutes], 3b
		jne set_minutes_pause
		mov [minutes], 00
		inc [hours]
		mov [seconds_tmp], DH
		jmp end_time_pause
set_seconds_pause:
		inc [seconds]
		mov [seconds_tmp], DH
		jmp end_time_pause
set_minutes_pause:
		inc [minutes]
		mov [seconds_tmp], DH
		jmp end_time_pause
end_time_pause:
		pop DX
		pop CX
		pop AX
		ret

fin:
.EXIT
END
