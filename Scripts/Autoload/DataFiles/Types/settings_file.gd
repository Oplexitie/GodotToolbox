extends FileData

const SETTINGS_PATH: String = "res://settings.cfg"

func save_file() -> void:
	var file: ConfigFile = ConfigFile.new()
	for section in file_data.keys():
		for key in file_data[section]:
			file.set_value(section,key,file_data[section][key])
	file.save(SETTINGS_PATH)

func load_file() -> void:
	if has_file(SETTINGS_PATH):
		var file: ConfigFile = ConfigFile.new()
		var err: Error = file.load(SETTINGS_PATH)
		
		if err != OK:
			printerr("An issue has been encountered -> Config Error: {0}".format([err]))
			return
		
		for section in file_data.keys():
			for key in file_data[section]:
				file_data[section][key] = file.get_value(section,key)
	else:
		printerr("No config file available")
