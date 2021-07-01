extends Control

export(PackedScene) var main_scene
onready var but_tut_next = $ButtonMain/CanvasLayer/PanelAtur/CaraMain/ButtonLanjut
onready var but_tut_back = $ButtonMain/CanvasLayer/PanelAtur/CaraMain/ButtonSebelum
var current_tut_page = 1
var total_tut_page
onready var all_illustrations = $ButtonMain/CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi.get_children()
onready var label_tut_judul = $ButtonMain/CanvasLayer/PanelAtur/CaraMain/LabelJudul
onready var label_tut_desk = $ButtonMain/CanvasLayer/PanelAtur/CaraMain/LabelDesk

var is_kredit = false
func _ready():
	$ButtonKredit.connect("pressed",self,"show_kredit")
	$ButtonMain.connect("pressed",self,"show_tut")
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/ButtonMainMain.connect("pressed",self,"play_game")
	$ButtonMain/CanvasLayer/PanelAtur.visible = false
	but_tut_next.connect("pressed",self,"next_tutorial")
	but_tut_back.connect("pressed",self,"back_tutorial")
	total_tut_page = all_illustrations.size()
	
func show_kredit():
	is_kredit = !is_kredit
	if is_kredit:
		$Kredit/AnimationPlayer.play("anim_show_kredit")
	else:
		$Kredit/AnimationPlayer.play_backwards("anim_show_kredit")
		

func show_tut():
	$ButtonMain/CanvasLayer/PanelAtur.visible = true
	open_tutorial_page()

func play_game():
	get_tree().change_scene_to(main_scene)

func next_tutorial():
	current_tut_page += 1
	but_tut_back.disabled = false
	if current_tut_page == total_tut_page : but_tut_next.disabled = true
	open_tutorial_page()
	but_tut_next.release_focus()
	
	if current_tut_page == total_tut_page:
		$ButtonMain/CanvasLayer/PanelAtur/CaraMain/ButtonMainMain.disabled = false

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
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/LabelHalaman.text = String(current_tut_page)+"/"+String(total_tut_page)
	
func tutorial_orderan():
	for illust in all_illustrations:
		illust.visible = false
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelOrderan.visible = true
	label_tut_judul.text = "Orderan Martabak"
	label_tut_desk.text = "Klik bangunan dengan ikon martabak untuk mendapatkan uang"
	$ButtonMain/CanvasLayer/PanelAtur/AnimationPlayer.play("anim_orderan_martabak")
	
func tutorial_pajak():
	for illust in all_illustrations:
		illust.visible = false
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelPajak.visible = true
	label_tut_judul.text = "Pajak Bulanan"
	label_tut_desk.text = "Klik Bayar Pajak setiap bulan atau bisa kena denda"
	$ButtonMain/CanvasLayer/PanelAtur/AnimationPlayer.play("anim_bayar_pajak")
	
	
func tutorial_pasar():
	for illust in all_illustrations:
		illust.visible = false
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelPasar.visible = true
	label_tut_judul.text = "Pasar"
	label_tut_desk.text = "Beli barang dan bangun bangunan lewat menu Pasar. \n\nMajukan kota Maju Mundur dengan menggunakan uang Anda dengan bijak."
	
func tutorial_target():
	for illust in all_illustrations:
		illust.visible = false
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelTarget.visible = true
	label_tut_judul.text = "Target"
	label_tut_desk.text = "Selesaikan game ini dengan memenuhi semua target."
	
func tutorial_lainnya():
	for illust in all_illustrations:
		illust.visible = false
	$ButtonMain/CanvasLayer/PanelAtur/CaraMain/PanelIlustrasi/PanelLainnya.visible = true
	label_tut_judul.text = "Lainnya"
	label_tut_desk.text = "Pembayaran pajak berefek ke Kartu Peristiwa dan Dialog pada akhir tahun.\n\nJadi ingat, bayar pajak."
	
	
