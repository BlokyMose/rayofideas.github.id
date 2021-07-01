class_name PeristiwaData

var title = "Judul Peristiwa"
var desc = "Deskripsi"
var image = "res://Assets/Images/Peristiwa/Peristiwa_Gambar_Halo.png"
var kota = 0
var harta = 0
var dosa = 0

var age_limit = [0,100] # min, max age this card can be withdrawn
var building_condition = ["BuildingName", 1] # [building_name, building_level]
var sequel_card_path = null # another card that will be inserted to TakElak list 
						# after this card is drawn

func _init(\
title_ : String, \
desc_ : String, \
image_ : String, \
kota_ = 0, \
harta_ = 0, \
dosa_ = 0, \
age_limit_ = [0,100], \
building_condition_ = ["",0], \
sequel_card_path_ = null):
	title = title_
	desc = desc_
	image = image_
	kota = kota_
	harta = harta_
	dosa = dosa_
	
	age_limit = age_limit_
	building_condition = building_condition_
	sequel_card_path = sequel_card_path_
