@abstract
class_name FileData
extends Node

var file_data: Dictionary[String,Dictionary]

func _ready() -> void:
	load_file()

func has_file(file_path: String) -> bool:
	return FileAccess.file_exists(file_path)

func has_element(element: String) -> bool:
	return file_data.has(element)

func has_element_data(element: String, data: String) -> bool:
	return file_data.has(element) and file_data[element].has(data)

func set_element(element: String, data: Dictionary) -> void:
	if has_element(element):
		file_data[element].merge(data, true)
	else:
		file_data[element] = data

func get_element(element: String, data: String) -> Variant:
	if has_element_data(element,data):
		return file_data[element][data]
	else:
		return null

func save_file() -> int:
	return ERR_BUG

func load_file() -> int:
	return ERR_BUG
