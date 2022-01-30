extends CanvasLayer

func _ready():
	pass

func _on_tryAgain_Button_pressed():
	get_tree().reload_current_scene()
