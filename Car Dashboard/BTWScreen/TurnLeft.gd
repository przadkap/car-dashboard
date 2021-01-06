extends PanelContainer

var active = false

func _ready():
	$TextureRect.texture = load("res://images/turn_idle.png")


func _on_App_turn_left():
#	$TextureRect.texture = load()
	active = true
	$TurnTimer.start()
	$TextureRect.texture = load("res://images/turn_active.png")



func _on_TurnTimer_timeout():
	
	if active:
		$TextureRect.texture = load("res://images/turn_idle.png")
	else:
		$TextureRect.texture = load("res://images/turn_active.png")
	
	active = !active
	
		


func _on_App_turn_off():
	$TurnTimer.stop()
	active = false
	$TextureRect.texture = load("res://images/turn_idle.png")
