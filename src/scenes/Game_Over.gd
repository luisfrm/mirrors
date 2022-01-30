extends CanvasLayer

func _ready():
	pass

func _on_tryAgain_Button_pressed():
	get_tree().reload_current_scene()

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
