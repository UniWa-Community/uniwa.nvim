; TODO: auto generate screenshots for each variant
; manually build and install (wezterm too)
; also split appropriately like so:
;
;  +-------+--------+
;  |       |        |
;  |       | htop   |
;  |       |        |
;  |  vim  +--------+
;  |       |        |
;  |       | colors |
;  |       |        |
;  +----------------+
;
; script now does for each <variant>:
; themr <variant>
; wait 500ms
; vim ~/fisr.c
; wait 500ms
; Alt+l
; htop
; wait 100ms
; Alt+j
; ~/repos/color-scripts/color-scripts/bloks
; Alt+h
; wait 100ms
; screenshot window
; wait 1000ms
; repeat



