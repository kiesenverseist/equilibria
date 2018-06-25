extends Control

func _ready():
	pass


func _on_CheckButton_visibility_toggled(button_pressed):
	get_node("Container/menue").visible = button_pressed
