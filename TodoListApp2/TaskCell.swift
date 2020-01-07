//
//  TaskCell.swift
//  TodoListApp2
//
//  Created by Evaldas on 1/7/20.
//  Copyright © 2020 Evaldas. All rights reserved.
//

import UIKit


protocol ChangeButton {
	func changeButton(checked:Bool, index: Int)
}


class TaskCell: UITableViewCell {


	
	@IBOutlet weak var checkBoxOutlet: UIButton!
	
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBOutlet weak var descriptionlabel: UILabel!
	
	var delegate: ChangeButton?
	var indexP: Int?
	var tasks: [Task]?
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBAction func checkBoxAction(_ sender: Any) {
		if tasks![indexP!].checked{
			delegate?.changeButton(checked: false, index: indexP!)
		}else{
			delegate?.changeButton(checked: true, index: indexP!)
		}
	}
}
