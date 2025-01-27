extends Node


@export var row_spacing := 0.0

@onready var deck: Deck = Groups.get_deck()
@onready var holding: Holding = Groups.get_holding()
@onready var stock: Pile = Groups.get_stock()
@onready var piles: Array[Pile] = Groups.get_piles()
@onready var homes: Array[Pile] = Groups.get_homes()
@onready var ref_size: Vector2 = Groups.get_reference_sprite().get_rect().size
@onready var h_ref_size: Vector2 = ref_size * 0.5
@onready var top_row: Array[Node2D] = [
    deck, stock, null,
    homes[0], homes[1], homes[2], homes[3]
]

const N_PILES := 7


func _ready():
    get_viewport().size_changed.connect(place_piles)
    place_piles()
    deal()


func _unhandled_input(event: InputEvent):
    if event.is_action_pressed(Inputs.INTERACT) or event.is_action_pressed(Inputs.AUTO_MOVE):
        if event.button_index in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT]:
            get_viewport().set_input_as_handled()
            on_click_empty()


func place_piles():
    var sep := (Screen.width() - N_PILES * ref_size.x) / (N_PILES + 1)
    var start := Vector2(sep + h_ref_size.x, row_spacing + h_ref_size.y)
    var row_offset := Vector2.DOWN * (row_spacing + ref_size.y)
    var col_offset := Vector2.RIGHT * (sep + ref_size.x)
    for i in N_PILES:
        var top := top_row[i]
        var bottom := piles[i]
        if top: top.position = start + i * col_offset
        bottom.position = start + row_offset + i * col_offset


func deal():
    pass


func on_click_empty():
    print("clicked empty")
    if not holding.is_empty():
        holding.drop()


func on_click_card(c_card: Card):
    print("clicked card: ", c_card)
    if holding.is_empty():
        var picked_up: Array[Card] = c_card.part_of.begin_move(c_card)
        holding.pick_up(picked_up)
    else:
        holding.put(c_card.part_of)


func on_rclick_card(c_card: Card):
    print("right clicked card: ", c_card)


func on_click_deck(c_deck: Deck):
    print("clicked deck: ", c_deck)
    if holding.is_empty():
        var drawn: Array[Card] = c_deck.draw_cards(3)
        for c in drawn:
            c.set_face_up(true)
        stock.add_cards(drawn)


func on_click_pile(c_pile: Pile):
    print("clicked pile: ", c_pile)
    holding.put(c_pile)
