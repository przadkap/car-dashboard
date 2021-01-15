extends PanelContainer

var highlight_stylebox = preload("res://MMScreen/styleboxes/highlight.stylebox")
var inactive_stylebox = preload("res://MMScreen/styleboxes/inactive.stylebox")

var highlight_node = preload("res://images/circle.png")
var inactive_node = preload("res://images/circle_black.png")

var home_streets = []
var home_nodes = []

var work_streets = []
var work_nodes = []

func _ready():
	home_streets = [
		$HBoxContainer/Map/MapField/DownerSt/ProgressBar,
		$HBoxContainer/Map/MapField/VertalSt/ProgressBar,
		$HBoxContainer/Map/MapField/ParallelSt/ProgressBar,
		$HBoxContainer/Map/MapField/MinimalSt/ProgressBar,
		$HBoxContainer/Map/MapField/MinimalSt/ProgressBar2
	]

	home_nodes = [
		$HBoxContainer/Map/MapField/Intersections/VD,
		$HBoxContainer/Map/MapField/Intersections/VP,
		$HBoxContainer/Map/MapField/Intersections/MP,
		$HBoxContainer/Map/MapField/Intersections/ML,
		$HBoxContainer/Map/MapField/Intersections/MENDU
	]


func _on_NavigateHome_pressed():

	for street in home_streets:
		street.add_stylebox_override("fg", highlight_stylebox)
	
	for node in home_nodes:
		node.texture = highlight_node

func _on_NavigateWork_pressed():
	
	for street in home_streets:
		street.add_stylebox_override("fg", inactive_stylebox)
	
	for node in home_nodes:
		node.texture = inactive_node
	
	for street in work_streets:
		street.add_stylebox_override("fg", highlight_stylebox)
	
	for node in work_nodes:
		node.texture = highlight_node
