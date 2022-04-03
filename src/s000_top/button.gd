extends Node

# ボタンのラベル
export (String) var label
# ボタンをクリックしたときの遷移先のシーンパスを指定する
export (String) var scene_path
onready var button = $Button

func _ready():
	button.text = label

func _on_Button_pressed():
	get_tree().change_scene(scene_path)
