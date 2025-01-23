extends Node


@onready var holding: Holding = $"../Holding"


func on_interact_empty():
    holding.drop()


func on_interact(clicked: Node2D):
    print("clicked ", clicked)
    if clicked is Card:
        var card := clicked as Card
        holding.pick_up([card])


func on_auto_move(clicked: Node2D):
    pass
