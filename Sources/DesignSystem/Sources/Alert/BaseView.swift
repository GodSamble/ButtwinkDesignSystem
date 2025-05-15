import UIKit
import SnapKit

public class BaseView: UIView {
    
    private lazy var viewName = self.className
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setStyles()
        setLayout()
    }
    
    public override func removeFromSuperview() {
        super.removeFromSuperview()
        print("🧵 \(viewName) has been successfully Removed")
    }
    
    /// View 의 Style 을 set 합니다.
    public func setStyles() {}
    
    /// View 의 Layout 을 set 합니다.
    public func setLayout() {}
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension NSObject {
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}

public extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
