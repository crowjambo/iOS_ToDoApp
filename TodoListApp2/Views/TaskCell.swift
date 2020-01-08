import UIKit

// interface to call view controller and do processing on this Cell data
protocol ChangeButton: class {
	func changeButton(checked:Bool, index: Int)
}


class TaskCell: UITableViewCell {

	// A connection delegate to communicate with view controller
	weak var delegate: ChangeButton?
	
	// Store index of current Item this cell belongs to
	var indexP: Int?
	// check status, always starts from false
	var isChecked:Bool = false

	
	// Connected UI Elements
	@IBOutlet weak var checkBoxOutlet: UIButton!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var descriptionlabel: UILabel!
	
	// UITableViewCell implementation functions
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

	
	// Event listener for checkBoxOutlet Button
	@IBAction func checkBoxAction(_ sender: Any) {
		isChecked = !isChecked
		delegate?.changeButton(checked: isChecked, index: indexP!)

	}
}
