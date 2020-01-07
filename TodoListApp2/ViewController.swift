
//  ViewController.swift
//  TodoListApp2
//
//  Created by Evaldas on 1/7/20.
//  Copyright © 2020 Evaldas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
	

	//we get tableView so we can call its reload method later
	@IBOutlet weak var tableViewOutlet: UITableView!
	
	var tasks: [Task] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	//number of items in tableView
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	//set custom values and init the cell
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TaskCell
		
		cell.nameLabel.text = tasks[indexPath.row].name
		cell.descriptionlabel.text = tasks[indexPath.row].description
		
		if tasks[indexPath.row].checked{
			cell.checkBoxOutlet.backgroundColor = UIColor.red
		} else{
			cell.checkBoxOutlet.backgroundColor = UIColor.orange
		}
		
		//using protocols pass data/grab data
		cell.delegate = self
		cell.indexP = indexPath.row
		cell.tasks = tasks
		
		return cell
	}
	
	//table view delegate swipe to remove method
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
		
		//editing style is the deleting swipe
		if(editingStyle == UITableViewCell.EditingStyle.delete){
			tasks.remove(at: indexPath.row)
			tableViewOutlet.reloadData()
		}
	}

	func changeButton(checked: Bool, index: Int){
		tasks[index].checked = checked
		tableViewOutlet.reloadData()
	}
	
	//do this else wont work
	//we change the destination controller before we get there, meaning we can set its delegate to be eqqual what we need it to be equal to
	override func prepare(for segue: UIStoryboardSegue, sender: Any?){
		let vc = segue.destination as! AddTaskController
		vc.delegate = self
	}

	//delegate from AddTaskController
	func addTask(name: String, description: String) {
		tasks.append(Task(name: name, description: description))
		tableViewOutlet.reloadData()
	}
	
	
	
}


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

