extends Dialogue

func _ready():
	Audio.noise.seed = randi()
	
	animation_player.play("show")
	await animation_player.animation_finished
	
	update_text()
	text_animation()
	page_changed.connect(text_animation)
