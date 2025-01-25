class_name Holding
extends Node2D


@export var offset := Vector2.ZERO

@onready var grab_point: Node2D = $GrabPoint

var holding_source: Pile
var cards: Array[Card] = []


func _process(_delta):
    global_position = get_viewport().get_mouse_position()


func is_empty() -> bool:
    return cards.is_empty()


func pick_up(new_cards: Array[Card], animate: bool = true):
    if not new_cards.is_empty():
        for card in new_cards:
            card.reparent(grab_point)
            card.clickable = false
        cards = new_cards
        holding_source = cards[0].part_of
        spread_cards(animate)


func put(new_pile: Pile, animate: bool = true):
    holding_source.finish_move(animate)
    new_pile.add_cards(cards, animate)
    holding_source = null
    cards = []


func drop(animate: bool = true):
    if not is_empty():
        for card in cards:
            TweenUtil.reparent_to_root(card)
        holding_source.cancel_move(animate)
        cards = []


func spread_cards(animate: bool = true):
    for i in cards.size():
        TweenUtil.card_tween_or_set(cards[i], offset * i, animate)
