extends Control

var main_menu_scene = load("res://Scenes/MainMenu.tscn")
var wajah_sedih = load("res://Assets/Images/UI/Karakter/Bambang/Wajah/Wajah_Sedih.png")

func _ready():
	
	var total_renovasi = 0
	for renovasi in Global.penghargaan:
		if renovasi == "renovator" : 
			total_renovasi += 1
			
	var total_bangunan = 0
	for renovasi in Global.penghargaan:
		if renovasi == "kota maju saja" : 
			total_renovasi += 1
	
	var akhir_kata
	if Global.dosa >= 50:
		akhir_kata = "Dasar, pendosa !!!"
		$PanelBambang/Wajah.texture = wajah_sedih
		$PanelBambang/Etan.visible = true
	elif total_renovasi == 6 :
		akhir_kata = "Terima kacih, renovator!"
	elif total_bangunan == 3 :
		akhir_kata = "Bambang si Pembangun Negara"
	elif Global.kota >= 800 :
		akhir_kata = "Terima kasih atas pajaknya"
	else:
		akhir_kata = "Bambang kurang semangat bayar pajaknya"
		$PanelBambang/Wajah.texture = wajah_sedih
		
		
	$LabelRaportKonten.text = "Kontribusi Kota : "+String(Global.kota) +\
"\nTotal Dosa : "+ String(Global.dosa) +\
"\n\nTotal Renovasi : "+ String(total_renovasi) +\
"\nBangunan Baru : "+String(total_bangunan) +\
"\n\nAkhir Kata :\n"+ akhir_kata

	$ButtonSelesai.connect("pressed",self,"back_to_main_menu")

func back_to_main_menu():
	get_tree().change_scene_to(main_menu_scene)
