extends PanelContainer

signal signal_transaction(type, parameter, peristiwa_path, harga)

# Parameter:
# bangunan : "building_name"
# harga_order : int
# max_time : float
# aksesoris : image_path
# renovasi : "building_name"

enum BARANG_PASAR {bangunan, harga_order, max_time, aksesoris, renovasi}
export(int) var harga
export(int) var syarat_kota
export(BARANG_PASAR) var tipe_barang
export(String) var parameter
export(String, FILE, "*.gd") var peristiwa_path
export(String) var penghargaan

func _ready():
	if tipe_barang == BARANG_PASAR.bangunan:
		$HBoxContainer/PanelBeli/Button/Label.text = "BANGUN:\nRp"+String(harga) +" jt"
	elif tipe_barang == BARANG_PASAR.renovasi:
		$HBoxContainer/PanelBeli/Button/Label.text = "BANTU:\nRp"+String(harga) +" jt"
	else:
		$HBoxContainer/PanelBeli/Button/Label.text = "BELI:\nRp"+String(harga) +" jt"
	$HBoxContainer/PanelSyarat/LabelSyaratKonten.text = "Kota : "+String(syarat_kota)
	$HBoxContainer/PanelBeli/Button.connect("pressed",self,"transaction")
	
func check_buyable():
	$HBoxContainer/PanelBeli/Button/Label.modulate = Color(1,1,1,0.5)
	$HBoxContainer/PanelBeli/Button.disabled = true
	if Global.kota >= syarat_kota:
		if Global.harta >= harga:
			$HBoxContainer/PanelBeli/Button/Label.modulate = Color.white
			$HBoxContainer/PanelBeli/Button.disabled = false
			
func transaction():
	emit_signal("signal_transaction", BARANG_PASAR.keys()[tipe_barang], parameter, peristiwa_path, harga)
	$HBoxContainer/PanelBeli/Button.visible = false
	Global.penghargaan.append(penghargaan)
