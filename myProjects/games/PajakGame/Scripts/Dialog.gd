extends Panel

signal signal_dialogue_ended
signal signal_add_level(level_name,level_added)

var is_in_dialogue = false
var can_next = false
enum SPEAKER {BAMBANG, OTHER}
enum MODE {SPEAKING, CHOICE}
var current_speaker
var current_mode

var dialogue_deck
const dialogue_deck_path = "res://Scripts/Dialogues/Dialogue_Deck.gd"
var current_dialogue
var dialogue_next_index

onready var bambang_data = load("res://Scripts/CharactersData/Bambang.gd").new()
var other_data

func _ready():
	visible = true
	show_children(false)
	
	$AnimationPlayer.connect("animation_finished",self,"animation_dialogue_finished")
	$BubbleBambang/AnimationPlayer.connect("animation_finished",self,"animation_bubble_finished")
	$BubbleOrangLain/AnimationPlayer.connect("animation_finished",self,"animation_bubble_finished")
	
	$ButtonLanjut.connect("pressed",self,"next_pressed")
	
	$PanelPilihan/Pilihan1.connect("pressed",self,"pilihan_1_pressed")
	$PanelPilihan/Pilihan2.connect("pressed",self,"pilihan_2_pressed")
	$PanelPilihan/Pilihan3.connect("pressed",self,"pilihan_3_pressed")
	
	dialogue_deck = load(dialogue_deck_path).new()
	
func start_dialogue(title, first_index = "0"):
	show_children(true)

	is_in_dialogue = true
	mouse_filter = Control.MOUSE_FILTER_STOP
	$AnimationPlayer.play("anim_dialog_show")
	$PanelBambang/Wajah.texture = load(bambang_data.normal_path)
	
	current_dialogue = load(dialogue_deck.dialogue_paths[title]).new()
	other_data = load(current_dialogue.dialogue["other_character_path"]).new()
	$PanelOrangLain/Badan.texture = load(other_data.body_path)
	$PanelOrangLain/Wajah.texture = load(other_data.normal_path)
	if current_dialogue.dialogue["dialogues"][first_index]["is_bambang"]:
		bambang_says(current_dialogue.dialogue["dialogues"][first_index]["text"],current_dialogue.dialogue["dialogues"][first_index]["emotion"])
	else:
		other_says(current_dialogue.dialogue["dialogues"][first_index]["text"],current_dialogue.dialogue["dialogues"][first_index]["emotion"])
	dialogue_next_index = current_dialogue.dialogue["dialogues"][first_index]["next_index"]
	$PanelPilihan/Pilihan1.visible = false
	$PanelPilihan/Pilihan2.visible = false
	$PanelPilihan/Pilihan3.visible = false
	
func end_dialogue():
	show_children(false)
	is_in_dialogue = false
	$PanelBambang/Wajah.texture = load(bambang_data.normal_lurus_path)
	$AnimationPlayer.play_backwards("anim_dialog_show")

func animation_dialogue_finished(anim_name):
	# Final animation
	if anim_name == "anim_dialog_show":
		if is_in_dialogue == false:
			mouse_filter = Control.MOUSE_FILTER_IGNORE
			emit_signal("signal_dialogue_ended")
	
func bambang_says(dialogue, emotion):
	current_speaker = SPEAKER.BAMBANG
	current_mode = MODE.SPEAKING
	$BubbleBambang/Text.bbcode_text = dialogue
	$PanelBambang/Wajah.texture = load(emotion_to_path(emotion, bambang_data))
	$BubbleBambang/AnimationPlayer.play("anim_bubble_show")
	can_next = false

func other_says(dialogue, emotion):
	current_speaker = SPEAKER.OTHER
	current_mode = MODE.SPEAKING
	$BubbleOrangLain/Text.bbcode_text = dialogue
	$PanelOrangLain/Wajah.texture = load(emotion_to_path(emotion, other_data))
	$BubbleOrangLain/AnimationPlayer.play("anim_bubble_show_right")
	can_next = false
	print("saying")

func emotion_to_path(emotion:String, character_data):
	# Emotion must contain one of these
	
	if emotion == "normal":
		return character_data.normal_path
	elif emotion == "normal_lurus":
		return character_data.normal_lurus_path
	elif emotion == "lelah":
		return character_data.lelah_path
	elif emotion == "marah":
		return character_data.marah_path
	elif emotion == "sedih":
		return character_data.sedih_path
	elif emotion == "senang":
		return character_data.senang_path
	elif emotion == "terkejut":
		return character_data.terkejut_path

func animation_bubble_finished(anim_name):
	if anim_name == "anim_bubble_show":
		can_next = true
	elif anim_name == "anim_bubble_show_right":
		can_next = true

func show_pilihan(pilihan_1,pilihan_2,pilihan_3):
	current_mode = MODE.CHOICE
	
	$ButtonLanjut.visible = false
	$PanelPilihan/Pilihan1.visible = true
	$PanelPilihan/Pilihan2.visible = true
	
	$PanelPilihan/Pilihan1.text = pilihan_1
	$PanelPilihan/Pilihan2.text = pilihan_2
	if pilihan_3 != "": 
		$PanelPilihan/Pilihan3.text = pilihan_3
		$PanelPilihan/Pilihan3.visible = true
	else :
		$PanelPilihan/Pilihan3.visible = false
		
	$AnimationPlayer.play("anim_pilihan_show")

func pilihan_1_pressed():
	$AnimationPlayer.play("anim_pilihan_hide")
	emit_signal("signal_add_level", current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_1_reward"][0],\
	current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_1_reward"][1])
	dialogue_next_index = current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_1_next_index"]
	next_pressed()

func pilihan_2_pressed():
	$AnimationPlayer.play("anim_pilihan_hide")
	emit_signal("signal_add_level", current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_2_reward"][0],\
	current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_2_reward"][1])
	dialogue_next_index = current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_2_next_index"]
	next_pressed()

func pilihan_3_pressed():
	$AnimationPlayer.play("anim_pilihan_hide")
	emit_signal("signal_add_level", current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_3_reward"][0],\
	current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_3_reward"][1])
	dialogue_next_index = current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_3_next_index"]
	next_pressed()

func next_pressed():
	if can_next:
		
		$PanelPilihan/Pilihan1.visible = false
		$PanelPilihan/Pilihan2.visible = false
		$PanelPilihan/Pilihan3.visible = false
		$ButtonLanjut.visible = true
		
		$PanelBambang/Wajah.texture = load(bambang_data.normal_path)
		$PanelOrangLain/Wajah.texture = load(other_data.normal_path)
		
		# Hide animation
		if current_mode == MODE.SPEAKING:
			if current_speaker == SPEAKER.BAMBANG:
				$BubbleBambang/AnimationPlayer.play("anim_bubble_hide")
			else :
				$BubbleOrangLain/AnimationPlayer.play("anim_bubble_hide_right")
		
		# Determine mode
		# Ending dialoge
		if current_dialogue.dialogue["dialogues"][dialogue_next_index]["mode"] == "closing":
			if current_dialogue.dialogue["dialogues"][dialogue_next_index]["peristiwa_path"] != "":
				pass
			end_dialogue()
			# Record dialogue result/reward/peristiwa
		
		# Speaking mode
		elif current_dialogue.dialogue["dialogues"][dialogue_next_index]["mode"] == "text":
			if current_dialogue.dialogue["dialogues"][dialogue_next_index]["is_bambang"]:
				bambang_says(current_dialogue.dialogue["dialogues"][dialogue_next_index]["text"],current_dialogue.dialogue["dialogues"][dialogue_next_index]["emotion"])
			else:
				other_says(current_dialogue.dialogue["dialogues"][dialogue_next_index]["text"],current_dialogue.dialogue["dialogues"][dialogue_next_index]["emotion"])
			dialogue_next_index = current_dialogue.dialogue["dialogues"][dialogue_next_index]["next_index"]
			
		# Choice mode
		elif current_dialogue.dialogue["dialogues"][dialogue_next_index]["mode"] == "choice":
			show_pilihan(\
			current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_1_text"],\
			current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_2_text"],\
			current_dialogue.dialogue["dialogues"][dialogue_next_index]["option_3_text"]
			)

func show_children(is_hiding:bool):
	for child in get_children():
		if child.name != "PanelBambang" and child.name != "AnimationPlayer":
			child.visible = is_hiding

func choose_dialogue(current_year:int):
	# Based on the dialogue deck
	if current_year == 2000 :
		start_dialogue("survei")
	elif current_year == 2001 :
		start_dialogue("menteri")
	elif current_year == 2002 :
		start_dialogue("bebeb_1")
	elif current_year == 2004 :
		start_dialogue("kuis_1")
	elif current_year == 2006 :
		start_dialogue("bebeb_2")
	elif current_year == 2008 :
		start_dialogue("dadam_1")
		
	elif current_year == 2010 :
		start_dialogue("bebeb_3")
	elif current_year == 2012 :
		start_dialogue("kuis_2")
	elif current_year == 2014 :
		start_dialogue("dadam_2")
	elif current_year == 2016 :
		start_dialogue("budiman_1")
	elif current_year == 2018 :
		start_dialogue("ancela_1")
		
	elif current_year == 2020 :
		start_dialogue("budiman_2")
	elif current_year == 2022 :
		start_dialogue("ancela_2")
	elif current_year == 2024 :
		start_dialogue("budiman_3")
	elif current_year == 2026 :
		start_dialogue("telepon_emak")
#	elif current_year == 2028 :
#		start_dialogue("budiman_3")
#
#	elif current_year == 2030 :
#		start_dialogue("budiman_3")
#	elif current_year == 2032 :
#		start_dialogue("budiman_3")
#	elif current_year == 2034 :
#		start_dialogue("budiman_3")
	else:
		emit_signal("signal_dialogue_ended")

func _on_Linimasa_signal_start_dialogue():
	choose_dialogue(Global.tahun)
