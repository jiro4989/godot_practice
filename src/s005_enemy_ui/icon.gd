extends Sprite2D

signal add_damage(damage: int)

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	add_damage.emit(5)
