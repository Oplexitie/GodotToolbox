extends FileData

const SETTINGS_PATH: String = "res://settings.cfg"

func save_file() -> int:
	var file: ConfigFile = ConfigFile.new()
	for section in file_data.keys():
		for key in file_data[section]:
			file.set_value(section,key,file_data[section][key])
	
	return file.save(SETTINGS_PATH)

func load_file() -> int:
	var file: ConfigFile = ConfigFile.new()
	var err: Error = file.load(SETTINGS_PATH)
	if err: return err
	
	for section in file.get_sections():
		for data in file.get_section_keys(section):
			var loaded_data: Dictionary = { data: file.get_value(section,data) }
			set_element(section, loaded_data)
	
	return OK
