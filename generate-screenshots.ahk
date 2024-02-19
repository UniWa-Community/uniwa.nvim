#SingleInstance
; TODO: auto generate screenshots for each variant
; manually build and install (wezterm too)
; also split appropriately like so:
;
;  +-------+--------+
;  |       |        |
;  |       |  htop  |
;  |       |        |
;  |  vim  +--------+
;  |       |        |
;  |       | colors |
;  |       |        |
;  +----------------+
;
F1::{
	; script now does for each <variant>:
	variants := ["dark", "light", "default", "paper"]
	for variant in variants {
		; themr <variant>
		if variant = "default" {
			Send " themr uniwa" . "`n"
		} else {
			Send " themr uniwa-" . variant . "`n"
		}
		Sleep 1500
		Send " vim ~/geepeetee.py `n"
		Sleep 1500
		; screenshot window
		Send "{PrintScreen}"
		Sleep 1500
		Send ":q{!}`n"
		Sleep 1500
		; repeat
	}
	Reload
}

F2::{
	Reload
}



