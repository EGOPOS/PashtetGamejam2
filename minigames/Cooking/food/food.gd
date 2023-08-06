extends RigidBody2D

class_name MiniGameFood

var is_bad: bool = false
var cost: int

var bad_food = [20, 3, 4, 5, 22]
var good_food = [23, 24, 32, 34, 39]

func _ready():
	var team = randi_range(0,1)
	is_bad = !team
	cost = 20 if is_bad else 10
	var array = good_food if team else bad_food
	$Sprite2D.frame = array.pick_random()
