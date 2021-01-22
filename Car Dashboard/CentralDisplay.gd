extends PanelContainer

func _ready():
	_on_App_km_changed()


func _on_Statistics_stat_visibility_changed(index, visibility):

	$VBoxContainer/PanelContainer/VBoxContainer.get_child(index - 1).visible = visibility
	
	if(visibility && !$VBoxContainer/PanelContainer.visible):
		$VBoxContainer/PanelContainer.visible = true
	elif(!visibility):
		for child in $VBoxContainer/PanelContainer/VBoxContainer.get_children():
			if child.visible:
				return
		$VBoxContainer/PanelContainer.visible = false


func _on_App_km_changed():
	$VBoxContainer/PanelContainer/VBoxContainer/Stat1/HBoxContainer/Value.text = str(Globals.distance_traveled["day"])
	$VBoxContainer/PanelContainer/VBoxContainer/Stat2/HBoxContainer/Value.text = str(Globals.distance_traveled["week"])
	$VBoxContainer/PanelContainer/VBoxContainer/Stat3/HBoxContainer/Value.text = str(Globals.distance_traveled["month"])
