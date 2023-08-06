extends MiniGame

@onready var buttons = [$TextureButton, $TextureButton2, $TextureButton3, $TextureButton4, $TextureButton5]
var true_queue = []
var current_queue = []

func _ready():
	
	while true_queue.size() != 5:
		var rb = buttons.pick_random()
		if !true_queue.has(rb):
			true_queue.append(rb)
	Audio.change_current_music(Audio.AUDIO.MINIGAME_MUSIC)

func _on_texture_button_toggled(button_pressed):
	current_queue.append(buttons[0])
	update_queue()


func _on_texture_button_2_toggled(button_pressed):
	current_queue.append(buttons[1])
	update_queue()


func _on_texture_button_3_toggled(button_pressed):
	current_queue.append(buttons[2])
	update_queue()


func _on_texture_button_4_toggled(button_pressed):
	current_queue.append(buttons[3])
	update_queue()


func _on_texture_button_5_toggled(button_pressed):
	current_queue.append(buttons[4])
	update_queue()


func update_queue():
	for i in range(current_queue.size()):
		if current_queue[i] != true_queue[i]:
			current_queue.clear()
			for button in buttons:
				button.button_pressed = false
			
			print(current_queue)
			return
			
	minigame_ended.emit()
