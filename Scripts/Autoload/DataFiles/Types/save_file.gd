extends FileData

const SAVE_PATH: String = "res://save.sav"
const ENCRYPT_KEY: String = "abcd1234"

func save_file() -> void:
	var file: FileAccess = FileAccess.open_encrypted_with_pass(SAVE_PATH, FileAccess.WRITE, ENCRYPT_KEY)
	if file == null:
		printerr(FileAccess.get_open_error())
		return
	
	file.store_var(file_data)
	file.close()

func load_file() -> void:
	if has_file(SAVE_PATH):
		var file: FileAccess = FileAccess.open_encrypted_with_pass(SAVE_PATH, FileAccess.READ, ENCRYPT_KEY)
		if file == null:
			printerr(FileAccess.get_open_error())
			return
		
		var data: Dictionary = file.get_var()
		file.close()
		
		if (data is Dictionary):
			file_data = data
		else:
			printerr("Save data is corrupted")
	else:
		printerr("No save file available")
