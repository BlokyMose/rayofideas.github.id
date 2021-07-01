extends Panel

signal signal_laporan_ok(penalty)

var kota_this_year = 0
var harta_this_year = 0
var dosa_this_year = 0
var tax_this_year = 0
var penalty_this_year = 0
var is_ok = false

func _ready():
	visible = false
	$ButtonOK.connect("pressed",self,"hide_laporan")
	$AnimationPlayer.connect("animation_finished",self,"anim_finished")

func show_laporan():
	visible = true
	var plus_minus = "+"
	if kota_this_year < 0 : plus_minus = ""
	else : plus_minus = "+"
	$NinePatchRect/LabelKota.text = "Kota : " +plus_minus+String(kota_this_year)
	
	if harta_this_year < 0 : plus_minus = ""
	else : plus_minus = "+"
	$NinePatchRect/LabelHarta.text = "Harta : " +plus_minus+String(harta_this_year)+" jt"
	
	if dosa_this_year < 0 : plus_minus = ""
	else : plus_minus = "+"
	$NinePatchRect/LabelDosa.text = "Dosa : " +plus_minus+String(dosa_this_year)
	
	$NinePatchRect/LabelTotalPajakBulanan.text = "Pajak Terbayar : "+String(tax_this_year)+" jt"
	$NinePatchRect/LabelDendaTelat.text = "Denda Telat : "+String(penalty_this_year)+" jt"
	$NinePatchRect/LabelKeteranganKonten.text = pick_keterangan()
	$AnimationPlayer.play("anim_laporan_show")

func pick_keterangan():
	if dosa_this_year > 5 :
		return "Pendosa"
	elif penalty_this_year > 25 : 
		return "Pajaknya jangan dilupa, Bang"
	elif penalty_this_year > 50 : 
		return "Dasar pemalas"
	elif penalty_this_year > 75 : 
		return "Bayar pajak woy"
	elif kota_this_year > 100 : 
		return "WP Terbaik Tahun Ini"
	elif kota_this_year > 75 : 
		return "WP Juara 2"
	elif kota_this_year > 50 : 
		return "Teruskan kerja keras Anda"
	elif kota_this_year > 25 : 
		return "Kota semakin maju!"
	else :
		return "-"

func hide_laporan():
	is_ok = true
	$AnimationPlayer.play_backwards("anim_laporan_show")
	emit_signal("signal_laporan_ok", -penalty_this_year)
	kota_this_year = 0
	harta_this_year = 0
	dosa_this_year = 0
	tax_this_year = 0
	penalty_this_year = 0

func anim_finished(anim_name):
	if is_ok:
		is_ok = false
		visible = false
		
func _on_Linimasa_signal_show_laporan():
	show_laporan()

func _on_Levels_signal_laporan_tax(kota, harta, dosa):
	kota_this_year = kota
	harta_this_year = harta
	dosa_this_year = dosa
	
func _on_PanelBayarPajak_signal_laporan_tax(paid_tax, penalty):
	tax_this_year = paid_tax
	penalty_this_year = penalty
	dosa_this_year += ceil(penalty/10)
	
	pass # Replace with function body.
