extends InteraciveObject

@export var action: Global.LOCATIONS
@export var action_type: Global.TRANSITION_TYPES

func interact():
	Global.transition_to(action_type, action)
