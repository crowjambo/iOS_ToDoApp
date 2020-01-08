
//  ViewController.swift
//  TodoListApp2
//
//  Created by Evaldas on 1/7/20.
//  Copyright © 2020 Evaldas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
	
	//main collection (could be database or in another file)
	var tasks: [Task] = []
	
	//get tableView so we can call its reload method later for updating UI
	@IBOutlet weak var tableViewOutlet: UITableView!
	
	// default controller function
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	//main function for moving to another view
	override func prepare(for segue: UIStoryboardSegue, sender: Any?){
		// we set our destination view controller to be AddTaskController
		let vc = segue.destination as! AddTaskController
		
		// we connect current controller, to the destination controller using delegate
		// this way we can pass data back and forth
		vc.delegate = self
		
		switch segue.identifier {
			case "AddButton":
				print("add btn")
			// event from each task cell clicks
			case "EditButton":
				// get current task cell from sender
				guard let selectedTaskCell = sender as? TaskCell else{
					return
				}
				// using current sell, find it in the tableView object and get its index
				let indexPath = tableViewOutlet.indexPath(for: selectedTaskCell)
				// get the Task object at current index
				let selectedTask = tasks[indexPath!.row]
				// set AddTaskController oldTask variable to selected/sender task
				vc.oldTask = selectedTask
				// send it index of current item too, for clean edits
				vc.indexPath = indexPath

			default:
				print("default")
			
		}
		
	}

	//set custom values and init the cell (on each reload) (MAIN CELL CREATION FUNCTION)
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// inflate/create cells of a certain custom type using TodoCell identifier(place them there)
		let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TaskCell
		
		// set that new cell values
		cell.nameLabel.text = tasks[indexPath.row].name
		cell.descriptionlabel.text = tasks[indexPath.row].description
		
		if tasks[indexPath.row].checked{
			let image = UIImage(systemName: "checkmark")
			cell.checkBoxOutlet.setImage(image, for: UIControl.State.normal)
		} else{
			let image = UIImage(systemName: "square")
			cell.checkBoxOutlet.setImage(image, for: UIControl.State.normal)
		}
		
		//using protocols give reference to each cell to this view controller
		cell.delegate = self
		cell.indexP = indexPath.row
		
		// one cell is created
		return cell
	}
	
	//number of items in tableView (helper function for implementation of UITableView)
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	//table view delegate swipe to remove method (editing styles in general, can catch all of them here)
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
		
		//editing style is the deleting swipe
		if(editingStyle == UITableViewCell.EditingStyle.delete){
			tasks.remove(at: indexPath.row)
			tableViewOutlet.reloadData()
		}
	}
	

}

extension ViewController{
	// delegate/interface from AddTaskController (receives data from Another controller using interfaces)
	func addTask(name: String, description: String) {
		tasks.append(Task(name: name, description: description))
		
		// update view
		tableViewOutlet.reloadData()

	}
	
	// update/edit method for each task cell task object
	func updateTask(name:String, description:String, indexPath: IndexPath){
		tasks[indexPath.row].name = name
		tasks[indexPath.row].description = description
		
		// update view
		tableViewOutlet.reloadData()
	}
	
	//checkbox button interface (Communicates with TaskCell objects)
	func changeButton(checked: Bool, index: Int){
		tasks[index].checked = checked
		
		tableViewOutlet.reloadData()
	}
}



