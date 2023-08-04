extends CanvasLayer

class_name Dialogue

@onready var label: Label = get_node("Control/label")

@export var text_speed: float
@export var dialogue_pages: Array[String]
var current_page = 0

signal dialogue_ended
signal page_changed

func _ready():
	update_text()
	text_animation()
	page_changed.connect(set_current_page)

func next_page():
	set_current_page((current_page+1) % dialogue_pages.size())
	page_changed.emit()

func text_animation():
	for c in range(label.text.length()):
		await get_tree().create_timer(text_speed * 0.5).timeout
		label.visible_characters = c

func set_current_page(value):
	current_page = value
	if !current_page:
		dialogue_ended.emit()
		return
	update_text()

func update_text():
	label.text = dialogue_pages[current_page]
	label.visible_characters = 0
