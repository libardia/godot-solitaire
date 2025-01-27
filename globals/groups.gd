extends Node


const REF := &"reference_sprite"
const DECK := &"deck"
const STOCK := &"stock"
const HOLDING := &"holding"
const PILE := &"pile"
const HOME := &"home"


func get_reference_sprite() -> Sprite2D:
    return GroupUtil.get_singleton_group(REF) as Sprite2D


func get_deck() -> Deck:
    return GroupUtil.get_singleton_group(DECK) as Deck


func get_holding() -> Holding:
    return GroupUtil.get_singleton_group(HOLDING) as Holding


func get_stock() -> Pile:
    return GroupUtil.get_singleton_group(STOCK) as Pile


func get_piles() -> Array[Pile]:
    return _group_to_piles(GroupUtil.get_group(PILE))


func get_homes() -> Array[Pile]:
    return _group_to_piles(GroupUtil.get_group(HOME))


func _group_to_piles(group: Array[Node]) -> Array[Pile]:
    var result: Array[Pile] = []
    result.resize(group.size())
    for i in group.size():
        result[i] = group[i] as Pile
    return result
