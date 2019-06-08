import UIKit

public enum TDSwiftTwoItemsSegmentedControlItem: Int {
    case item0 = 0
    case item1 = 1
}

public protocol TDSwiftTwoItemsSegmentedControlDelegate: class {
    func segmentedItemSelected(selectedItem: TDSwiftTwoItemsSegmentedControlItem)
}

public class TDSwiftTwoItemsSegmentedControl: UIView {
    // Outlets
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var selectionIndicator0: UIView!
    @IBOutlet weak var selectionIndicator1: UIView!
    
    // Button click actions
    @IBAction func button0Clicked(_ sender: UIButton) { delegate?.segmentedItemSelected(selectedItem: .item0); selectedItem = .item0 }
    @IBAction func button1Clicked(_ sender: UIButton) { delegate?.segmentedItemSelected(selectedItem: .item1); selectedItem = .item1 }
    
    // Control delegate
    public weak var delegate: TDSwiftTwoItemsSegmentedControlDelegate?
    
    // Control properties
    public var controlTintColor: UIColor? = UIColor.blue { didSet { setSelected(forItem: selectedItem) } }
    public var controlUnSelectedColor: UIColor? = UIColor.lightGray { didSet { setSelected(forItem: selectedItem) } }
    public var controlBGColor: UIColor? = UIColor.white { didSet { setSelected(forItem: selectedItem) } }
    public var selectedItem: TDSwiftTwoItemsSegmentedControlItem = .item0 { didSet { setSelected(forItem: selectedItem) } }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setSelected(forItem: selectedItem)
    }
    
    private func setupAppearance() {
        button0.backgroundColor = controlBGColor
        button1.backgroundColor = controlBGColor
        button0.setTitleColor(controlUnSelectedColor, for: .normal)
        button1.setTitleColor(controlUnSelectedColor, for: .normal)
        
        selectionIndicator0.backgroundColor = controlBGColor
        selectionIndicator1.backgroundColor = controlBGColor
    }
    
    public func setSelected(forItem item: TDSwiftTwoItemsSegmentedControlItem) {
        setupAppearance()
        
        // Selected button and indicator
        var targetButton = button0
        var targetIndicator = selectionIndicator0
        if item == .item1 {
            targetButton = button1
            targetIndicator = selectionIndicator1
        }
        
        targetButton?.setTitleColor(controlTintColor, for: .normal)
        targetIndicator?.backgroundColor = controlTintColor
    }
    
    public func setTitle(title: String, forItem item: TDSwiftTwoItemsSegmentedControlItem) {
        // Target item button
        var targetBtn = button0
        if item == .item1 { targetBtn = button1 }
        
        // Set title
        targetBtn?.setTitle(title, for: .normal)
    }
    
    public class func instanceFromNib() -> TDSwiftTwoItemsSegmentedControl {
        return UINib(nibName: String(describing: TDSwiftTwoItemsSegmentedControl.self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TDSwiftTwoItemsSegmentedControl
    }
}
