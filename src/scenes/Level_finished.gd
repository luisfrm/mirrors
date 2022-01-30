extends CanvasLayer

export var levelName = "Level_2.tscn"

func _ready():
	pass


func _on_changeSceneButton_pressed():
	get_tree().change_scene("res://src/scenes/" + levelName)
