extends Node

var viewport: SubViewport
var ui_layer: CanvasLayer

@onready var loading_screen: PackedScene = preload("uid://do86s6ymhylia") 
@onready var maps: Resource = preload("uid://b0r4osq14yuut")

func load_scene(next_scene: String) -> void:
	_erase_contents(ui_layer) # Deletes the previous scene inside the viewport
	_erase_contents(viewport) # Deletes the previous scene inside the viewport or UI from previous scene
	
	# Add loading scene to the Menu Layer
	var loading_scene_instance: Control = loading_screen.instantiate()
	ui_layer.call_deferred("add_child",loading_scene_instance)
	
	ResourceLoader.load_threaded_request(maps.locations[next_scene], "", true)
	
	var progress: Array = []
	while true:
		match ResourceLoader.load_threaded_get_status(maps.locations[next_scene], progress):
			0:
				print("ERROR, invalid scene !")
				return
			1:
				# Section for loading progress bar
				pass
			2:
				print("ERROR, loading failed for some reason !")
				return
			3:
				var scene: Node = ResourceLoader.load_threaded_get(maps.locations[next_scene]).instantiate()
				
				# Remove loading screen
				if loading_scene_instance:
					loading_scene_instance.queue_free()
				
				viewport.call_deferred("add_child", scene)
				
				return

func load_ui(new_ui: PackedScene) -> void:
	if new_ui:
		var ui_pack: Control = new_ui.instantiate()
		ui_layer.call_deferred("add_child", ui_pack)

func _erase_contents(parent: Node) -> void:
	for i in parent.get_children():
		i.queue_free()
