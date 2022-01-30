extends KinematicBody2D

onready var BULLET_SCENE = preload("res://src/Enemies/Bullet.tscn")
var player = null
var move = Vector2.ZERO
var speed = 70
export var characterName = "character"

func _ready():
	pass

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO

	move = move
	move = move_and_slide(move)

func _on_detectPlayer_body_entered(body):
		if (body == get_parent().get_node(characterName)):
			player = body

func _on_detectPlayer_body_exited(body):
	player = null
	
func fire():
	if player:
		var bullet = BULLET_SCENE.instance()
		bullet.player = player
		bullet.position = get_global_position()
		get_parent().add_child(bullet)


func _on_Timer_timeout():
	fire()
