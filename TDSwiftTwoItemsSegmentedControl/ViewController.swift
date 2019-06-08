import UIKit

class ViewController: UIViewController {
    let options = ["Swift", "Objective-C"]
    var infoLabel: UILabel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        setupInfoLabel()
    }
    
    private func setupSegmentedControl() {
        // Control instance
        let segmentedControl = TDSwiftTwoItemsSegmentedControl.instanceFromNib()
        
        // Control frame
        segmentedControl.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: segmentedControl.frame.height)
        
        // Control appearance
        segmentedControl.setTitle(title: options[0], forItem: .item0)
        segmentedControl.setTitle(title: options[1], forItem: .item1)
        segmentedControl.controlTintColor = UIColor(red:0.00, green:0.73, blue:0.56, alpha:1.0)
        
        // Control delegate
        segmentedControl.delegate = self
        
        // Add control to parent view
        self.view.addSubview(segmentedControl)
    }
    
    private func setupInfoLabel() {
        let labelHeight: CGFloat = 100.0
        self.infoLabel = UILabel(frame: CGRect(x: 0.0, y: self.view.frame.height / 2 - labelHeight / 2, width: self.view.frame.width, height: labelHeight))
        infoLabel.font = UIFont.boldSystemFont(ofSize: 50.0)
        infoLabel.textAlignment = .center
        infoLabel.text = options[0]
        
        self.view.addSubview(infoLabel)
    }
}

extension ViewController: TDSwiftTwoItemsSegmentedControlDelegate {
    func segmentedItemSelected(selectedItem: TDSwiftTwoItemsSegmentedControlItem) {
        infoLabel.text = options[selectedItem.rawValue]
    }
}
