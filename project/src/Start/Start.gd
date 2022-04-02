# Copyright (c) 2022 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/GodotLookAtFix

extends Control

onready var cube = $Background/ViewportContainer/Viewport/SceneA/Cube
onready var arrow = $Background/ViewportContainer/Viewport/SceneA/Arrow

func safe_look_at(spatial : Spatial, target: Vector3) -> void:
	var origin : Vector3 = spatial.global_transform.origin
	var v_z := (origin - target).normalized()

	# Just return if at same position
	if origin == target:
		return

	# Find an up vector that we can rotate around
	var up := Vector3.ZERO
	for entry in [Vector3.RIGHT, Vector3.UP, Vector3.BACK]:
		var v_x : Vector3 = entry.cross(v_z).normalized()
		if v_x.length() != 0:
			up = entry

	# Look at the target
	if up != Vector3.ZERO:
		spatial.look_at(target, up)

func _on_Button_pressed() -> void:
	arrow.look_at(cube.global_transform.origin, Vector3.RIGHT)


func _on_Button2_pressed() -> void:
	safe_look_at(arrow, cube.global_transform.origin)
