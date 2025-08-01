extends Node3D


var image:Image
var resolution:int = 64

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	image = Image.create_empty(resolution,resolution,false,Image.FORMAT_L8);
	image.fill(Color(1.0,1.0,1.0,1.0))
	updateTexture();


func updateTexture() ->void:
	var texture = ImageTexture.create_from_image(image)
	$MeshInstance3D.get_material_override().set_shader_parameter("paintTexture", texture)


func WorldToGrid(world_position:Vector3) -> Vector2i:
	var vec2pos = Vector2(world_position.x, world_position.z)
	vec2pos += Vector2(1,1)
	vec2pos *= 0.5
	return Vector2i(vec2pos.x*resolution, vec2pos.y*resolution)

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	print("here")
	if event is InputEventMouseButton or event is InputEventMouseMotion:
		print("ici")
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			print("okay")
			image.set_pixelv(WorldToGrid(event_position), Color(0.0,0.0,0.0,0.0))
			updateTexture()
