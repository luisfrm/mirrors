extends KinematicBody2D

var speed = 2
var counter = 0
export var moveX = 1
export var isQuiet = false

func _ready():
	if moveX > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

func _on_playerDetector_body_entered(body):
	if body.has_method("die"):
		body.die()

func _physics_process(delta):
	if isQuiet:
		return
	var move = Vector2()
	move.x += moveX
	move = move.normalized() * speed
	move = move_and_collide(move)
	counter += 1
	if counter == 100:
		counter = 0
		moveX *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
