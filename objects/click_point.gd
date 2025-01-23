extends Area2D


signal interact_empty
signal interact_object(clicked: Node2D)
signal auto_move(clicked: Node2D)


func _physics_process(_delta):
    position = get_viewport().get_mouse_position()


func _unhandled_input(event: InputEvent):
    if event.is_action_pressed(&"card-interact"):
        var areas := get_overlapping_areas()
        if areas.is_empty():
            interact_empty.emit()
        else:
            var interacted_object: Node2D = get_latest_in_tree(areas).get_parent()
            interact_object.emit(interacted_object)
            get_viewport().set_input_as_handled()
    elif event.is_action_pressed(&"card-auto"):
        var areas := get_overlapping_areas()
        if not areas.is_empty():
            var interacted_object: Node2D = get_latest_in_tree(areas).get_parent()
            auto_move.emit(interacted_object)
            get_viewport().set_input_as_handled()


func get_latest_in_tree(areas: Array[Area2D]) -> Area2D:
    var last_in_tree: Area2D = null
    for area: Area2D in areas:
        if not last_in_tree:
            last_in_tree = area
        elif area.is_greater_than(last_in_tree):
            last_in_tree = area
    return last_in_tree