extends VBoxContainer

signal signal_kota_added(added_kota)
signal signal_harta_added(added_harta)
signal signal_dosa_added(added_dosa)
signal signal_monthly_tax_paid(tax_paid)
signal signal_laporan_tax(kota,harta,dosa)

onready var level_kota_rect = $PanelLevelKota/LevelKota/LevelKotaLuar/LevelKotaDalam
onready var level_harta_rect = $PanelLevelHarta/LevelHarta/LevelHartaLuar/LevelHartaDalam
onready var level_dosa_rect = $PanelLevelDosa/LevelDosa/LevelDosaLuar/LevelDosaDalam

onready var level_kota_angka = $PanelLevelKota/LevelKota/LevelKotaAngka
onready var level_harta_angka = $PanelLevelHarta/LevelHarta/LevelHartaAngka
onready var level_dosa_angka = $PanelLevelDosa/LevelDosa/LevelDosaAngka

const kota_bbcode = " /[font=res://Assets/Fonts/IncisedCtBt/IncisedCtBt_Small.tres]1000[/font]"
const harta_bbcode = " [font=res://Assets/Fonts/IncisedCtBt/IncisedCtBt_Small.tres]jt[/font]"
const dosa_bbcode = " /[font=res://Assets/Fonts/IncisedCtBt/IncisedCtBt_Small.tres]100[/font]"


var level_kota = 800
var level_harta = 160
var level_dosa = 0

var level_kota_this_year = 0
var level_harta_this_year = 0
var level_dosa_this_year = 0

const level_kota_max = 1000
const level_harta_max = 2000
const level_dosa_max = 100

const rect_x_max = 400
const rect_y = 40


func _ready():
	
	visible = true
	
	add_kota(0)
	add_harta(0)
	add_dosa(0)

func add_kota(value):
	level_kota += value
	level_kota_this_year += value
	Global.kota = level_kota
	
	level_kota_angka.bbcode_text = String(level_kota)+kota_bbcode
	level_kota_rect.set_size(Vector2(float(level_kota) / level_kota_max * rect_x_max, rect_y))
	if value < 0:
		$PanelVFX/LabelKota.set("custom_colors/font_color", Color.red) 
		$PanelVFX/LabelKota.text = String(value)
	else:
		$PanelVFX/LabelKota.set("custom_colors/font_color", Color.green) 
		$PanelVFX/LabelKota.text ="+" + String(value)
	$PanelVFX/LabelKota/AnimationPlayer.play("anim_get_kota")
	emit_signal("signal_kota_added", level_kota)

func add_harta(value):
	level_harta += value
	level_harta_this_year += value
	Global.harta = level_harta
	
	level_harta_angka.bbcode_text = String(level_harta)+harta_bbcode
	level_harta_rect.set_size(Vector2(float(level_harta) / level_harta_max * rect_x_max, rect_y))
	if value < 0:
		$PanelVFX/LabelHarta.set("custom_colors/font_color", Color.red) 
		$PanelVFX/LabelHarta.text = String(value)
	else:
		$PanelVFX/LabelHarta.set("custom_colors/font_color", Color.goldenrod) 
		$PanelVFX/LabelHarta.text ="+" + String(value)
	$PanelVFX/LabelHarta/AnimationPlayer.play("anim_get_harta")
	emit_signal("signal_harta_added", value)
	
func add_dosa(value):
	level_dosa += value
	level_dosa_this_year += value
	Global.dosa = level_dosa
	
	level_dosa_angka.bbcode_text = String(level_dosa)+dosa_bbcode
	level_dosa_rect.set_size(Vector2(float(level_dosa) / level_dosa_max * rect_x_max, rect_y))
	if value < 0:
		$PanelVFX/LabelDosa.set("custom_colors/font_color", Color.red) 
		$PanelVFX/LabelDosa.text = String(value)
	else:
		$PanelVFX/LabelDosa.set("custom_colors/font_color", Color.cyan) 
		$PanelVFX/LabelDosa.text ="+" + String(value)
	$PanelVFX/LabelDosa/AnimationPlayer.play("anim_get_dosa")
	emit_signal("signal_dosa_added", level_dosa)

func convert_tax_to_kota(tax):
	emit_signal("signal_monthly_tax_paid", tax)
	add_harta(-tax)
	add_kota(tax)

func add_level(level_name, level_added):
	if level_name == "kota":
		add_kota(level_added)
	elif level_name == "harta":
		add_harta(level_added)
	elif level_name == "dosa":
		add_dosa(level_added)

func reset():
	level_kota_this_year = 0
	level_harta_this_year = 0
	level_dosa_this_year = 0

func _on_Bangunan_signal_get_money(value):
	add_harta(value)

func _on_Linimasa_signal_draw_peristiwa(title, desc, kota, harta, dosa, _image_path):
	add_kota(kota)
	add_harta(harta)
	add_dosa(dosa)

func _on_PanelBayarPajak_signal_paid_pajak(paid_pajak):
	convert_tax_to_kota(paid_pajak)

func _on_Dialog_signal_add_level(level_name, level_added):
	add_level(level_name, level_added)

func _on_Linimasa_signal_show_laporan():
	emit_signal("signal_laporan_tax", level_kota_this_year, level_harta_this_year, level_dosa_this_year)

func _on_Linimasa_signal_start_year(current_year, current_age):
	reset()

func _on_LaporanTahunan_signal_laporan_ok(penalty):
	add_harta(penalty)
	add_kota(floor(penalty/2))
	add_dosa(ceil(-penalty/10))


func _on_PanelPasar_signal_bought(harga):
	add_harta(-harga)
