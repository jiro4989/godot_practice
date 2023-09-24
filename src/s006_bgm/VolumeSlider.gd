extends HSlider

@export var bus_name: String
var bus_index: int

# Called when the node enters the scene tree for the first time.
func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	# 値が変更されるのをトリガーに値を更新する
	value_changed.connect(_on_value_changed)
	
	# 初期化時にスライダーに反映する
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
