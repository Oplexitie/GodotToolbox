extends Node2D

@export var map: String
@export var viewport_path: NodePath
@export var ui_layer_path: NodePath

func _ready() -> void:
	_initialize_game()

func _initialize_game() -> void:
	ThreadLoad.viewport = get_node(viewport_path)
	ThreadLoad.ui_layer = get_node(ui_layer_path)
	ThreadLoad.load_scene(map)
