extends Node


signal lang_dir_selected
var langs_paths


func _ready() -> void:
	if DirAccess.dir_exists_absolute("C:/Program Files (x86)/Steam/steamapps/common/Pizza Tower/lang"):
		langs_paths = get_content_of_dir("C:/Program Files (x86)/Steam/steamapps/common/Pizza Tower/lang")
		lang_dir_selected.emit()
	elif DirAccess.get_directories_at("C:/Program Files/Steam/steamapps/common/Pizza Tower/lang"):
		langs_paths = get_content_of_dir("C:/Program Files/Steam/steamapps/common/Pizza Tower/lang")
		lang_dir_selected.emit()
	else:
		var dialog := FileDialog.new()
		dialog.access = FileDialog.ACCESS_FILESYSTEM
		dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
		dialog.popup()
		dialog.dir_selected.connect(_get_dialog_dir)


func  _get_dialog_dir(dir : String):
	langs_paths = get_content_of_dir(dir)
	lang_dir_selected.emit()


func get_content_of_dir(dir : String) -> PackedStringArray:
	var paths : PackedStringArray
	
	for file in DirAccess.get_files_at(dir):
		paths.append(dir + "/" + file)
	
	for directory in DirAccess.get_directories_at(dir):
		for file in DirAccess.get_files_at(dir + "/" + directory):
			paths.append(dir + "/" + directory + "/" + file)
	
	return paths
