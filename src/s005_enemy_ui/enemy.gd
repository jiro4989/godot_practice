extends Node2D

signal add_damage

export (String) var enemy_name
export (int) var mhp
var hp = 0

onready var name_label = $NameLabel
onready var hp_label = $HPLabel

func _ready():
	hp = mhp
	name_label.text = enemy_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hp_label.text = str(hp) + " / " + str(mhp)

func add_damage(damage):
	var point = hp - damage
	if point < 0:
		point = 0
	hp = point


func _on_Node2D_add_damage():
	print("got damage")
	add_damage(5)
