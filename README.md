# GodotLookAtFix


# How to get around the dreaded look_at() failed error

```GDScript
# Before:
arrow.look_at(cube.global_transform.origin, Vector3.UP)

# After:
safe_look_at(arrow, cube.global_transform.origin)

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
```

# See Godot Transform source code for more info:
```sh
# See Transform::set_look_at for C++
# https://github.com/godotengine/godot/blob/3.4/core/math/transform.cpp#L78
```
