extends Node


@onready var holding: Holding = $"../Holding"
@onready var stock: Pile = $"../Stock"


func on_interact_empty():
    print("clicked empty")
    holding.drop()


func on_interact(clicked: Node2D):
    print("clicked ", clicked)
    if clicked is Deck:
        var drawn: Array[Card] = clicked.draw_cards(3)
        for c in drawn:
            c.set_face_up(true)
        stock.add_cards(drawn)
    if clicked is Card:
        pass


func on_auto_move(clicked: Node2D):
    print("auto request on ", clicked)
