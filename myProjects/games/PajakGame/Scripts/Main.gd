extends Node

var bgm_carefree = load("res://Assets/Audio/BGM/Twin Musicom - Carefree Melody.mp3")
var bgm_italian = load("res://Assets/Audio/BGM/Twin Musicom - Italian Afternoon.mp3")

func _ready():
	$AudioPlayer.stream = bgm_carefree
	$AudioPlayer.play()
	$AudioPlayer.connect("finished",self,"audio_finished")

func audio_finished():
	if $AudioPlayer.stream == bgm_carefree:
		$AudioPlayer.stream = bgm_italian
	elif $AudioPlayer.stream == bgm_italian:
		$AudioPlayer.stream = bgm_carefree
	$AudioPlayer.play()

func add_bgm_volume():
	$AudioPlayer.volume_db += 7

func reduce_bgm_volume():
	$AudioPlayer.volume_db -= 7
