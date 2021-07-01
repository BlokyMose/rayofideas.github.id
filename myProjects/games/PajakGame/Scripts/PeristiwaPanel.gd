extends Panel

signal signal_peristiwa_ok

var ring_kota_sfx = false
var ring_harta_sfx = false
var ring_sad_sfx = false

func _ready():
	$AnimationPlayer.connect("animation_finished", self, "animation_finished")
	visible = false

func animation_finished(anim_name):
	if anim_name == "anim_peristiwa_hide":
		visible = false

func play_peristiwa():
	visible = true
	$AnimationPlayer.play("anim_peristiwa_show")

func ok():
	$AnimationPlayer.play("anim_peristiwa_hide")
	if ring_sad_sfx:
		ring_sad_sfx = false
		$AudioPlayerBad.play()
	if ring_harta_sfx:
		ring_harta_sfx = false
		$AudioPlayerHarta.play(0.025)
	if ring_kota_sfx:
		ring_kota_sfx = false
		$AudioPlayerKota.play()
	
func _on_ButtonOK_pressed():
	ok()
	emit_signal("signal_peristiwa_ok")


func _on_Linimasa_signal_draw_peristiwa(title, desc, kota, harta, dosa, image_path):
	$PeristiwaCard/LabelTitle.text = title
	$PeristiwaCard/PanelDesc/LabelDesc.text = desc
	$PeristiwaCard/Image.texture = load(image_path)
	$PeristiwaCard/PanelDesc/LabelDesc.scroll_to_line(0)
	
	if kota > 0:
		$PeristiwaCard/LabelKota.text = "Kota +"+String(kota)
		$PeristiwaCard/LabelKota.self_modulate = Color(0.64,1,0.49,1)
		ring_kota_sfx = true
	elif kota < 0:
		$PeristiwaCard/LabelKota.text = "Kota "+String(kota)
		$PeristiwaCard/LabelKota.self_modulate = Color(1,0.5,0.5,1)
		ring_sad_sfx = true
	else:
		$PeristiwaCard/LabelKota.text = "Kota +0"
		$PeristiwaCard/LabelKota.self_modulate = Color(0.5,0.5,0.5,1)

	if harta > 0:
		$PeristiwaCard/LabelHarta.text = "Harta +"+String(harta)
		$PeristiwaCard/LabelHarta.self_modulate = Color(1,0.95,0.37,1)
		ring_harta_sfx = true
	elif harta < 0:
		$PeristiwaCard/LabelHarta.text = "Harta "+String(harta)
		$PeristiwaCard/LabelHarta.self_modulate = Color(1,0.5,0.5,1)
		ring_sad_sfx = true
	else:
		$PeristiwaCard/LabelHarta.text = "Harta +0"
		$PeristiwaCard/LabelHarta.self_modulate = Color(0.5,0.5,0.5,1)

	if dosa > 0:
		$PeristiwaCard/LabelDosa.text = "Dosa +"+String(dosa)
		$PeristiwaCard/LabelDosa.self_modulate = Color(1,0.5,0.5,1)
		ring_sad_sfx = true
	elif dosa < 0:
		$PeristiwaCard/LabelDosa.text = "Dosa "+String(dosa)
		$PeristiwaCard/LabelDosa.self_modulate = Color(0.5,1,1,1)
	else:
		$PeristiwaCard/LabelDosa.text = "Dosa +0"
		$PeristiwaCard/LabelDosa.self_modulate = Color(0.5,0.5,0.5,1)

	play_peristiwa()
