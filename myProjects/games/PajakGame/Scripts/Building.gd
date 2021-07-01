extends Area2D

#export(String, FILE, "*.gd") var data_path
#	data = load(data_path).new()
#var data
export(bool) var visible_at_start = true
export(String) var building_name
var building_level = 0

var hover_color
var can_pick_order = false
var is_hovered = false
var current_order_price

signal signal_order_received(money, this_building)

func _ready():
	visible = visible_at_start
	if visible_at_start == false:
		building_level = -1
	hover_color = Color.gray
	$Martabak_Bubble.visible = false
	$LabelMoney.visible = false
	$PanelName/LabelName.text = building_name + "\n" + "[Level : "+String(building_level)+"]"
	$PanelName.visible = false

func _on_Building_mouse_entered():
	$Sprite.self_modulate = hover_color
	is_hovered = true
	if !can_pick_order:
		$PanelName.visible = true

func _on_Building_mouse_exited():
	$Sprite.self_modulate = Color.white
	is_hovered = false
	$PanelName.visible = false

func _input(event):
	if is_hovered:
		if event is InputEventMouseButton:
			if event.button_index == 1:
				pick_order()

func need_order(order_price):
	$Martabak_Bubble.visible = true
	$LabelMoney.visible = true
	$LabelMoney.text = "+"+String(order_price)
	current_order_price = order_price
	hover_color = Color.gold
	can_pick_order = true
	$AnimationPlayer.play("anim_show_martabak")

func pick_order():
	if can_pick_order:
		can_pick_order = false
		hover_color = Color.gray
		emit_signal("signal_order_received", current_order_price, self)
		$AnimationPlayer.play("anim_hide_martabak")

func cancel_order():
	if can_pick_order:
		$LabelMoney.text = "+0"
		can_pick_order = false
		hover_color = Color.gray
		$AnimationPlayer.play("anim_hide_martabak")

func increase_level():
	building_level += 1
	$PanelName/LabelName.text = building_name + "\n" + "[Level : "+String(building_level)+"]"
	
func decrease_level():
	building_level -= 1
	$PanelName/LabelName.text = building_name + "\n" + "[Level : "+String(building_level)+"]"

func make_visible():
	visible = true
	building_level = 0
