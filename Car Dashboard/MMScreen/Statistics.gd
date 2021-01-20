extends PanelContainer

signal stat_visibility_changed

func _ready():
	km_values_changed(Globals.distance_traveled)

func km_values_changed(km_values):
	$VBoxContainer/Stat1/StatKMToday/Value.text = str(km_values["day"])
	$VBoxContainer/Stat2/StatKMWeek/Value.text = str(km_values["week"])
	$VBoxContainer/Stat3/StatKMMonth/Value.text = str(km_values["month"])


func _on_App_km_changed():
	km_values_changed(Globals.distance_traveled)


func _on_DisplayButton1_toggled(button_pressed):
	emit_signal("stat_visibility_changed", 1, button_pressed)

func _on_DisplayButton2_toggled(button_pressed):
	emit_signal("stat_visibility_changed", 2, button_pressed)
	
func _on_DisplayButton3_toggled(button_pressed):
	emit_signal("stat_visibility_changed", 3, button_pressed)
	
func _on_DisplayButton4_toggled(button_pressed):
	emit_signal("stat_visibility_changed", 4, button_pressed)
	
func _on_DisplayButton5_toggled(button_pressed):
	emit_signal("stat_visibility_changed", 5, button_pressed)
	
func _on_DisplayButton6_toggled(button_pressed):
	emit_signal("stat_visibility_changed", 6, button_pressed)


