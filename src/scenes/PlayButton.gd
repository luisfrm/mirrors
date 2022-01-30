extends Button

func _on_PlayButton_pressed():
	get_parent().get_node("SoundPlay").play()
	get_tree().change_scene("res://src/scenes/firstLevel.tscn")
