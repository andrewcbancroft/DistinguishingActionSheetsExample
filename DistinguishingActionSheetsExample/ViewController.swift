import UIKit

enum ActionSheetTag: Int {
	case ActionSheet1
	case ActionSheet2
}

class ViewController: UIViewController, UIActionSheetDelegate {
	@IBOutlet weak var choiceLabel: UILabel!
	
	@IBAction func presentActionSheet1(sender: AnyObject) {
		let actionSheet1 = UIActionSheet()
		actionSheet1.delegate = self
		actionSheet1.title = "Choices"
		actionSheet1.tag = ActionSheetTag.ActionSheet1.rawValue
		actionSheet1.addButtonWithTitle("Choice 1")
		actionSheet1.addButtonWithTitle("Choice 2")
		actionSheet1.addButtonWithTitle("Cancel")
		actionSheet1.cancelButtonIndex = 2
		
		actionSheet1.showInView(self.view)
	}
	
	@IBAction func presentActionSheet2(sender: AnyObject) {
		let actionSheet2 = UIActionSheet()
		actionSheet2.delegate = self
		actionSheet2.title = "Options"
		actionSheet2.tag = ActionSheetTag.ActionSheet2.rawValue
		actionSheet2.addButtonWithTitle("Option 1")
		actionSheet2.addButtonWithTitle("Option 2")
		actionSheet2.addButtonWithTitle("Cancel")
		actionSheet2.cancelButtonIndex = 2
		
		actionSheet2.showInView(self.view)
	}
	
	func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
		if let tag = ActionSheetTag(rawValue: actionSheet.tag) {
			switch tag {
			case .ActionSheet1:
				self.choiceLabel.text = "Button \(buttonIndex) of Action Sheet 1 was selected."
			case .ActionSheet2:
				self.choiceLabel.text = "Button \(buttonIndex) of Action Sheet 2 was selected."
			default:
				println("Unknown action sheet.")
			}
		}
	}
}