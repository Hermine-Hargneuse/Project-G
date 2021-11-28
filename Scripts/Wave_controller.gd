extends Node2D



var enemy_One = preload("res://Scene/Enemy/Enemy_one.tscn")
var enemy_Two = preload("res://Scene/Enemy/Enemy_two.tscn")
var enemy_Three = preload("res://Scene/Enemy/Enemy_three.tscn")

#what wave we are on and sub wave each enemy will spawn from and the max limits of wave
var wave = 0
var sub_wave = 0 
export (int) var wave_limit

#export (Array, NodePath) var spawn_position

#list of all the enemies with spawn rates
var enemies = [enemy_One, enemy_Two, enemy_Three] #differente scene enemy
var enemy_rate = [0.25, 0.50, 1.0]

# Nb of enemies in a sub wave
export(Array, Array, int) var enemy_count
# Type of enemies
export(Array, Array, int) var enemy_type

#Will get the value of enemy counter from the array
var enemy_amount = null

func spawn_wave():
	$Spawn_Delay.stop()
	
	if wave != wave_limit: 
			enemy_count = enemy_count[wave][sub_wave]
			
			#set spawn rate to enemy rate via enemy type
			$Spawn_Rate.wait_time = enemy_rate[enemy_type[wave][sub_wave]]
			$Spawn_Rate.start()
	else:
		Victory()
		


func _on_Spawn_Rate_timeout():
	if enemy_amount>= 1: #Spawn enemy if enemy amount still higher than 0
		spawn_enemy()
		enemy_amount -= 1
	elif enemy_amount <= 0 :#if not higher than 0
		sub_wave += 1 #Increase subwave
		
		if sub_wave <= enemy_count[wave].size() -1:#check if sub wave reach max size, if not then set enemy amount
			enemy_amount = enemy_count[wave][sub_wave]
		elif sub_wave >= enemy_count[wave].size() -1 :# else stop rate of enemies and start delay for next wave
			$Spawn_Rate.stop()
			$Spawn_Delay.start()
			sub_wave = 0
			
func _on_Spawn_Delay_timeout():
	 wave += 1
	 spawn_wave()

func _on_Wave_start_pressed():
	spawn_wave()
	
func spawn_enemy():
	var enemy = load(enemies[enemy_type][wave][sub_wave]) # load selected enemy from enemy type array
	var enemy_instance = enemy.instance()
	

	
	
func Victory():
		print("Victory")
func Defeat():
		print('Defeat')
