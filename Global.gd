extends Node

enum TRANSITION_TYPES{MINI_GAME, LOCATION, CUTSCENE}

func transition_to(type: TRANSITION_TYPES, scene: PackedScene):
	match type:
		TRANSITION_TYPES.LOCATION:
			pass
		
		TRANSITION_TYPES.CUTSCENE:
			pass
		
		TRANSITION_TYPES.MINI_GAME:
			pass
