# Copyright (c) 2022 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/GodotLookAtFix

extends Control

# See Transform::set_look_at for C++
# https://github.com/godotengine/godot/blob/3.4/core/math/transform.cpp#L78

func safe_look_at(spatial : Spatial, target: Vector3) -> void:
	var origin : Vector3 = spatial.global_transform.origin
	var v_z := (origin - target).normalized()

	# Just return if at same position
	if origin == target:
		return

	# Find the up vector that is non parallel to
	for up in [Vector3.RIGHT, Vector3.UP, Vector3.BACK]:
		var v_x : Vector3 = up.cross(v_z).normalized()
		if v_x.length() != 0:
			spatial.look_at(target, up)
			return

func _on_Button_pressed() -> void:
	var cube = $Background/ViewportContainer/Viewport/SceneA/Cube
	var arrow = $Background/ViewportContainer/Viewport/SceneA/Arrow
	arrow.look_at(cube.global_transform.origin, Vector3.RIGHT)


func _on_Button2_pressed() -> void:
	var cube = $Background/ViewportContainer/Viewport/SceneA/Cube
	var arrow = $Background/ViewportContainer/Viewport/SceneA/Arrow
	safe_look_at(arrow, cube.global_transform.origin)