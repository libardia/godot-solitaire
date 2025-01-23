class_name Holding
extends Node2D


@onready var grab_point: Node2D = $GrabPoint


func _process(_delta):
    global_position = get_viewport().get_mouse_position()


func pick_up(cards: Array[Card]):
    for card: Card in cards:
        card.reparent(grab_point)
        card.position = Vector2.ZERO
        card.clickable = false


func drop():
    for card: Card in grab_point.get_children():
        card.reparent(get_tree().current_scene)
        card.clickable = true
