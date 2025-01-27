extends Sprite2D


func _ready():
    get_viewport().size_changed.connect(cover)
    cover()


func cover():
    region_rect = Rect2(Vector2.ZERO, Screen.size())
