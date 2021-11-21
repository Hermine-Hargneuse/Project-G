extends KinematicBody2D


var player = null
#var move = Vector2D().ZERO
const WALK_SPEED = 100

func _physics_process(delta):
	if player != null : 
		var direction = position.direction_to(player.position).normalized()
		move_and_slide(direction * WALK_SPEED)


func _on_Area2D_body_entered(body):
	if body != self:
		player = body


func _on_Area2D_body_exited(body):
	player = null


func _on_Timer_timeout():
	pass # Replace with function body.
