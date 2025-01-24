class_name Deck
extends Node2D


@onready var placement_spot: Sprite2D = $PlacementSpot

var card_scene: PackedScene = preload("res://objects/card.tscn")
var cards: Array[Card]


func _ready():
    var values := CardValues.ALL_VALUES.duplicate()
    values.shuffle()
    for value in values:
        var card := card_scene.instantiate() as Card
        card.initial_value = value
        card.initial_face_up = false
        card.initial_clickable = false
        card.part_of = self
        card.name = "Card_" + value
        cards.append(card)
        placement_spot.add_child(card)


func draw_cards(n: int = 1) -> Array[Card]:
    var drawn: Array[Card] = []
    for i in n:
        var card: Card = cards.pop_front()
        card.part_of = null
        card.clickable = true
        TweenUtil.reparent_to_root(card)
        drawn.append(card)
    return drawn
