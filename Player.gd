extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const acceleration = 40
const maxSpeed = 400
const jump = 350
const gravity = 400

var velocity = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("player_right"):
		if(velocity.x < maxSpeed):
			velocity.x += acceleration
	elif Input.is_action_pressed("player_left"):
		if(velocity.x > -maxSpeed):
			velocity.x -= acceleration
	else:
		velocity.x = round(velocity.x / 1.5)
		
	if(abs(velocity.x) < 5):
		velocity.x = 0

	print(velocity.x)
	
	velocity.y += gravity * delta
	if Input.is_action_pressed("player_jump") and is_on_floor():
		velocity.y -= jump
	
	move_and_slide(velocity, Vector2.UP)
	
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
