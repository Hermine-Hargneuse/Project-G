extends KinematicBody2D

#var player = null
#var move = Vector2D().ZERO
const WALK_SPEED = 100
onready var health_stat = $Health


func handle_hit():
	health_stat.health -= 10
	if health_stat.health <= 0:
		queue_free()


func _physics_process(delta):

	if Global.player != null : 
	#if player != null : 
		var direction = global_position.direction_to(Global.player.global_position).normalized()
		move_and_slide(direction * WALK_SPEED )
<<<<<<< Updated upstream
		#print('moving')
	else :
		print('Player doesnt exist')
=======
>>>>>>> Stashed changes
	
	# when  enemy collided with player, player dies 
	for i in get_slide_count():
		var impact = get_slide_collision(i)
		#var obj = impact.collidera
		#if obj.is_in_group("player"):
			#obj.die()
			


func _on_Timer_timeout():
	pass # Replace with function body.
