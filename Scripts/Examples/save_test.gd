extends VBoxContainer

@export var is_saving: bool
@export var is_loading: bool

func _ready() -> void:
	_save_data()
	_load_data(SaveFile)
	_load_data(SettingsFile)

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

func _load_data(data_type: FileData) -> void:
	if not is_loading: return
	
	var load_status: int = data_type.load_file()
	if load_status == OK:
		print(data_type.file_data)
	else:
		printerr("An issue has been encountered -> Error: ", load_status)
