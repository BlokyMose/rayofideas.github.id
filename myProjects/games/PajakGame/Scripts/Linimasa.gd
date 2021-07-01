extends Panel

signal signal_pause_building(is_paused)

signal signal_end_year(current_year)
signal signal_start_year(current_year, current_age)
signal signal_draw_peristiwa(title, desc, kota, harta, dosa, image_path)
signal signal_end_month(current_month)
signal signal_start_dialogue()
signal signal_show_laporan()

onready var progress_linimasa = $ProgressLinimasa
onready var label_tahun = $LabelTahun
onready var label_umur = $LabelUmur

export(String, FILE, "*.gd") var deck_path
var card_paths = []
var inevitable_card_paths = []
var umur = 24
var tahun = 1999
var bulan = 0
var is_in_end_round = false

var buildings_data = []
var yet_buildings_data = []

# Timer vars
var is_paused = true
var time_elapsed = 0
const timer_wait_time = 0.0166 
#const timer_wait_time = 0.005

# 1200 max width / 30sec desired duration = 40 width/sec
# 1 width for 0.025 sec

const draw_peristiwa_combination = [
#	[1,2,3,4,5,6,7,8,9,10,11,12],
#	[1],
	[3,11],
	[10],
	[5],
	[2,10],
	[4],
	[6],
	[8,12],
	[7,12],
	[2],
	[9],
]
var current_peristiwa_combination

func _ready():
	
	visible = true
	
	var deck_class = load(deck_path).new()
	card_paths = deck_class.card_paths
	
	$AnimationPlayer.connect("animation_finished", self, "check_finished_anim")
	
	# Setup Panel Tahun Baru
	$PanelTahunBaru/ButtonOkGas.connect("pressed", self, "play_anim_mulai_tahun")
	$PanelTahunBaru.visible = false
	
	# Setup Panel Akhir Tahun
	$PanelAkhirTahun/ButtonAkhiri.connect("pressed",self,"play_anim_akhir_tahun_backwards")
	$PanelAkhirTahun.visible = false
	
	pause()
	start_year_anim()

func _process(delta):
	if is_paused == false:
		time_elapsed += delta
		if time_elapsed >= timer_wait_time:
			add_month()
			time_elapsed = 0

func play_anim_mulai_tahun():
	$AnimationPlayer.play("anim_mulai_tahun_ok")

func play_anim_akhir_tahun_backwards():
	$AnimationPlayer.play_backwards("anim_akhiri_tahun")
	emit_signal("signal_start_dialogue")
	$PanelAkhirTahun.visible = false

func check_finished_anim(anim_name):
	if anim_name == "anim_mulai_tahun_ok":
		start_year()

func start_year():
	print("start year")
	
	$PanelTahunBaru.visible = false
	$PanelTahunBaru/ButtonOkGas.disabled = true
	tahun += 1
	Global.tahun = tahun
	umur += 1
	Global.umur = umur
	label_tahun.text = String(tahun)
	label_umur.text = "umur "+String(umur)+" th."
	
	emit_signal("signal_start_year", tahun, umur)
	bulan = 0
	Global.bulan = 1
	
	progress_linimasa.value = 0
#	current_peristiwa_combination = draw_peristiwa_combination[0].duplicate()
	current_peristiwa_combination = draw_peristiwa_combination[randi()%draw_peristiwa_combination.size()].duplicate()
	is_in_end_round = false
	resume()
	time_elapsed = 0

func end_year():
	print("end year")
	emit_signal("signal_end_year", tahun)
	pause()
	is_in_end_round = true
	
	$PanelAkhirTahun/LabelTahun.text = String(tahun)
	$PanelAkhirTahun.visible = true
	$AnimationPlayer.play("anim_akhiri_tahun")

func start_year_anim():
	$PanelTahunBaru/LabelTahun.text = String(tahun+1)
	$PanelTahunBaru.visible = true
	$AnimationPlayer.play("anim_mulai_tahun")
	$PanelTahunBaru/ButtonOkGas.disabled = false

func add_month():
	if is_paused : return
	
	# Every timer timeout, this method is called
	progress_linimasa.value += 1
	
	# Max width of Linimasa is 1200, divided by 12 months = 100
	if fmod(progress_linimasa.value, 100) == 0:
		bulan += 1
		Global.bulan = bulan
		emit_signal("signal_end_month", bulan) # bulan = 1 ~ 12, no zero
		
		for combi in current_peristiwa_combination:
			if combi == bulan:
				draw_peristiwa()
				current_peristiwa_combination.erase(combi)
				break
	
	# Year ends
	if progress_linimasa.value == progress_linimasa.max_value:
		end_year()

var failed_draw_count = 0
func draw_peristiwa():
	
	# Draw card only if there's a card, and if the failed attempts count less is than 4
	if card_paths.size() <= 0 : 
		if inevitable_card_paths.size() <= 0 : return
	if failed_draw_count > 4 : 
		failed_draw_count = 0
		print(" !! Failed to draw peristiwa !!")
		return
		
	print("-- Drawing peristiwa, bulan: ",bulan, " --")
	
	
	# Randomly draw from either: normal deck or inevitable deck
	# the chance of drawing inevitable deck is 5/16
	var selected_deck = card_paths
	if card_paths.size() <= 0:
		selected_deck = inevitable_card_paths
	elif inevitable_card_paths.size() > 0:
		if randi()%15 > 10:
			selected_deck = inevitable_card_paths
	
	# Load selected card, then check if valid
	var card_index = randi() % selected_deck.size()
	var card = load(selected_deck[card_index]).new()
	if check_selected_card(card) == false:
		failed_draw_count += 1
		draw_peristiwa()
		return
	else:
		failed_draw_count = 0
	
	emit_signal("signal_draw_peristiwa", card.peristiwa.title, card.peristiwa.desc, card.peristiwa.kota, card.peristiwa.harta,card.peristiwa.dosa, card.peristiwa.image)
	pause()
	
	# Add sequel, remove drawn card	
	if card.peristiwa.sequel_card_path != null:
		if card.peristiwa.sequel_card_path != "":
			inevitable_card_paths.append(card.peristiwa.sequel_card_path)
	selected_deck.remove(card_index)

func check_selected_card(card):
	# Check age condition
	if umur > card.peristiwa.age_limit[0] and umur < card.peristiwa.age_limit[1]:
		# Check if there is building condition
		if card.peristiwa.building_condition[0] == "":
			return true
		else:
			for building_data in buildings_data:
				# Look for same building name
				if building_data["building_name"] == card.peristiwa.building_condition[0]:
					# Check building level
					if building_data["building_level"] == card.peristiwa.building_condition[1]: 
						return true
					# Found building level doesn't match the condition
					else: 
						print("Failed to draw, incorrect level : ",card.peristiwa.title)
						return false
					
			# Found no same building name
			print("Failed to draw, no building : ",card.peristiwa.title)
			print("Looking in yet_buildings_data : ")
			for building_data in yet_buildings_data:
				# Look for same building name
				if building_data["building_name"] == card.peristiwa.building_condition[0]:
					# Check building level
					if building_data["building_level"] == card.peristiwa.building_condition[1]: 
						return true
					# Found building level doesn't match the condition
					else: 
						print("Failed to draw, incorrect level : ",card.peristiwa.title)
						return false
					
			print("No conditon met")
			return false
			
	# Under age condition
	else: 
		print("Failed to draw, under age : ",card.peristiwa.title)
		return false	

func pause():
	is_paused = true
	emit_signal("signal_pause_building", is_paused)

func resume():
	is_paused = false
	emit_signal("signal_pause_building", is_paused)

func _on_Peristiwa_signal_peristiwa_ok():
	resume();

func _on_Bangunan_signal_update_building_datas(buildings_data_dict,yet_buildings_data_dict):
	buildings_data = buildings_data_dict
	yet_buildings_data = yet_buildings_data_dict

func _on_Dialog_signal_dialogue_ended():
	emit_signal("signal_show_laporan")

func _on_LaporanTahunan_signal_laporan_ok(_penalty):
	start_year_anim()

func _on_PanelPasar_signal_add_peristiwa(path):
	print("New inevitable peristiwa added : ", path)
	inevitable_card_paths.append(path)

func _on_ButtonAtur_signal_atur_hidden():
	resume()

func _on_ButtonAtur_signal_atur_showed():
	pause()

func _on_PanelPasar_signal_pasar_hidden():
	resume()

func _on_PanelPasar_signal_pasar_showed():
	pause()

func _on_PanelTarget_signal_target_hidden():
	resume()

func _on_PanelTarget_signal_target_showed():
	pause()
