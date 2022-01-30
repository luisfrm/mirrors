extends StaticBody2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	body.die()

func die():
	pass
