extends Node

# ボタンのラベル
@export var label: String
# ボタンをクリックしたときの遷移先のシーンパスを指定する
@export var scene_path: String

@onready var button = $Button

func _ready():
	button.text = label

func _on_Button_pressed():
	get_tree().change_scene_to_file(scene_path)
