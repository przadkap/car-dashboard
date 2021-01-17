extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	km_values_changed(Globals.distance_traveled)

func km_values_changed(km_values):
	$VBoxContainer/Stat1/StatKMToday/Value.text = str(km_values["day"])
	$VBoxContainer/Stat2/StatKMWeek/Value.text = str(km_values["week"])
	$VBoxContainer/Stat3/StatKMMonth/Value.text = str(km_values["month"])


func _on_App_km_changed():
	km_values_changed(Globals.distance_traveled)
