class_name SceneSetup
extends Node

@export var ui_pack: PackedScene

func _ready() -> void:
	ThreadLoad.load_ui(ui_pack)
