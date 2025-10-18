class_name SceneSetup
extends Node2D

@export var ui_pack: PackedScene

func _ready() -> void:
	ThreadLoad.load_ui(ui_pack)
