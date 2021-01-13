extends VBoxContainer

signal contact_changed

var contacts = [
	{"name": "Mom", "number": "456123789"},
	{"name": "Dad", "number": "456123789"},
	{"name": "Boss", "number": "44534589"},
	{"name": "Plumber", "number": "456121239"},
	{"name": "Pizza", "number": "4563123789"},
	{"name": "George Washington", "number": "453463489"},
	{"name": "Mike Wazowski", "number": "456123789"},
	{"name": "Kate from Management", "number": "123139"},
	{"name": "Car Mechanic", "number": "45574743789"},
	{"name": "XYZ", "number": "456123789"},
	{"name": "No more ideas", "number": "45623222"},
	{"name": "Mcdonalds?", "number": "45622222789"},
	{"name": "Monica", "number": "4561111119"},
]


func _ready():
	pass # Replace with function body.



func _on_Contact1_pressed():
	emit_signal("contact_changed", contacts[0])


func _on_Contact2_pressed():
	emit_signal("contact_changed", contacts[1])


func _on_Contact3_pressed():
	emit_signal("contact_changed", contacts[2])


func _on_Contact4_pressed():
	emit_signal("contact_changed", contacts[3])


func _on_Contact5_pressed():
	emit_signal("contact_changed", contacts[4])


func _on_Contact6_pressed():
	emit_signal("contact_changed", contacts[5])


func _on_Contact7_pressed():
	emit_signal("contact_changed", contacts[6])


func _on_Contact8_pressed():
	emit_signal("contact_changed", contacts[7])


func _on_Contact9_pressed():
	emit_signal("contact_changed", contacts[8])


func _on_Contact10_pressed():
	emit_signal("contact_changed", contacts[9])


func _on_Contact11_pressed():
	emit_signal("contact_changed", contacts[10])


func _on_Contact12_pressed():
	emit_signal("contact_changed", contacts[11])


func _on_Contact13_pressed():
	emit_signal("contact_changed", contacts[12])
