extends StaticBody2D


func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body == get_parent().get_node("Character"):
		body.die()

func die():
	pass
