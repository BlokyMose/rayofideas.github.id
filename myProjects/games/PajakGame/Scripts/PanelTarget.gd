extends Panel

signal signal_target_showed
signal signal_target_hidden

var penghargaan_required = 3
var penghargaan_achieved = 0
var endgame_scene = load("res://Scenes/Endgame.tscn")

func _ready():
	$CanvasLayer/PanelTargetMenu.visible = false
	$ButtonTarget.connect("pressed",self,"show_target_menu")
	$CanvasLayer/PanelTargetMenu/NinePatchRect/ButtonExit.connect("pressed",self,"hide_target_menu")
	$CanvasLayer/PanelTargetMenu/NinePatchRect/ButtonSelesai.disabled = true
	$CanvasLayer/PanelTargetMenu/NinePatchRect/ButtonSelesai.connect("pressed",self,"game_over")
	
func show_target_menu():
	$CanvasLayer/PanelTargetMenu.visible = true
	check_penghargaan()
	emit_signal("signal_target_showed")

func hide_target_menu():
	$CanvasLayer/PanelTargetMenu.visible = false
	emit_signal("signal_target_hidden")

func check_penghargaan():
	var jumlah = 0
	
	# Hitung Kota Maju Saja
	for penghargaan in Global.penghargaan:
		if penghargaan == "kota maju saja":
			jumlah += 1
	if jumlah == 3:
		$CanvasLayer/PanelTargetMenu/NinePatchRect/ScrollContainer/VBoxContainer/KotaMaju/Lingkaran/Cek.visible = true
		penghargaan_achieved += 1
	jumlah = 0

	# Hitung Renovator
	for penghargaan in Global.penghargaan:
		if penghargaan == "renovator":
			jumlah += 1
	if jumlah == 6:
		$CanvasLayer/PanelTargetMenu/NinePatchRect/ScrollContainer/VBoxContainer/Renovator/Lingkaran/Cek.visible = true
		penghargaan_achieved += 1
	jumlah = 0

	# Hitung WP Teladan
	if Global.kota >= 1000:
		$CanvasLayer/PanelTargetMenu/NinePatchRect/ScrollContainer/VBoxContainer/WP/Lingkaran/Cek.visible = true
		penghargaan_achieved += 1
	
	if penghargaan_achieved >= penghargaan_required:
		$CanvasLayer/PanelTargetMenu/NinePatchRect/ButtonSelesai.disabled = false

func game_over():
	get_tree().change_scene_to(endgame_scene)
	print("GAME OVER")
