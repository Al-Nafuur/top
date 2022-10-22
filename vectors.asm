
 ;----------------
                org $FFFA
                
InterruptVectors

   IF PLUSROM

    .word (PlusROM_API - $E000)      ; PlusRom API pointer

   ELSE

    .word Reset           ; NMI

   ENDIF

    .word Reset           ; RESET
    .word Reset           ; IRQ

