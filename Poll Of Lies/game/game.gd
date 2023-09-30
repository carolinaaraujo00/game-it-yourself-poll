extends Node

var hover_left_post : bool = false
var hover_right_post : bool = false

@onready var _left_post = $MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/LeftPost
@onready var _right_post = $MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/RightPost

const true_images = [
	preload("res://game/posts/true/me_2.jpg"),
	preload("res://game/posts/true/stanley.png")
]

const fake_images = [
	preload("res://game/posts/false/gamedev.png"),
	preload("res://game/posts/false/me.jpg")
]

func assign_random_image():
	var texture1 = true_images[randi() % true_images.size()]
	var texture2 = fake_images[randi() % fake_images.size()]
	
	_left_post.texture = (texture1)
	_right_post.texture = (texture2)


# Called when the node enters the scene tree for the first time.
func _ready():
	assign_random_image()


func _input(event):
	if event is InputEventMouseButton && event.is_action_released("mouse_click"):
		assign_random_image()


# Check if either the mouse is on top of the left or right post
func _on_left_post_mouse_entered():
	hover_left_post = true


func _on_left_post_mouse_exited():
	hover_left_post = false


func _on_right_post_mouse_entered():
	hover_right_post = true


func _on_right_post_mouse_exited():
	hover_right_post = false
