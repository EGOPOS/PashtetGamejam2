extends Node

enum TRANSITION_TYPES{MINI_GAME, LOCATION, CUTSCENE, MONOLOGUE}

enum LOCATIONS{HOME, HOUSE, ENTRANCE}

var locations_paths = {
	LOCATIONS.HOME: load("res://apartments/Home.tscn"),
	LOCATIONS.HOUSE: load("res://house.tscn"),
	LOCATIONS.ENTRANCE: load("res://entrance.tscn")
}

enum MONOLOGUES {PLANT, PHONE, BOXES, WARDROBE, KITCHEN}

var monologue_paths = {
	MONOLOGUES.PLANT: load("res://dialogue/plantMonologue.tscn"),
	MONOLOGUES.PHONE: load("res://dialogue/phoneMonologue.tscn"),
	MONOLOGUES.BOXES: load("res://dialogue/boxMonologue.tscn"),
	MONOLOGUES.WARDROBE: load("res://dialogue/wardrobeMonologue.tscn"),
	MONOLOGUES.KITCHEN: load("res://dialogue/kitchenMonologue.tscn")
}

enum MINIGAMES {COOKING, POWER_ENABLING}

var minigames_paths = {
	MINIGAMES.COOKING: load(""),
	MINIGAMES.POWER_ENABLING: load("")
}

var thunder_time = false

func transition_to(type: TRANSITION_TYPES, action: int):
	match type:
		TRANSITION_TYPES.LOCATION:
			get_tree().change_scene_to_packed(locations_paths[action])

		TRANSITION_TYPES.CUTSCENE:
			pass
		
		TRANSITION_TYPES.MINI_GAME:
			MinigameManager.start_minigame(minigames_paths[action])
			
		TRANSITION_TYPES.MONOLOGUE:
			for c in get_tree().current_scene.get_children():
				if c is Dialogue:
					if c.animation_player.current_animation != "hide":
						c.animation_player.play("hide")
			get_tree().current_scene.add_child(monologue_paths[action].instantiate())

func thunder_event():
	pass
