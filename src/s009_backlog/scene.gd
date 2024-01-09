extends Node2D

@onready var backlog = $BacklogArea/ScrollContainer/BacklogContainer
const Log = preload("res://src/s009_backlog/log.tscn")

var backlog_items = [
	{
		"img": "face_1",
		"name": "子供",
		"conversation": "こんにちは",
	},
	{
		"img": "face_2",
		"name": "大人",
		"conversation": "こんばんは",
	},
	{
		"img": "face_1",
		"name": "子供",
		"conversation": "はじめまして",
	},
	{
		"img": "face_2",
		"name": "大人",
		"conversation": "さようなら",
	},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_backlog_button_pressed():
	for item in backlog_items:
		var child = Log.instantiate()
		child.initialize(item["img"], item["name"], item["conversation"])
		backlog.add_child(child)
