extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button001_pressed():
	get_tree().change_scene("res://s001_counter/s001_counter.tscn")


func _on_Button002_pressed():
	get_tree().change_scene("res://s002_keyinput/Scene.tscn")
