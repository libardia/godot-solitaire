extends Node


func _unhandled_key_input(event: InputEvent):
    var ke := event as InputEventKey
    if ke.is_pressed() and ke.keycode == KEY_ESCAPE:
        get_tree().quit()
        get_viewport().set_input_as_handled()
