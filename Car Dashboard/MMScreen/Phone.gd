extends PanelContainer


signal call_toggled

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Call_toggled(button_pressed):
	if(button_pressed):
		emit_signal("call_toggled", true)
		$CallAudio.play()
	else:
		emit_signal("call_toggled", false)
		$CallAudio.stop()
