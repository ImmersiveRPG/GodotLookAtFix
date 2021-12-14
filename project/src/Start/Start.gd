# Copyright (c) 2021 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/GodotLookAtFix

extends Control


# Check if look_at can run without failing
# See Transform::set_look_at for C++
# https://github.com/godotengine/godot/blob/3.4/core/math/transform.cpp#L78
# https://github.com/godotengine/godot/blob/master/core/math/basis.cpp#L1057
func can_look_at_without_error(origin : Vector3, target : Vector3, up : Vector3) -> bool:
	# Will fail if origin and target are the same
	if origin == target:
		return false

	# Will fail if up is zero
	if up.length() == 0:
		return false

	# Will fail if origin and target are parallel to each other
	var v_z := (origin - target).normalized()
	var v_y := up
	var v_x := v_y.cross(v_z)
	if v_x.length() == 0:
		return false

	return true

# look_at_from_position: Node origin and target are in the same position, look_at() failed.
# look_at_from_position: Up vector and direction between node origin and target are aligned, look_at() failed.
# look_at_from_position: Up vector and direction between node origin and target are aligned, look_at() failed.

func _on_Button_pressed() -> void:
	var cube = $Background/ViewportContainer/Viewport/SceneA/Cube
	var arrow = $Background/ViewportContainer/Viewport/SceneA/Arrow
	#arrow.look_at(cube.global_transform.origin, Vector3.RIGHT)
	# FAILS with Vector3.UP as up
	# Works with Vector3.RIGHT
	arrow.look_at(cube.global_transform.origin, Vector3.UP)


func _on_Button2_pressed() -> void:
	pass
	#var cube = $Background/ViewportContainer/Viewport/Cube
	#var arrow = $Background/ViewportContainer/Viewport/Arrow
	#arrow.look_at(cube.global_transform.origin, Vector3.UP)
