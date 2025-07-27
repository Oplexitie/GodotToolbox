extends FileData

const SAVE_PATH: String = "res://save.sav"
const ENCRYPT_KEY: String = "abcd1234"

func save_file() -> int:
	var file: FileAccess = FileAccess.open_encrypted_with_pass(SAVE_PATH, FileAccess.WRITE, ENCRYPT_KEY)
	if not file: return FileAccess.get_open_error()
	
	file.store_var(file_data)
	return file.get_error()

func load_file() -> int:
	if not has_file(SAVE_PATH):
		return ERR_FILE_NOT_FOUND
	
	var file: FileAccess = FileAccess.open_encrypted_with_pass(SAVE_PATH, FileAccess.READ, ENCRYPT_KEY)
	if not file: return FileAccess.get_open_error()
	
	var data: Variant = file.get_var()
	if data is not Dictionary: return ERR_FILE_CORRUPT
	
	file_data = data
	return file.get_error()
