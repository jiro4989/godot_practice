extends Node2D

onready var counter = 0
onready var label = $Label

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = str(counter)

func _on_Button_pressed():
	counter += 1
	label.text = str(counter)
