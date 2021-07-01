extends Node2D

func _ready():
	$AnimationPlayer.connect("animation_finished", self, "animation_finished")
	$AnimationPlayer.play("anim_jalanan_1")

func animation_finished(anim_name):
	if anim_name == "anim_jalanan_1":
		$AnimationPlayer.play("anim_jalanan_2")
	elif anim_name == "anim_jalanan_2":
		$AnimationPlayer.play("anim_jalanan_1")
