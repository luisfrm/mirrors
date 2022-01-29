extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite

var velocity: Vector2 = Vector2(0.0,0.0)
var coins = 0
export(float) var flip = 1.0

export(float) var time_to_peak = 0.6 # seconds
export(float) var jump_height = 64.0 # pixels

onready var gravity = flip * (2.0*jump_height / pow(time_to_peak, 2.0))
onready var jump_speed = -gravity * time_to_peak 
onready var vectorFloor = Vector2.DOWN * Vector2(1.0, flip)
onready var vectorJump = Vector2.UP * Vector2(1.0, flip)

onready var floor_checker = $Check

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("gravity ", gravity)
	print("Jump ", jump_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up") and (is_on_floor()):
		velocity.y = jump_speed
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

func add_coin():
	coins += 1
	print("Coins:", coins)
