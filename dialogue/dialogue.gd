extends CanvasLayer

class_name Dialogue

@onready var label: RichTextLabel = get_node("Control/label")
@onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

@export var minigame_action: Global.MINIGAMES
@export var text_speed: float = 0.02
@export var dialogue_pages: Array[String]
var current_page = 0

signal dialogue_ended
signal page_changed

func _ready():
	Audio.noise.seed = randi()
	
	animation_player.play("show")
	await animation_player.animation_finished
	
	update_text()
	text_animation()
	page_changed.connect(text_animation)

func next_page():
	if label.visible_characters != label.text.length():
		label.visible_characters = label.text.length()
		return
	set_current_page((current_page+1) % dialogue_pages.size())
	page_changed.emit()

func text_animation():
	for c in range(label.text.length()+1):
		await get_tree().create_timer(text_speed).timeout
		if label.visible_characters == label.text.length():
			break
		label.visible_characters = c
		Audio.play_char_audio(c)

func set_current_page(value):
	current_page = value
	if !current_page:
		animation_player.play("hide")
		await animation_player.animation_finished
		dialogue_ended.emit()
		play_minigame()
		queue_free()
		return
	update_text()

func play_minigame() -> void:
	Global.transition_to(Global.TRANSITION_TYPES.MINI_GAME, minigame_action)

func update_text():
	label.text = dialogue_pages[current_page]
	label.visible_characters = 0

func _on_texture_button_pressed():
	next_page()
