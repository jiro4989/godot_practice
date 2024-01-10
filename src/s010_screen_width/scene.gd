extends Node2D

@onready var window_size_button = $PanelContainer/MarginContainer/VBoxContainer/WindowSize
@onready var screen_type_button = $PanelContainer/MarginContainer/VBoxContainer/ScreenType

enum {MODE_FULL_SCREEN, MODE_WINDOW, MODE_BORDER_LESS}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func trim(s: String) -> String:
	var sub = " "
	return s.trim_prefix(sub).trim_suffix(sub)

func to_i(s: String) -> int:
	return int(trim(s))

func window_centoring_position(window_size: Vector2i, screen_size: Vector2i) -> Vector2i:
	var x = window_size.x
	var y = window_size.y
	var x2 = x / 2
	var y2 = y / 2
	return Vector2i(screen_size.x / 2 - x2, screen_size.y / 2 - y2)

func set_window_centoring_position(window: Window):
	if window.mode == Window.MODE_FULLSCREEN:
		return
	window.position = window_centoring_position(window.size, DisplayServer.screen_get_size())

func _on_window_size_item_selected(index):
	var selected_item = window_size_button.get_item_text(index)
	var size = selected_item.split("x")
	var width = to_i(size[0])
	var height = to_i(size[1])
	var window = get_window()
	window.size = Vector2i(width, height)
	if window.mode != Window.MODE_FULLSCREEN:
		window.position = window_centoring_position(window.size, DisplayServer.screen_get_size())

func _on_screen_type_item_selected(index):
	var window = get_window()
	print(window.size)
	match index:
		MODE_FULL_SCREEN:
			window.mode = Window.MODE_FULLSCREEN
		MODE_WINDOW:
			window.mode = Window.MODE_WINDOWED
			window.position = window_centoring_position(window.size, DisplayServer.screen_get_size())
			window.borderless = false
		MODE_BORDER_LESS:
			window.mode = Window.MODE_WINDOWED
			window.position = window_centoring_position(window.size, DisplayServer.screen_get_size())
			window.borderless = true
