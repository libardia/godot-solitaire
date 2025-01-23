extends Node2D


var card_scene: PackedScene = preload("res://objects/card.tscn")
var cards: Array[Card]


func _ready():
    var values := CardValues.ALL_VALUES.duplicate()
    values.shuffle()
    for value in values:
        var card: Card = card_scene.instantiate() as Card
        card.initial_value = value
        card.initial_face_up = false
        card.initial_clickable = false
        card.name = "Card_" + value
        cards.append(card)
        add_child(card)
