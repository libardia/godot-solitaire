class_name Pile
extends Node2D


@export var initial_placement_spot_texture: Texture2D = preload("res://img/cards/placeAnything.png")
@export var face_up_offset := Vector2.ZERO
@export var face_down_offset := Vector2.ZERO
@export var spread := -1

@onready var placement_spot: Sprite2D = $PlacementSpot

var cards: Array[Card] = []
var move_in_progress: Array[Card] = []


func _ready():
     placement_spot.texture = initial_placement_spot_texture


func add_cards(new_cards: Array[Card], animate: bool = true):
    for card in new_cards:
        card.reparent(placement_spot)
        card.part_of = self
    cards.append_array(new_cards)
    spread_cards(animate)


func begin_move(starting_from: Card) -> Array[Card]:
    var i := cards.find(starting_from)
    move_in_progress = cards.slice(i)
    cards = cards.slice(0, i)
    for card in move_in_progress:
        TweenUtil.reparent_to_root(card)
    return move_in_progress


func cancel_move(animate: bool = true):
    if not move_in_progress.is_empty():
        for card in move_in_progress:
            card.reparent(placement_spot)
        cards.append_array(move_in_progress)
        move_in_progress = []
        spread_cards(animate)


func finish_move(animate: bool = true):
    if not move_in_progress.is_empty():
        move_in_progress = []
        if not cards.is_empty():
            (cards.back() as Card).set_face_up(true, animate)
            spread_cards(animate)


func spread_cards(animate: bool = true):
    var thresh := 0
    if spread > 0:
        # Only calculate a threshold if spread is 1 or more, otherwise leave
        # threshold as 0 (meaning no limit on spread)
        thresh = clampi(cards.size() - spread, 0, cards.size() - 1)
    for i in thresh:
        #print("set to zero: ", i)
        var card := cards[i]
        card.clickable = false
        TweenUtil.card_tween_or_set(card, Vector2.ZERO, animate)
    var total_offset := Vector2.ZERO
    for i in range(thresh, cards.size()):
        #print("set with offset ", total_offset, ": ", i)
        var card := cards[i]
        card.clickable = card.face_up
        TweenUtil.card_tween_or_set(card, total_offset, animate)
        total_offset += face_up_offset if card.face_up else face_down_offset
