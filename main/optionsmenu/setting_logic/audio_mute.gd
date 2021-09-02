extends Node
# value: bool
#	Whether the bus is muted or not.
# bus_name: String
#	The name of the bus that'll be affected


func main(value: Dictionary) -> void:
	var bus_index1: int = AudioServer.get_bus_index(value["bus_name1"])
	AudioServer.set_bus_mute(bus_index1, value["value"])
	var bus_index2: int = AudioServer.get_bus_index(value["bus_name2"])
	AudioServer.set_bus_mute(bus_index2, value["value"])
