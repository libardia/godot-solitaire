class_name Deck
extends Node2D


signal deck_clicked(deck: Deck)

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
        card.name = "Card_" + value
        cards.append(card)
        placement_spot.add_child(card)
    deck_clicked.connect(Controller.on_click_deck)


func _unhandled_input(event: InputEvent):
    if event.is_action_pressed(Inputs.INTERACT):
        if placement_spot.get_rect().has_point(to_local(event.position)):
            get_viewport().set_input_as_handled()
            deck_clicked.emit(self)


func is_empty() -> bool:
    return cards.is_empty()


func draw_cards(n: int = 1) -> Array[Card]:
    var drawn: Array[Card] = []
    for i in clampi(n, 0, cards.size()):
        var card: Card = cards.pop_front()
        card.clickable = true
        TweenUtil.reparent_to_root(card)
        drawn.append(card)
    return drawn


func add_cards(new_cards: Array[Card], animate: bool = true):
    for card in new_cards:
        card.set_face_up(false, animate)
        card.clickable = false
        card.part_of = null
        card.reparent(placement_spot)
        TweenUtil.card_tween_or_set(card, Vector2.ZERO, animate)
    cards.append_array(new_cards)
