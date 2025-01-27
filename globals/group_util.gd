extends Node


func get_group(group_name: StringName) -> Array[Node]:
    return get_tree().get_nodes_in_group(group_name)


func get_first_node_in_group(group_name: StringName) -> Node:
    return get_tree().get_first_node_in_group(group_name)


func get_singleton_group(group_name: StringName) -> Node:
    return get_first_node_in_group(group_name)
