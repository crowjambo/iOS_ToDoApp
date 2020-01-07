//
//  AddTaskController.swift
//  TodoListApp2
//
//  Created by Evaldas on 1/7/20.
//  Copyright © 2020 Evaldas. All rights reserved.
//

import UIKit

//used to communicate with other controller +with delegate
protocol AddTask {
	func addTask(name:String, description:String)
}

class AddTaskController: UIViewController {
	
	@IBOutlet weak var nameLabel: UITextField!
	@IBOutlet weak var descriptionText: UITextField!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        
    }
	
	
	var delegate: AddTask?
    

	@IBAction func addAction(_ sender: Any) {
		
		//if not empty
		if nameLabel.text != ""{
			delegate?.addTask(name: nameLabel.text!, description: descriptionText.text!)
		}
		//onclick return same as pressing the back button
		navigationController?.popViewController(animated: true)
	}
	

}
