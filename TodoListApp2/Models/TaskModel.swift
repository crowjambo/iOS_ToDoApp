import Foundation

class Task{
	var name = ""
	var description = ""
	var checked = false
	
	convenience init(name: String, description:String) {
		self.init()
		self.name = name
		self.description = description
	}
	
}
