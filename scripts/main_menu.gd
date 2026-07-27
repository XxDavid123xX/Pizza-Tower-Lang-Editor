extends TabContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LangFolderReader.lang_dir_selected.connect(_on_lang_dir_selected)


func _on_lang_dir_selected():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
