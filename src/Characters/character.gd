extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite

var velocity: Vector2 = Vector2(0.0,0.0)
var vectorFloor = Vector2.DOWN
var vectorJump = Vector2.UP
export var gravity = 500.0
export var moveY = -500.0

onready var floor_checker = $Check

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or is_on_ceiling()):
		velocity.y = moveY
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.animation = "run"
		_animated_sprite.flip_h = false
		velocity.x = 300.0
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.animation = "run"
		_animated_sprite.flip_h = true
		velocity.x = -300.0
	else:
		_animated_sprite.animation = "idle"
		velocity.x = 0.0
		
	
func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide_with_snap(velocity, vectorFloor, vectorJump)
