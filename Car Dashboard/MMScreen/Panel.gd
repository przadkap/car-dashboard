extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var current_contact

func _ready():
	$VBoxContainer.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ContactList_contact_changed(new_contact):
	$VBoxContainer.visible = true
	$VBoxContainer/Name.text = new_contact["name"]
	$VBoxContainer/Number.text = new_contact["number"]
	current_contact = new_contact


func _on_Call_pressed():
	$VBoxContainer/HBoxContainer/MarginContainer/Call.contact_name = current_contact["name"]
