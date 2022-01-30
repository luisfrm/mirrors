extends KinematicBody2D

var speed = 3
var counter = 0
export var moveX = 1

func _ready():
	$AnimatedSprite.flip_h = false
	

func _physics_process(delta):
	var move = Vector2()
	move.x += moveX
	move = move.normalized() * speed
	move = move_and_collide(move)
	counter += 1
	if counter == 100:
		counter = 0
		moveX *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
