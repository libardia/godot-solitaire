class_name Card
extends Node2D


@export var initial_value: StringName = CardValues.ACE_SPADE
@export var initial_clickable: bool = true
@export var initial_face_up: bool = true

@onready var card_face: Sprite2D = $CardFace
@onready var card_back: Sprite2D = $CardBack
@onready var click_area: Area2D = $ClickArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var clickable: bool = true:
    set(x):
        click_area.monitorable = x
    get():
        return click_area.monitorable

var face_up: bool
var value: StringName
var rank: StringName
var suit: StringName


func _ready():
    card_back.texture = CardGraphics.global_card_back
    face_up = initial_face_up
    clickable = initial_clickable
    value = initial_value
    var rs := CardValues.value_to_rs(value)
    rank = rs[0]
    suit = rs[1]
    card_face.texture = CardGraphics.value_to_graphic(value)


func set_face_up(face_up_value: bool, animate: bool = true):
    if animate:
        if face_up and not face_up_value:
            animation_player.play(&"flip_face_down")
        elif not face_up and face_up_value:
            animation_player.play(&"flip_face_up")
    else:
        card_face.visible = face_up_value
        card_back.visible = not face_up_value
    face_up = face_up_value
