extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	offset = get_viewport().get_mouse_position()


func _on_Button_pressed():
	get_tree().change_scene("res://Top.tscn")
