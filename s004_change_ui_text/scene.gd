extends Node2D

var text_index = 0
var texts = [
	"hello world",
	"hello world world",
	"sushi kuitai",
	"test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test",
	"FIN"
]

# 別ノードを参照するときはonreadyを使う
onready var text_label = $background/text_area/text

func _ready():
	pass # Replace with function body.

func _process(delta):
	text_label.text = texts[text_index]

func _on_next_button_pressed():
	if text_index < texts.size() - 1:
		text_index += 1


func _on_back_to_top_pressed():
	get_tree().change_scene("res://Top.tscn")
