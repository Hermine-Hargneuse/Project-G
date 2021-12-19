extends Node
# Singleton!!

var node_creation_parent = null


onready var player = $Player
func instance_node(node, location, parent):
		var node_instance = node.instance()
		parent.add_child(node_instance)
		node_instance.global_position = location
		print('---')
		print(node)
		print(location)
		print(parent)
		print('---')
		return node_instance

