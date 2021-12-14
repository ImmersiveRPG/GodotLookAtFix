# Copyright (c) 2021 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
# This file is licensed under the MIT License
# https://github.com/ImmersiveRPG/GodotLookAtFix

extends MeshInstance

func _process(delta : float) -> void:
	self.rotation.y += delta * 2.0
