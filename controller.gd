extends Node


func on_interact_empty():
    pass


func on_interact(clicked: Node2D):
    if clicked is Card:
        var card := clicked as Card
        card.set_face_up(not card.face_up)


func on_auto_move(clicked: Node2D):
    pass
