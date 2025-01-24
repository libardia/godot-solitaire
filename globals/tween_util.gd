extends Node


const CARD_MOVE_TWEEN_DURATION: float = 0.2

var all_tweens: Dictionary = {}


func card_move_tween(target: Node2D, end_position: Vector2, duration: float = CARD_MOVE_TWEEN_DURATION) -> Tween:
    var t: Tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
    t.tween_property(target, "position", end_position, duration)
    target.z_index = 1

    # Kill any tween already running on this target
    if all_tweens.has(target):
        all_tweens[target].kill()

    # Record new tween
    all_tweens[target] = t
    t.tween_callback(func ():
        all_tweens.erase(target)
        target.z_index = 0
    )

    return t


func card_move_tween_global(target: Node2D, end_position: Vector2, duration: float = CARD_MOVE_TWEEN_DURATION) -> Tween:
    var t: Tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
    t.tween_property(target, "global_position", end_position, duration)

    # Kill any tween already running on this target
    kill_tween(target)

    # Make new tween
    all_tweens[target] = t
    t.tween_callback(func ():
        all_tweens.erase(target)
    )

    return t


func card_tween_or_set(target: Node2D, position: Vector2, tween: bool = true):
    if tween:
        card_move_tween(target, position)
    else:
        target.position = position


func card_tween_or_set_global(target: Node2D, position: Vector2, tween: bool = true):
    if tween:
        card_move_tween_global(target, position)
    else:
        target.global_position = position


func kill_tween(target: Node2D):
    if all_tweens.has(target):
        all_tweens[target].kill()
        all_tweens.erase(target)



func reparent_to_root(node: Node):
    node.reparent(get_tree().current_scene)
