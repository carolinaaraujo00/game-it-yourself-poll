extends TextureRect

var _is_post_true : bool
@onready var _self = $"."

# when click check if is hovering 
# check if is the true one -> update score 

func assign_image(new_texture : Texture2D, new_bool : bool):
	_self.texture = new_texture
	_is_post_true = new_bool
