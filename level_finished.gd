extends CanvasLayer

export var levelName = "level_1.tscn"

func _ready():
	pass

func _on_changeSceneButton_pressed():
	get_tree().change_scene("res://src/scenes/" + levelName)
