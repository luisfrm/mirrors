extends KinematicBody2D

func _ready():
	pass
	
func die():
	pass

func _on_playerDetector_body_entered(body):
	body.die()
