extends Node2D
class_name SceneSetup

@export var ui_pack: PackedScene

func _ready() -> void:
	ThreadLoad.load_ui(ui_pack)
