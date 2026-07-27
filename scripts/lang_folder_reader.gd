extends Node


func _ready() -> void:
	get_content_of_dir("C:/Program Files (x86)/Steam/steamapps/common/Pizza Tower/lang")


func get_content_of_dir(dir : String) -> PackedStringArray:
	var paths : PackedStringArray
	
	for file in DirAccess.get_files_at(dir):
		paths.append(dir + "/" + file)
		print(dir + "/" + file)
	
	
	
	return paths
