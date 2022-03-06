extends Node2D

var enemy_One = "res://Scene/Enemy/Enemy_one.tscn"
var enemy_Two = "res://Scene/Enemy/Enemy_two.tscn"
var enemy_Three = "res://Scene/Enemy/Enemy_three.tscn"

#what wave we are on and sub wave each enemy will spawn from and the max limits of wave
var currentWave = 0
var sub_wave = 0 # current sub wave (wave in a wave)
export (int) var wave_limit

#set positions of spawn position through position 2D ingame
export (Array, NodePath) var spawn_position

#list of all the enemies with spawn rates
var enemies = [enemy_One, enemy_Two, enemy_Three] #different scene enemy
var enemy_rate = [0.25, 0.50, 1.0] # rate of spawning for each enemy type

# Nb of enemies in a sub wave
export(Array, Array, int) var enemy_count # array : index represents wave, index of sub arrray represents sub waves, each subwaves contains nb of enemy
# Type of enemies
export(Array, Array, int) var enemy_type # array : index represents wave, index of sub arrray represents sub waves, each subwaves contains type of enemy (need to correspond to enemy_count)

#Will get the value of enemy counter from the array
var enemy_amount = null

func spawn_wave():
	#$Spawn_Delay.stop()
	$Wave_timer.stop()
	print('Spawn wave')
	print("current wave")
	print(currentWave)
	if currentWave != wave_limit: 
		enemy_amount = enemy_count[currentWave][sub_wave]
		
		#set spawn rate to enemy rate via enemy type
		#$Spawn_Rate.wait_time = enemy_rate[enemy_type[currentWave][sub_wave]]
		#$Spawn_Rate.start()	
		$Enemy_spawn_timer.wait_time = enemy_rate[enemy_type[currentWave][sub_wave]]
		$Enemy_spawn_timer.start()
			
	else:
		Victory()
		
func _on_Enemy_spawn_timer_timeout():
	print('Enemy spawn timer')
	if enemy_amount>= 1: #Spawn enemy if enemy amount still higher than 0
		print('enemy spawned')
		spawn_enemy()
		enemy_amount -= 1
	elif enemy_amount <= 0 :#if not higher than 0
		print('next subwave')
		sub_wave += 1 #Increase subwave
		print(sub_wave)
		
		if sub_wave <= enemy_count[currentWave].size() -1:#check if sub wave reach max size, if not then set enemy amount
			enemy_amount = enemy_count[currentWave][sub_wave]
			
			print('Number of enemy in current subwave')
			print(enemy_amount)
		elif sub_wave >= enemy_count[currentWave].size() -1 :# else stop rate of enemies and start delay for next wave
			$Enemy_spawn_timer.stop()
			$Wave_timer.start()
			sub_wave = 0
			print('subwave end')
				
			
func _on_Wave_timer_timeout():
	print('New wave')
	currentWave += 1
	print(currentWave)
	spawn_wave()


func _on_Wave_start_pressed():
	print('Button Next wave pressed!!!')
	spawn_wave()
	
func spawn_enemy():
	print('Enemy gettting spawned')
	var enemy = load(enemies[enemy_type[currentWave][sub_wave]]) # load selected enemy from enemy type array
	
	randomize() #rand spawning of enemie
	var spawn_point = randi() % spawn_position.size() # retrieve all spawn point 
	
	var sp = get_node(str("Spawning_Position/spawn_0" + String(spawn_point))) # get int trhought string
	
	print('enemy instance, sp position, self')
	print(sp)
	print(sp.position)
	print(self)
	Global.instance_node(enemy, sp.position, get_owner())
	print('Instance of enemy')
func Victory():
		print("Victory")
func Defeat():
		print('Defeat')





