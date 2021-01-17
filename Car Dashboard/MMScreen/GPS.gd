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
	
	work_streets = [
		$HBoxContainer/Map/MapField/DownerSt/ProgressBar,
		$HBoxContainer/Map/MapField/DownerSt/ProgressBar2,
		$HBoxContainer/Map/MapField/ReachSt/ProgressBar,
		$HBoxContainer/Map/MapField/ReachSt/ProgressBar2,
		$HBoxContainer/Map/MapField/ReachSt/ProgressBar3,
		$HBoxContainer/Map/MapField/ReachSt/ProgressBar4,
		$HBoxContainer/Map/MapField/ReachSt/ProgressBar5,
		$HBoxContainer/Map/MapField/LongSt/ProgressBar5,
		$HBoxContainer/Map/MapField/LongSt/ProgressBar6
	]
	
	work_nodes = [
		$HBoxContainer/Map/MapField/Intersections/VD,
		$HBoxContainer/Map/MapField/Intersections/RD,
		$HBoxContainer/Map/MapField/Intersections/RP,
		$HBoxContainer/Map/MapField/Intersections/RR1,
		$HBoxContainer/Map/MapField/Intersections/RR2,
		$HBoxContainer/Map/MapField/Intersections/RW,
		$HBoxContainer/Map/MapField/Intersections/RL,
		$HBoxContainer/Map/MapField/Intersections/PL,
		$HBoxContainer/Map/MapField/Intersections/LENDR
	]

func clear_path(streets, nodes):
	for street in streets:
		street.add_stylebox_override("fg", inactive_stylebox)
	
	for node in nodes:
		node.texture = inactive_node

func _on_NavigateHome_pressed():

	clear_path(work_streets, work_nodes)

	for street in home_streets:
		street.add_stylebox_override("fg", highlight_stylebox)
	
	for node in home_nodes:
		node.texture = highlight_node

func _on_NavigateWork_pressed():
	
	clear_path(home_streets, home_nodes)
	
	for street in work_streets:
		street.add_stylebox_override("fg", highlight_stylebox)
	
	for node in work_nodes:
		node.texture = highlight_node


func _on_Clear_pressed():
	clear_path(home_streets, home_nodes)
	clear_path(work_streets, work_nodes)
