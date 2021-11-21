extends KinematicBody2D

var speed = 150	
var velocity = Vector2()

func _ready():
	Global.player = self
	
func _exit_tree():
	Global.player = null
	
func _process(delta):
	velocity.x=  int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y=  int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))

	global_position += speed * velocity * delta
	
func die():
	queue_free()
