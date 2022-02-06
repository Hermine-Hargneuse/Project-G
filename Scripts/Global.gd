extends Node
# Singleton!!

var node_creation_parent = null

#var player = load("res://Scene/Player.tscn")
#onready var player : Player = $Player
#onready var bullet = $Bullet
var player = null
var bullet_manager = null

func instance_node(node, location, parent):
		var node_instance = node.instance()
		parent.add_child(node_instance)
		node_instance.global_position = location
		return node_instance

