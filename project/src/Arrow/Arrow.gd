# Copyright (c) 2022 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/GodotLookAtFix

extends Spatial


func _process(delta : float) -> void:
	self.rotation.z += delta * 2.0
