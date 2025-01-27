extends Node


var vp: Viewport


func _ready():
    vp = get_viewport()


func size() -> Vector2:
    return vp.get_visible_rect().size


func h_size() -> Vector2:
    return size() * 0.5


func width() -> float:
    return size().x


func h_width() -> float:
    return width() * 0.5


func height() -> float:
    return size().y


func h_height() -> float:
    return height() * 0.5
