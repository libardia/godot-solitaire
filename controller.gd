extends Node


@onready var click_point: Area2D = $ClickPoint


func _ready():
    click_point.interact_empty.connect(on_interact_empty)
    click_point.interact_object.connect(on_interact)
    click_point.auto_move.connect(on_auto_move)


func on_interact_empty():
    print("clicked on nothing")


func on_interact(clicked: Node2D):
    print("clicked on ", clicked)


func on_auto_move(clicked: Node2D):
    print("try to auto move ", clicked)
