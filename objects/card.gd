class_name Card
extends Node2D


signal card_clicked(card: Card)
signal card_rclicked(card: Card)

@export var initial_value: StringName = CardValues.ACE_SPADE
@export var initial_clickable: bool = true
@export var initial_face_up: bool = true

@onready var card_face: Sprite2D = $CardFace
@onready var card_back: Sprite2D = $CardBack
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var clickable: bool
var face_up: bool
var value: StringName
var rank: StringName
var suit: StringName
var part_of: Pile


func _ready():
    set_face_up(initial_face_up, false)
    card_back.texture = CardGraphics.global_card_back
    clickable = initial_clickable
    value = initial_value
    var rs := CardValues.value_to_rs(value)
    rank = rs[0]
    suit = rs[1]
    card_face.texture = CardGraphics.value_to_graphic(value)
    card_clicked.connect(Controller.on_click_card)
    card_rclicked.connect(Controller.on_rclick_card)


func _unhandled_input(event: InputEvent):
    if event.is_action_pressed(Inputs.INTERACT) and clickable:
        if card_face.get_rect().has_point(to_local(event.position)):
            get_viewport().set_input_as_handled()
            card_clicked.emit(self)
    elif event.is_action_pressed(Inputs.AUTO_MOVE) and clickable:
        if card_face.get_rect().has_point(to_local(event.position)):
            get_viewport().set_input_as_handled()
            card_rclicked.emit(self)


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
