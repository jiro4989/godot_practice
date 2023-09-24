extends Button

# ボタンのラベル
@export var label: String
# ボタンをクリックしたときの遷移先のシーンパスを指定する
@export var scene_path: String

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	get_tree().change_scene_to_file(scene_path)
