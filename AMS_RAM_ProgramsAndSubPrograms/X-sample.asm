
;defw #0700+%111000 ; ALL channels ON
;defw 0,8,0,9,0,10  ; ALL volumes to ZERO


incbin"contenu_cartouche\sound\goldorakgo16-2.raw" ; generated DMA list


;defw #0700+%111111 ; channel OFF

defw #4020         ; END of DMA list


