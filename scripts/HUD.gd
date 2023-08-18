extends Control

func _on_camera_2d_item_rect_changed():
	set_size(get_viewport_rect().size)
