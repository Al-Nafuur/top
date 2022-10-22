
PlusROM_API
   .byte "a", 0, "h.firmaplus.de", 0

SendPlusROMScore
   lda isMoving                    ; check for active game
   beq PlusROMScoreEnd

   lda BCDScore                    ; check for Score not 0
   bne .writeToHotspots
   lda BCDScore + 1
   bne .writeToHotspots
   lda BCDScore + 2
   bne .writeToHotspots
   jmp PlusROMScoreEnd

.writeToHotspots
   lda BCDScore + 2
   sta WriteToBuffer
   lda BCDScore + 1
   sta WriteToBuffer
   lda BCDScore
   sta WriteToBuffer
   lda #HIGHSCORE_ID                ; game id in Highscore DB
   sta WriteSendBuffer
PlusROMScoreEnd
   jmp ReturnFromSendPlusROMScore

