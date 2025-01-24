class_name Holding
extends Node2D


@export var offset := Vector2.ZERO

@onready var grab_point: Node2D = $GrabPoint

var cards: Array[Card] = []


func _process(_delta):
    global_position = get_viewport().get_mouse_position()


func is_empty() -> bool:
    return cards.is_empty()


func pick_up(source_pile: Pile, new_cards: Array[Card], animate = true):
    for card in new_cards:
        card.reparent(grab_point)
        card.clickable = false
    cards = new_cards
    spread_cards(animate)


func drop(animate = true):
    for card in cards:
        TweenUtil.kill_tween(card)
        TweenUtil.reparent_to_root(card)
        card.clickable = true
    cards = []


func spread_cards(animate = true):
    for i in cards.size():
        TweenUtil.card_tween_or_set(cards[i], offset * i, animate)
