extends Area2D

#export(String, FILE, "*.gd") var data_path
#	data = load(data_path).new()
#var data

var building_name = "Toko Martabak"
var building_level = 0

var hover_color
var is_hovered = false
var current_order_price
var can_pick_order = false # Just in case, don't delete this so it may be compiled

signal signal_order_received(money, this_building)

func _ready():
	hover_color = Color.gray
	$Martabak_Bubble.visible = false
	$LabelMoney.visible = true
	$PanelName/LabelName.text = building_name + "\n" + "[Level : "+String(building_level)+"]"
	$PanelName.visible = false
	
func _on_Building_mouse_entered():
	$Sprite.self_modulate = hover_color
	is_hovered = true
	$PanelName.visible = true
	
func _on_Building_mouse_exited():
	$Sprite.self_modulate = Color.white
	is_hovered = false
	$PanelName.visible = false

func dine_in(order_price):
	$LabelMoney.text = "+"+String(order_price)
	current_order_price = order_price
	hover_color = Color.gold
	$AnimationPlayer.play("anim_hide_martabak")
	emit_signal("signal_order_received", current_order_price, self)
	
func increase_level():
	building_level += 1
	
func decrease_level():
	building_level -= 1
