extends Node2D

signal signal_get_money(value)
signal signal_update_building_datas(buildings_data_dict, yet_buildings_data_dict)

export(AudioStreamMP3) var sound_kaching

# Upgradeable properties
var maxTime = 5
var minTime = 0.33
var order_price = 10

# Data handler
var curTime = 3
var curDineInTime = 3
var order_max = 3
var is_paused = false
var ordered_buildings = []
var all_buildings = []
var yet_buildings = []

func _ready():
	get_parent().visible = true
	for child in get_children():
		if child.has_signal("signal_order_received") and child.visible:
			all_buildings.append(child)
			child.connect("signal_order_received", self, "order_received")
		elif child.has_signal("signal_order_received"):
			yet_buildings.append(child)
	
	update_building_datas()

func _process(delta):
	if is_paused == false:
		curTime -= delta
		curDineInTime -= delta
		
		if curTime <= 0:
			curTime = rand_range(minTime,maxTime-1)
			random_order()
		if curDineInTime <= 0:
			curDineInTime = maxTime
			$TokoMartabak.dine_in(order_price)

func order_received(money, ordered_building):
	ordered_buildings.erase(ordered_building)
	$AudioPlayer.stream = sound_kaching
	$AudioPlayer.play(0.25)
	emit_signal("signal_get_money", money)

func random_order():
	if ordered_buildings.size() >= order_max : return
	
	var random_child = all_buildings[randi()%all_buildings.size()]
	if random_child.name != "TokoMartabak" and \
	random_child.name != "RumahBambang" and \
	random_child.can_pick_order == false and \
	!ordered_buildings.has(random_child):
		random_child.need_order(order_price)
		ordered_buildings.append(random_child)
		
	else: random_order()

func upgrade_building(building_name):
	for building in all_buildings:
		if building.building_name == building_name:
			building.increase_level()
			update_building_datas()
			break

func add_new_building(building_name):
	for child in get_children():
		if child.get("building_name") != null and child.building_name == building_name:
			child.make_visible()
			if child.has_signal("signal_order_received") :
				all_buildings.append(child)
				child.connect("signal_order_received", self, "order_received")
				if yet_buildings.has(child) : yet_buildings.erase(child)
				
	update_building_datas()

func upgrade_martabak(new_maxTime, new_minTime, new_order_price):
	maxTime = new_maxTime
	minTime = new_minTime
	order_price = new_order_price

# UTILITY --------------------------

func update_building_datas():
	var buildings_data_dict = []
	for building in all_buildings:
		buildings_data_dict.append({\
		"building_name" :  building.building_name, \
		"building_level" : building.building_level})

	var yet_data_dict = []
	for building in yet_buildings:
		yet_data_dict.append({\
		"building_name" :  building.building_name, \
		"building_level" : building.building_level})
	emit_signal("signal_update_building_datas",buildings_data_dict, yet_data_dict)

func reset():
	resume()
	for building in ordered_buildings:
		building.cancel_order()
	
	ordered_buildings.clear()

func stop_audio_player():
	$AudioPlayer.stop()

func pause():
	is_paused = true

func resume():
	is_paused = false

# SIGNALS --------------------------

func _on_Linimasa_signal_end_year(_year):
	reset()
	pause()

func _on_Linimasa_signal_start_year(_currenty_year, _current_age):
	reset()

func _on_Linimasa_signal_draw_peristiwa(_title, _desc, _kota, _harta, _dosa,_image_path):
	pause()

func _on_Peristiwa_signal_peristiwa_ok():
	resume()

func _on_PanelPasar_signal_add_building(building_name):
	add_new_building(building_name)

func _on_PanelPasar_signal_upgrade_harga_martabak(new_order_price):
	upgrade_martabak(maxTime, minTime, new_order_price)

func _on_PanelPasar_signal_upgrade_max_time(new_maxTIme):
	upgrade_martabak(new_maxTIme, minTime, order_price)

func _on_PanelPasar_signal_upgrade_building(building_name):
	upgrade_building(building_name)

func _on_Linimasa_signal_pause_building(is_paused):
	if is_paused:
		pause()
	else:
		resume()
