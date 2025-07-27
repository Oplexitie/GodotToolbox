extends VBoxContainer

@export var is_saving: bool
@export var is_loading: bool

func _ready() -> void:
	_save_data()
	_load_data(SaveFile.load_file())
	_load_data(SettingsFile.load_file())
	_print_data(SaveFile.file_data)
	_print_data(SettingsFile.file_data)

func _save_data() -> void:
	if not is_saving: return
	
	SaveFile.set_element("Section_1",{"Key_1":5})
	SaveFile.set_element("Section_1",{"Key_2":false})
	SaveFile.set_element("Section_2",{"Key_3":Vector2(10,0)})
	SettingsFile.set_element("Section_1",{"Key_1":10})
	SettingsFile.set_element("Section_1",{"Key_2":true})
	SettingsFile.set_element("Section_2",{"Key_3":Vector2(0,5)})
	
	SaveFile.save_file()
	SettingsFile.save_file()

func _load_data(load_error: int) -> void:
	if not is_loading: return
	
	if load_error != OK:
		printerr("An issue has been encountered -> Error: ", load_error)

func _print_data(data: Dictionary) -> void:
	if is_loading: print(data)
