extends PanelContainer

func _ready():
	pass # Replace with function body.


func _on_Statistics_stat_visibility_changed(index, visibility):

	$VBoxContainer/PanelContainer/VBoxContainer.get_child(index - 1).visible = visibility
	
	if(visibility && !$VBoxContainer/PanelContainer.visible):
		$VBoxContainer/PanelContainer.visible = true
	elif(!visibility):
		for child in $VBoxContainer/PanelContainer/VBoxContainer.get_children():
			if child.visible:
				return
		$VBoxContainer/PanelContainer.visible = false
