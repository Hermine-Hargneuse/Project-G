extends Node

var enemy_One = preload("res://Scene/Enemy/Enemy_one.tscn")
var enemy_Two = preload("res://Scene/Enemy/Enemy_two.tscn")
var enemy_Three = preload("res://Scene/Enemy/Enemy_three.tscn")
var player = preload("res://Scene/Player.tscn")
var map = preload("res://Scene/Map.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.node_creation_parent = self
	#player spawn
	Global.instance_node(map, Vector2(580,300), self)
	Global.instance_node(player, Vector2(580,300), self)

func _exit_tree():
	Global.node_creation_parent = null


func _on_Enemy_spawn_timer_timeout():
	# Might need to recheck the numbers
	var enemy_position = Vector2(rand_range(-150, 700), rand_range(-100, 400))
	
	var enemies = [enemy_One, enemy_Two, enemy_Three]
	#Need to change this, Numbers are approximated and while loop might not be the best way to do it
	while enemy_position.x < 640 and enemy_position.x> -80 and enemy_position.y <360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	#Temp spawn of multiple enemies
	randomize()
	var rand_index: int = randi() % enemies.size()
	Global.instance_node(enemies[rand_index], enemy_position, self)

