class_name EntitySkin
extends Sprite2D

var current_state: String

@onready var animation_tree: AnimationTree = $AnimationTree

func set_animation_state(state: String) -> void:
	if state != current_state:
		current_state = state
		animation_tree.set("parameters/Transition/transition_request", current_state)

func set_animation_speed(value: float) -> void:
	animation_tree.set("parameters/TimeScale/scale", value)
