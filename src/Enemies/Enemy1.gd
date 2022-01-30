extends KinematicBody2D

var speed = 2
var contador = 0
var moveX = 1

func _ready():
	$AnimatedSprite.flip_h = true
	
func die():
	pass

func _on_playerDetector_body_entered(body):
	body.die()

func _physics_process(delta):
	var move = Vector2()
	move.x += moveX
	move = move.normalized() * speed
	move = move_and_collide(move)
	contador += 1
	if contador == 100:
		contador = 0
		moveX *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
