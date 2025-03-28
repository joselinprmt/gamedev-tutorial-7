extends CharacterBody3D

@export var speed: float = 10.0
@export var acceleration: float = 5.0
@export var gravity: float = 9.8
@export var jump_power: float = 5.0
@export var mouse_sensitivity: float = 0.3
@export var sprint_speed: float = 18.0
@export var sprint_acceleration: float = 8.0
@export var crouch_speed: float = 3.0
@export var crouch_height: float = 1.0
@export var standing_height: float = 2.0

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var pcap: CollisionShape3D = $CollisionShape3D

var camera_x_rotation: float = 0.0
var is_sprinting: bool = false
var is_crouching: bool = false


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		camera_x_rotation = clamp(camera_x_rotation + x_delta, -90.0, 90.0)
		camera.rotation_degrees.x = -camera_x_rotation

func _physics_process(delta):
	var movement_vector = Vector3.ZERO

	if Input.is_action_pressed("movement_forward"):
		movement_vector -= head.basis.z
	if Input.is_action_pressed("movement_backward"):
		movement_vector += head.basis.z
	if Input.is_action_pressed("movement_left"):
		movement_vector -= head.basis.x
	if Input.is_action_pressed("movement_right"):
		movement_vector += head.basis.x

	movement_vector = movement_vector.normalized()

	# Cek apakah tombol sprint ditekan
	if Input.is_action_pressed("sprint"):
		is_sprinting = true
	else:
		is_sprinting = false
		
	# Cek apakah tombol crouch ditekan
	if Input.is_action_pressed("crouch"):
		is_crouching = true
		pcap.shape.height -= crouch_speed * delta
	else:
		is_crouching = false
		pcap.shape.height += crouch_speed * delta
		
	pcap.shape.height = clamp(pcap.shape.height, crouch_height, standing_height)

	# Gunakan kecepatan berdasarkan kondisi (sprint, crouch, normal)
	var current_speed = (
		crouch_speed if is_crouching else
		sprint_speed if is_sprinting else
		speed
	)
	var current_acceleration = sprint_acceleration if is_sprinting else acceleration

	velocity.x = lerp(velocity.x, movement_vector.x * current_speed, current_acceleration * delta)
	velocity.z = lerp(velocity.z, movement_vector.z * current_speed, current_acceleration * delta)

	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

	move_and_slide()
