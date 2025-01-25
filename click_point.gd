extends Node2D


signal interact_empty
signal interact_object(clicked: Node2D)
signal auto_move(clicked: Node2D)

@onready var click_point_area: Area2D = $ClickPointArea


func _process(_delta):
    global_position = get_viewport().get_mouse_position()


func _unhandled_input(event: InputEvent):
    if event.is_action_pressed(&"card-interact"):
        var clicked_on: Array[Node2D] = get_clicked(click_point_area.get_overlapping_areas())
        if clicked_on.is_empty():
            interact_empty.emit()
        else:
            var interacted_object: Node2D = decide_click(clicked_on)
            interact_object.emit(interacted_object)
            get_viewport().set_input_as_handled()
    elif event.is_action_pressed(&"card-auto"):
        var clicked_on: Array[Node2D] = get_clicked(click_point_area.get_overlapping_areas())
        if not clicked_on.is_empty():
            var interacted_object: Node2D = decide_click(clicked_on)
            auto_move.emit(interacted_object)
            get_viewport().set_input_as_handled()


func get_clicked(areas: Array[Area2D]) -> Array[Node2D]:
    var parents: Array[Node2D] = []
    parents.resize(areas.size())
    for i in areas.size():
        parents[i] = areas[i].get_parent()
    return parents


func decide_click(clicked_on: Array[Node2D]) -> Node2D:
    #print("all clicked: ", clicked_on)
    var latest_node: Node2D = null
    for node in clicked_on:
        if not latest_node:
            latest_node = node
        elif node.is_greater_than(latest_node):
            latest_node = node
    return latest_node
