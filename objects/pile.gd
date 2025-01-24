class_name Pile
extends Node2D


@export var initial_placement_spot_texture: Texture2D = preload("res://img/cards/placeAnything.png")
@export var face_up_offset := Vector2.ZERO
@export var face_down_offset := Vector2.ZERO
@export_range(1, 100, 1, "or_greater") var spread := 1

@onready var placement_spot: Sprite2D = $PlacementSpot

var cards: Array[Card] = []


func _ready():
     placement_spot.texture = initial_placement_spot_texture


func add_cards(new_cards: Array[Card], animate = true):
    for card in new_cards:
        card.reparent(placement_spot)
        card.part_of = self
    cards.append_array(new_cards)
    spread_cards(animate)


func begin_move(starting_from: Card, animate = true) -> Array[Card]:
    var picked_up: Array[Card] = cards.slice(cards.find(starting_from))
    return picked_up


func spread_cards(animate = true):
    var thresh := clampi(cards.size() - spread, 0, cards.size() - 1)
    #print("thresh = ", thresh)
    for i in thresh:
        #print("set to zero: ", i)
        var card := cards[i]
        card.clickable = false
        TweenUtil.card_tween_or_set(card, Vector2.ZERO, animate)
    var total_offset := Vector2.ZERO
    for i in range(thresh, cards.size()):
        #print("set with offset ", total_offset, ": ", i)
        var card := cards[i]
        card.clickable = true
        TweenUtil.card_tween_or_set(card, total_offset, animate)
        total_offset += face_up_offset if card.face_up else face_down_offset
