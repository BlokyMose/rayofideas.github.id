extends Button

signal signal_atur_showed
signal signal_atur_hidden

var endgame_scene_path = load("res://Scenes/Endgame.tscn")

var sure_to_return_to_main_menu = false
onready var all_illustrations = $CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi.get_children()
onready var label_tut_judul = $CanvasLayer/PanelAtur/CaraMain/LabelJudul
onready var label_tut_desk = $CanvasLayer/PanelAtur/CaraMain/LabelDesk
onready var but_tut_next = $CanvasLayer/PanelAtur/CaraMain/ButtonLanjut
onready var but_tut_back = $CanvasLayer/PanelAtur/CaraMain/ButtonSebelum

var current_tut_page = 1
var total_tut_page

var bgm_volume = 50

func _ready():
	
	$CanvasLayer/PanelAtur/CaraMain.visible = false
	$CanvasLayer/PanelAtur.visible = false
	
	connect("pressed",self,"show_atur")
	$CanvasLayer/PanelAtur/PanelAturMenu/ButtonExit.connect("pressed",self,"hide_atur")
	$CanvasLayer/PanelAtur/PanelAturMenu/ButtonUlang.connect("pressed",self,"return_to_main_menu")
	
	$CanvasLayer/PanelAtur/PanelAturMenu/ButtonCaraMain.connect("pressed",self,"show_tutorial_menu")
	$CanvasLayer/PanelAtur/CaraMain/ButtonExit.connect("pressed",self,"hide_tutorial_menu")
	
	$CanvasLayer/PanelAtur/PanelAturMenu/ButtonVolumeTambah.connect("pressed",self,"add_volume")
	$CanvasLayer/PanelAtur/PanelAturMenu/ButtonVolumeKurang.connect("pressed",self,"reduce_volume")
	
	
	but_tut_next.connect("pressed",self,"next_tutorial")
	but_tut_back.connect("pressed",self,"back_tutorial")
	
	total_tut_page = all_illustrations.size()

func add_volume():
	if owner.has_method("add_bgm_volume"):
		if bgm_volume < 100:
			owner.add_bgm_volume()
			bgm_volume += 10
			$CanvasLayer/PanelAtur/PanelAturMenu/LabelVolumeMusik.text = "Volume Musik : "+String(bgm_volume)
			
func reduce_volume():
	if owner.has_method("reduce_bgm_volume"):
		if bgm_volume > 0:
			owner.reduce_bgm_volume()
			bgm_volume -= 10
			$CanvasLayer/PanelAtur/PanelAturMenu/LabelVolumeMusik.text = "Volume Musik : "+ String(bgm_volume)

func hide_atur():
	$CanvasLayer/PanelAtur.visible = false
	emit_signal("signal_atur_hidden")
	
func show_atur():
	$CanvasLayer/PanelAtur.visible = true
	$CanvasLayer/PanelAtur/PanelAturMenu/ButtonUlang.text = "MENYERAH aja"
	sure_to_return_to_main_menu = false
	emit_signal("signal_atur_showed")
	
func return_to_main_menu():
	if sure_to_return_to_main_menu == false:
		$CanvasLayer/PanelAtur/PanelAturMenu/ButtonUlang.text = "Yakin? Klik Lagi"
		sure_to_return_to_main_menu = true
	else:
		get_tree().change_scene_to(endgame_scene_path)

func show_tutorial_menu():
	$CanvasLayer/PanelAtur/CaraMain.visible = true
	current_tut_page = 1
	open_tutorial_page()
	but_tut_back.disabled = true
	$CanvasLayer/PanelAtur/PanelAturMenu.visible = false
	
func hide_tutorial_menu():
	$CanvasLayer/PanelAtur/CaraMain.visible = false
	$CanvasLayer/PanelAtur/PanelAturMenu.visible = true
	$CanvasLayer/PanelAtur/AnimationPlayer.stop()

func next_tutorial():
	current_tut_page += 1
	but_tut_back.disabled = false
	if current_tut_page == total_tut_page : but_tut_next.disabled = true
	open_tutorial_page()
	but_tut_next.release_focus()

func back_tutorial():
	current_tut_page -= 1
	but_tut_next.disabled = false
	if current_tut_page == 1 : but_tut_back.disabled = true
	open_tutorial_page()
	but_tut_back.release_focus()

func open_tutorial_page():
	if current_tut_page == 1: tutorial_orderan()
	elif current_tut_page == 2: tutorial_pajak()
	elif current_tut_page == 3: tutorial_pasar()
	elif current_tut_page == 4: tutorial_target()
	elif current_tut_page == 5: tutorial_lainnya()
	$CanvasLayer/PanelAtur/CaraMain/LabelHalaman.text = String(current_tut_page)+"/"+String(total_tut_page)
	
func tutorial_orderan():
	for illust in all_illustrations:
		illust.visible = false
	$CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelOrderan.visible = true
	label_tut_judul.text = "Orderan Martabak"
	label_tut_desk.text = "Klik bangunan dengan ikon martabak untuk mendapatkan uang"
	$CanvasLayer/PanelAtur/AnimationPlayer.play("anim_orderan_martabak")
	
func tutorial_pajak():
	for illust in all_illustrations:
		illust.visible = false
	$CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelPajak.visible = true
	label_tut_judul.text = "Pajak Bulanan"
	label_tut_desk.text = "Klik Bayar Pajak setiap bulan atau bisa kena denda"
	$CanvasLayer/PanelAtur/AnimationPlayer.play("anim_bayar_pajak")
	
	
func tutorial_pasar():
	for illust in all_illustrations:
		illust.visible = false
	$CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelPasar.visible = true
	label_tut_judul.text = "Pasar"
	label_tut_desk.text = "Beli barang dan bangun bangunan lewat menu Pasar. \n\nMajukan kota Maju Mundur dengan menggunakan uang Anda dengan bijak."
	
func tutorial_target():
	for illust in all_illustrations:
		illust.visible = false
	$CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelTarget.visible = true
	label_tut_judul.text = "Target"
	label_tut_desk.text = "Selesaikan game ini dengan memenuhi semua target."
	
func tutorial_lainnya():
	for illust in all_illustrations:
		illust.visible = false
	$CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelLainnya.visible = true
	label_tut_judul.text = "Lainnya"
	label_tut_desk.text = "Pembayaran pajak berefek ke Kartu Peristiwa dan Dialog pada akhir tahun.\n\nJadi ingat, bayar pajak."
	
	
	
