extends Node


func on_interact_empty():
    print("clicked on nothing")


func on_interact(clicked: Node2D):
    print("clicked on ", clicked)
    if clicked is Card:
        var card := clicked as Card
        card.set_face_up(not card.face_up)


func on_auto_move(clicked: Node2D):
    print("try to auto move ", clicked)
