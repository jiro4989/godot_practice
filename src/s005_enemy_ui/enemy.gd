extends Node2D

export (String) var enemy_name
export (int) var mhp
var hp = 0

onready var name_label = $name_label
onready var hp_label = $hp_label

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
