//
// AHTextField
//
// Created by Aleš Hanžlík
// Available at https://github.com/Phyber64/AHTextField
//

import UIKit

public class AHTextField: UITextField {
    private(set) public var borders: [UIView] = []
    private(set) public var borderGradient: CAGradientLayer?
    private(set) public var gradientBorderWidth: CGFloat = 0
    
    public var defaultTextPadding: UIEdgeInsets
    private lazy var textPadding = defaultTextPadding
    
    public var leftViewPadding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    public var rightViewPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
    
    public var clearButtonPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
    
    
    public init(frame: CGRect = .zero, textPadding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)) {
        defaultTextPadding = textPadding
        super.init(frame: frame)
    }
    
    public override init(frame: CGRect) {
        defaultTextPadding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        guard let borderGradient = borderGradient else { return }
        
        for borderView in borders {
            //Create copy
            guard let gradientCopy = copyGradientLayer(borderGradient) else { continue }
            
            gradientCopy.frame = CGRect(origin: CGPoint.zero, size: borderView.frame.size)
            
            borderView.layer.insertSublayer(gradientCopy, at: 0)
        }
        
        guard gradientBorderWidth > 0 else { return }  // If gradientBorderWidth is greater than 1, create gradient border
        
        let boundingRect = CGRect(x: gradientBorderWidth/2, y: gradientBorderWidth/2, width: bounds.width - gradientBorderWidth, height: bounds.height - gradientBorderWidth)
        
        borderGradient.frame = CGRect(origin: CGPoint.zero, size: bounds.size)
        
        let maskLayer = CAShapeLayer()
        maskLayer.lineWidth = gradientBorderWidth
        if layer.cornerRadius > 0 {
            maskLayer.path = UIBezierPath(roundedRect: boundingRect, cornerRadius: layer.cornerRadius).cgPath
        }else {
            maskLayer.path = UIBezierPath(rect: boundingRect).cgPath
        }
        
        maskLayer.strokeColor = UIColor.black.cgColor
        maskLayer.fillColor = UIColor.clear.cgColor
        borderGradient.mask = maskLayer
        
        layer.addSublayer(borderGradient)
    }
    
    public override var leftView: UIView? {
        didSet {
            if (leftView?.frame.width ?? 0) == 0 {
                self.leftViewMode = .never
                textPadding.left = defaultTextPadding.left
            }else{
                self.leftViewMode = .always
                textPadding.left = (leftView?.frame.width ?? 0) + leftViewPadding.left + leftViewPadding.right + defaultTextPadding.left
            }
        }
    }
    
    public override var rightView: UIView? {
        didSet {
            if (rightView?.frame.width ?? 0) == 0 {
                self.rightViewMode = .never
                textPadding.right = defaultTextPadding.right
            }else{
                self.rightViewMode = .always
                textPadding.right = (rightView?.frame.width ?? 0) + rightViewPadding.left + rightViewPadding.right + defaultTextPadding.right
            }
        }
    }
    
    public override var clearButtonMode: UITextField.ViewMode {
        didSet {
            if clearButtonMode == .never {
                textPadding.right = defaultTextPadding.right
            }else {
                textPadding.right = 14 + clearButtonPadding.left + clearButtonPadding.right + defaultTextPadding.right
            }
        }
    }
    
    public func setLeftViewImage(image: UIImage?, template: Bool? = nil, size: CGSize, tintColor: UIColor? = nil, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.leftView = createImageView(image: image, template: template, size: size, tintColor: tintColor, backgroundColor: backgroundColor, contentMode: contentMode)
    }
    
    public func setRightViewImage(image: UIImage?, template: Bool? = nil, size: CGSize, tintColor: UIColor? = nil, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.rightView = createImageView(image: image, template: template, size: size, tintColor: tintColor, backgroundColor: backgroundColor, contentMode: contentMode)
    }
    
    private func createImageView(image: UIImage?, template: Bool? = nil, size: CGSize, tintColor: UIColor? = nil, backgroundColor: UIColor = .clear, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        var template = template
        if template == nil {
            template = tintColor == nil ? false : true
        }
        let imageView = UIImageView(image: image?.withRenderingMode((template ?? false) ? .alwaysTemplate : .alwaysOriginal))
        imageView.frame.size = size
        imageView.tintColor = tintColor
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = backgroundColor
        return imageView
    }
    
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = bounds
        rect.size.width = (leftView?.frame.width ?? 0) + leftViewPadding.left + leftViewPadding.right
        return rect.inset(by: leftViewPadding)
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = bounds
        let rightViewWidth = (rightView?.frame.width ?? 0) + rightViewPadding.left + rightViewPadding.right
        var inset = rightViewPadding
        inset.left += rect.width - rightViewWidth
        return rect.inset(by: inset)
    }
    
    override public func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = bounds
        let rightViewWidth = 14 + clearButtonPadding.left + clearButtonPadding.right
        var inset = clearButtonPadding
        inset.left += rect.width - rightViewWidth
        return rect.inset(by: inset)
    }
    
    public func removeAllBorders() {
        borders.removeAll()
        let allSpecificBorders:[UIRectEdge] = [.top, .bottom, .left, .right]
        allSpecificBorders.forEach { (edge) in
            if let v = viewWithTag(Int(edge.rawValue)) {
                v.removeFromSuperview()
            }
        }
        
        gradientBorderWidth = 0
        borderGradient?.removeFromSuperlayer()
        layer.borderWidth = 0
    }
    
    public func setBorders(for edges: [UIRectEdge] = [.all], width: CGFloat = 1, color: UIColor = .black, gradient: CAGradientLayer? = nil) {
        if let gradientLayer = gradient {
            let gradientCopy = copyGradientLayer(gradientLayer)
            borderGradient = gradientCopy
        }
        
        
        //First, remove all edges
        let allSpecificBorders:[UIRectEdge] = [.top, .bottom, .left, .right]
        
        borders.removeAll()
        allSpecificBorders.forEach { (edge) in
            if let v = viewWithTag(Int(edge.rawValue)) {
                v.removeFromSuperview()
            }
        }
        
        
        if edges.contains(.all) {
            if borderGradient != nil {
                layer.borderWidth = 0
                gradientBorderWidth = width
            }else {
                layer.borderWidth = width
                layer.borderColor = color.cgColor
            }
            
        } else {
            for edge in allSpecificBorders {
                if edges.contains(edge) {
                    let border = UIView()
                    border.tag = Int(edge.rawValue)
                    border.backgroundColor = color
                    border.translatesAutoresizingMaskIntoConstraints = false
                    
                    borders.append(border)
                    addSubview(border)
                    
                    var horizontalVisualFormat = "H:"
                    var verticalVisualFormat = "V:"
                    
                    switch edge {
                    case UIRectEdge.bottom:
                        horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                        verticalVisualFormat += "[v(\(width))]-(0)-|"
                    case UIRectEdge.top:
                        horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                        verticalVisualFormat += "|-(0)-[v(\(width))]"
                    case UIRectEdge.left:
                        horizontalVisualFormat += "|-(0)-[v(\(width))]"
                        verticalVisualFormat += "|-(0)-[v]-(0)-|"
                    case UIRectEdge.right:
                        horizontalVisualFormat += "[v(\(width))]-(0)-|"
                        verticalVisualFormat += "|-(0)-[v]-(0)-|"
                    default:
                        break
                    }
                    
                    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": border]))
                    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": border]))
                }
            }
        }
    }
    
    private func copyGradientLayer(_ gradientLayer: CAGradientLayer) -> CAGradientLayer? {
        let archivedGradient = NSKeyedArchiver.archivedData(withRootObject: gradientLayer)
        let gradientCopy = NSKeyedUnarchiver.unarchiveObject(with: archivedGradient) as? CAGradientLayer
        return gradientCopy
    }
}
