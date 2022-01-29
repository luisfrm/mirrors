extends KinematicBody2D

var velocity: Vector2 = Vector2(0.0,0.0)
export var gravity = 500.0
export var moveY = -500.0

onready var floor_checker = $Check

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or is_on_ceiling()):
		velocity.y = moveY
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = 300.0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -300.0
	else:
		velocity.x = 0.0
		
	
func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
