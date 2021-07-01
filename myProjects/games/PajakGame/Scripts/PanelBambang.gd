extends Panel

var umur = 25
const initial_hair_saturation = 75

var hair_saturation = 50.0
var hair_hue = 24.0
var hair_visibility = 82.0

func _ready():
	visible = true

func aged(current_age):
	umur = current_age
	
	if hair_saturation > 0 :
		hair_saturation = initial_hair_saturation - umur
	$Rambut.self_modulate = Color.from_hsv(hair_hue/360,float(hair_saturation)/100,hair_visibility/100)
	
	if current_age == 30:
		$Kumis.visible = true

	elif current_age == 40:
		$Keriput.visible = true
		$Janggut.visible = true

	elif current_age == 50:
		$Kacamata.visible = true

func change_acc(new_acc_path):
	$Aksesoris.texture = load(new_acc_path)

func check_etan():
	if Global.dosa >= 50:
		$Etan.visible = true
	else : 
		$Etan.visible = false

func _on_Linimasa_signal_start_year(_current_year, current_age):
	aged(current_age)
	check_etan()

func _on_PanelPasar_signal_change_accessory(image_path):
	change_acc(image_path)
