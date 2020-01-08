import UIKit

//used to communicate with other controller with delegate
protocol AddTask {
	func addTask(name:String, description:String)
	func updateTask(name:String, description:String, indexPath: IndexPath)
}

// Controller for AddTask View for adding and editing tasks
class AddTaskController: UIViewController {
	
	@IBOutlet weak var nameLabel: UITextField!
	@IBOutlet weak var descriptionText: UITextField!
	@IBOutlet weak var submitButton: UIButton!
	
	var delegate: AddTask?
	
	// for editing take existing task
	var oldTask: Task?
	// index for editing as well
	var indexPath: IndexPath?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		// if oldTask exists (was sent through editing), populate text fields
		if let oldTask = oldTask{
			nameLabel.text = oldTask.name
			descriptionText.text = oldTask.description
			
			// change button from Add to Update
			submitButton.setTitle("Update", for: UIControl.State.normal)
		}
		
    }
	

	// Add button event
	@IBAction func addAction(_ sender: Any) {
		
		//if not empty then add
		if nameLabel.text != ""{
			// if check whether it was edited value or updating an old task
			if let oldTask = oldTask{
				// update
				if let indexPath = indexPath{
					delegate?.updateTask(name: nameLabel.text!, description: descriptionText.text!, indexPath: indexPath)
				}
			}else{
				// create new
				delegate?.addTask(name: nameLabel.text!, description: descriptionText.text!)
			}
			//onclick return same as pressing the back button
			navigationController?.popViewController(animated: true)
		}else{
			// do some message to show error
			
		}
		

	}
	

}
