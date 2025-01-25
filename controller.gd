extends Node


@onready var holding: Holding = $"../Holding"
@onready var stock: Pile = $"../Stock"


func on_interact_empty():
    print("clicked empty")
    if not holding.is_empty():
        holding.drop()


func on_interact(clicked: Node2D):
    print("clicked ", clicked)
    if clicked is Card:
        if holding.is_empty():
            var picked_up: Array[Card] = clicked.part_of.begin_move(clicked)
            holding.pick_up(picked_up)
        else:
            holding.put(clicked.part_of)

    elif clicked is Deck and holding.is_empty():
        var drawn: Array[Card] = clicked.draw_cards(3)
        for c in drawn:
            c.set_face_up(true)
        stock.add_cards(drawn)

    elif clicked is Pile and not holding.is_empty():
        holding.put(clicked)


func on_auto_move(clicked: Node2D):
    print("auto request on ", clicked)
