extends Sprite2D
class_name PawnSkin

@export var animation_states: Dictionary[String,int]

var current_state: int

@onready var animation_tree: AnimationTree = $AnimationTree

func set_animation_state(state: int) -> void:
	if state != current_state:
		current_state = state
		animation_tree.set("parameters/Transition/transition_request", current_state)

func set_animation_speed(value: float) -> void:
	animation_tree.set("parameters/TimeScale/scale", value)
