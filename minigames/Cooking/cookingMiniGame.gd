extends MiniGame

var score: int

var food = load("res://minigames/Cooking/food/food.tscn")

@onready var timer: Timer = get_node("Timer")

func _ready():
	Audio.change_current_music(Audio.AUDIO.MINIGAME_MUSIC)

func _on_timer_timeout():
	var new_food = food.instantiate()
	add_child(new_food)
	new_food.global_position = Vector2(randi_range(80, 1070), 0)

func _on_area_2d_body_entered(body):
	if body is MiniGameFood:
		if body.is_bad:
			score -= body.cost
		else:
			score += body.cost
		update_score_label()
		
		var particle = load("res://minigames/Cooking/food/foodParticle.tscn").instantiate()
		add_child(particle)
		particle.global_position = body.global_position
		particle.emitting = true
		body.queue_free()

func update_score_label():
	$Label.text = "score: " + str(score)

func _process(delta):
	if Global.thunder_time:
		if timer.time_left >= timer.wait_time/2:
			
			minigame_ended.emit()

func _on_timer1_timeout():
	pass # Replace with function body.
