extends KinematicBody2D

var player = null
#var move = Vector2D().ZERO
const WALK_SPEED = 100

func _physics_process(delta):
	# enemy movement toward player
	if Global.player != null : 
		var direction = global_position.direction_to(Global.player.global_position).normalized()
		move_and_slide(direction * WALK_SPEED )
	
	# when  enemy collided with player, player dies 
	for i in get_slide_count():
		var impact = get_slide_collision(i)
		var obj = impact.collider
		if obj.is_in_group("player"):
			obj.die()


func _on_Timer_timeout():
	pass # Replace with function body.
