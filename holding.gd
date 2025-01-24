class_name Holding
extends Node2D


@export var offset := Vector2.ZERO

@onready var grab_point: Node2D = $GrabPoint

var cards: Array[Card] = []


func _process(_delta):
    global_position = get_viewport().get_mouse_position()


func is_empty() -> bool:
    return cards.is_empty()


func pick_up(new_cards: Array[Card], animate: bool = true):
    for card in new_cards:
        card.reparent(grab_point)
        card.clickable = false
    cards = new_cards
    spread_cards(animate)


func drop(animate: bool = true):
    if not is_empty():
        for card in cards:
            TweenUtil.reparent_to_root(card)
        (cards.front() as Card).part_of.cancel_move(animate)
        cards = []


func spread_cards(animate: bool = true):
    for i in cards.size():
        TweenUtil.card_tween_or_set(cards[i], offset * i, animate)
