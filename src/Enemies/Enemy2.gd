extends KinematicBody2D

onready var BULLET_SCENE = preload("res://src/Enemies/Bullet.tscn")
var player = null
var move = Vector2.ZERO
var speed = 1

func _ready():
	pass

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO

	move = move.normalized()
	move = move_and_collide(move)

func _on_detectPlayer_body_entered(body):
	if body != self:
		player = body
	print(body)


func _on_detectPlayer_body_exited(body):
	player = null
	print("player exited")
	
func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)


func _on_Timer_timeout():
	if player != null:
		fire()
