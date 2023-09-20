extends Sprite2D

signal add_damage(damage)

func _ready():
	pass

func _input(event):
	#print("Input")
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	#print("Click")
	emit_signal("add_damage", 5)
