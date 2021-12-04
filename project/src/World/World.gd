# Copyright (c) 2021 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/GodotLookAtFix

extends Spatial


func _ready() -> void:
	pass
	#if can_look_at_without_error(_spat.global_transform.origin, v, Vector3.UP):
	#	_spat.look_at(v, Vector3.UP)
