extends Node2D
class_name FileData

var file_data: Dictionary

func _ready() -> void:
	load_file()

func has_file(file_path: String) -> bool:
	return FileAccess.file_exists(file_path)

func has_element(element: String) -> bool:
	return file_data.has(element) 

func set_element(element: String, data: Dictionary) -> void:
	if file_data.has(element):
		file_data[element].merge(data, true)
	else:
		file_data[element] = data

func get_element(element: String, data: String) -> Variant:
	if file_data.has(element) and file_data[element].has(data):
		return file_data[element][data]
	else:
		return null

func save_file() -> void:
	pass

func load_file() -> void:
	pass
