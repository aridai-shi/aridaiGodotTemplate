extends Node
# value: int
#	Index of the color in 'background_color' array


func main(value: Dictionary) -> void:
	Global.cur_bg_col = Global.background_colors[value["value"]]
