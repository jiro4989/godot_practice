extends Control

@onready var text = $Panel/MarginContainer/Text
var duration: float = 0.05

var texts = [
	"最初のメッセージ。",
	"２つ目のメッセージ。",
	"３つ目のメッセージ。",
	"４つ目のメッセージ。",
	"５つ目のメッセージ。",
	"最後のメッセージ",
]

var text_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_pressed():
	print("_on_next_pressed")
	if len(texts) <= text_index:
		return
	print("append text")
	var additional_text = texts[text_index]
	# 明示的に float にしないと、整数÷整数が 0 になってしまう
	var before_text_length: float = text.text.length()
	var after_text_length: float = (text.text + additional_text).length()
	# すでに途中まで描画されているテキストは表示された状態から、１文字ずつ描画する必要がある。
	# 現在の表示状況をセットしてから、awaitで徐々に文字を描画する。
	var current_ratio: float = before_text_length / after_text_length
	# テキストをセットしてから、visible_ratioをセットしないといけない
	text.text += additional_text
	text.visible_ratio = current_ratio
	display_message()
	text_index += 1
	
func display_message():
	text.visible_ratio += 1.0 / text.text.length() 
	await get_tree().create_timer(duration).timeout
	if text.visible_ratio < 1: 
		display_message()


func _on_init_text_pressed():
	text.text = ""
	text.visible_ratio = 0.0
	text_index = 0


func _on_duration_0_05_pressed():
	duration = 0.05

func _on_duration_0_25_pressed():
	duration = 0.25

func _on_duration_0_50_pressed():
	duration = 0.50

func _on_duration_0_01_pressed():
	duration = 0.01
