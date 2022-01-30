extends Control


func _ready():
	MusicController.play_music()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://src/scenes/Level_1.tscn")
