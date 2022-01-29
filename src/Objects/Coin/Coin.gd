extends Node2D

signal coin_collected

onready var _animated_sprite = $AnimatedSprite

func _on_coin_body_entered(body):
	_animated_sprite.animation = "collected"
	emit_signal("coin_collected")


func _on_AnimatedSprite_animation_finished():
	if _animated_sprite.animation == "collected":
		queue_free()
