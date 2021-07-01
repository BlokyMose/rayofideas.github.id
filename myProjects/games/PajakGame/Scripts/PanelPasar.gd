extends Panel

signal signal_pasar_showed
signal signal_pasar_hidden


signal signal_add_building(building_name)
signal signal_upgrade_harga_martabak(order_price)
signal signal_upgrade_max_time(maxTIme)
signal signal_add_peristiwa(path)
signal signal_change_accessory(image_path)
signal signal_upgrade_building(building_name)
signal signal_bought(harga)

enum BARANG_PASAR {bangunan, harga_order, max_time, aksesoris, renovasi}

onready var barang_barang = $CanvasLayer/PanelPasarMenu/NinePatchRect/ScrollContainer/VBoxContainer.get_children()

func _ready():
	$ButtonPasar.connect("pressed",self,"show_pasar")
	$CanvasLayer/PanelPasarMenu/NinePatchRect/ButtonExit.connect("pressed",self,"hide_pasar")
	$CanvasLayer/PanelPasarMenu.visible = false
	
	for barang in barang_barang:
		barang.connect("signal_transaction", self, "process_transaction")
	
	$CanvasLayer/PanelPasarMenu/FilterButtons/VBoxContainer/ButtonSemua.connect("pressed",self,"filter_all")
	$CanvasLayer/PanelPasarMenu/FilterButtons/VBoxContainer/ButtonBaju.connect("pressed",self,"filter_baju")
	$CanvasLayer/PanelPasarMenu/FilterButtons/VBoxContainer/ButtonMartabak.connect("pressed",self,"filter_martabak")
	$CanvasLayer/PanelPasarMenu/FilterButtons/VBoxContainer/ButtonBangun.connect("pressed",self,"filter_bangun")
	$CanvasLayer/PanelPasarMenu/FilterButtons/VBoxContainer/ButtonRenovasi.connect("pressed",self,"filter_renovasi")

func filter_all():
	for barang in barang_barang:
		barang.visible = true

func filter_baju():
	filter_all()
	for barang in barang_barang:
		if barang.tipe_barang != BARANG_PASAR.aksesoris:
			barang.visible = false

func filter_martabak():
	filter_all()
	for barang in barang_barang:
		if barang.tipe_barang ==  BARANG_PASAR.harga_order or barang.tipe_barang ==  BARANG_PASAR.max_time:
			barang.visible = true
		else :
			barang.visible = false
			

func filter_bangun():
	filter_all()
	for barang in barang_barang:
		if barang.tipe_barang !=  BARANG_PASAR.bangunan:
			barang.visible = false

func filter_renovasi():
	filter_all()
	for barang in barang_barang:
		if barang.tipe_barang !=  BARANG_PASAR.renovasi:
			barang.visible = false


func show_pasar():
	$CanvasLayer/PanelPasarMenu.visible = true
	release_focus()
	for barang in barang_barang:
		barang.check_buyable()
	
	filter_all()
	emit_signal("signal_pasar_showed")

func hide_pasar():
	$CanvasLayer/PanelPasarMenu.visible = false
	emit_signal("signal_pasar_hidden")

func process_transaction(type, parameter, peristiwa_path, harga):
	$AudioPlayer.play(0.1)
	# bangunan, harga_order, waktu_dine_in, aksesoris
	if type == "bangunan":
		emit_signal("signal_add_building", parameter)
	elif type == "harga_order":
		emit_signal("signal_upgrade_harga_martabak", int(parameter))
	elif type == "max_time":
		emit_signal("signal_upgrade_max_time", float(parameter))
	elif type == "aksesoris":
		emit_signal("signal_change_accessory", parameter)
	elif type == "renovasi":
		emit_signal("signal_upgrade_building", parameter)
	else:
		print("Error, this tipe_barang doesnt exist : ", type)
	
	emit_signal("signal_bought", harga)
	
	if peristiwa_path != "":
		emit_signal("signal_add_peristiwa", peristiwa_path)
	
	hide_pasar()
