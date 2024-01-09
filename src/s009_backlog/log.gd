extends Control

@onready var ui_face_image: Sprite2D = $ColorRect/Control/FaceImage
@onready var ui_name = $ColorRect/VBoxContainer/Name
@onready var ui_conversation = $ColorRect/VBoxContainer/Conversation

var input_img_basename: String
var input_actor_name: String
var input_conversation: String

func _ready():
	var img = Image.load_from_file("res://src/s009_backlog/" + input_img_basename + ".png")
	var tex = ImageTexture.create_from_image(img)
	ui_face_image.texture = tex
	ui_name.text = input_actor_name
	ui_conversation.text = input_conversation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initialize(img_basename: String, actor_name: String, conv: String):
	input_img_basename = img_basename
	input_actor_name = actor_name
	input_conversation = conv
