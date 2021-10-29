//
//  UIView+Extension.swift
//  RSWTools
//
//  Created by Richard Witherspoon on 5/19/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import UIKit


public extension UIView {
    //MARK: Anchors
    func fillSuperview() {
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
    }
    
    func fillSafeSuperview(safeTop: Bool = true, safeBottom: Bool = true, safeLeading: Bool = true, safeTrialing: Bool = true) {
        var topAnchor = superview?.topAnchor
        var bottomAnchor = superview?.bottomAnchor
        var leadingAnchor = superview?.leadingAnchor
        var trailingAnchor = superview?.trailingAnchor
        
        if safeTop{
            topAnchor      = superview?.safeAreaLayoutGuide.topAnchor
        }
        if safeBottom{
            bottomAnchor   = superview?.safeAreaLayoutGuide.bottomAnchor
        }
        if safeLeading{
            leadingAnchor  = superview?.safeAreaLayoutGuide.leadingAnchor
        }
        if safeTrialing{
            trailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor
        }
        
        anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, constant: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: constant.top))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -constant.bottom))
        }
        
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: constant.left))
        }
        
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -constant.right))
        }
        
        if size.width != 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        
        if size.height != 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        
        NSLayoutConstraint.activate(anchors)
    }
    
    func anchorHeight(height: NSLayoutDimension, constant: CGFloat = 0, multiplier: CGFloat = 1){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: height, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func anchorWidth(width: NSLayoutDimension, constant: CGFloat = 0, multiplier: CGFloat = 1){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: width, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func anchorHeightWidth(height: NSLayoutDimension, heightConstant: CGFloat = 0, heightMultiplier: CGFloat = 1, width: NSLayoutDimension, widthConstant: CGFloat = 0, widthMultiplier: CGFloat = 1){
        anchorHeight(height: height, constant: heightConstant, multiplier: heightMultiplier)
        anchorWidth(width: width, constant: widthConstant, multiplier: widthMultiplier)
    }
    
    func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    
    func anchorCenterXToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
    }
    
    func anchorCenterYToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
    }
    
    //MARK: Misc
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func applyGradient(colors: [CGColor],
                       locations: [NSNumber],
                       startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
                       endPoint: CGPoint = CGPoint(x: 0.5, y: 1)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addSubviews(_ views: UIView...){
        views.forEach({addSubview($0)})
    }
    
    func roundAllCorners(radius: CGFloat){
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layer.masksToBounds = true
        layer.cornerRadius  = radius
    }
    
    func roundTopCorners(radius: CGFloat){
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.masksToBounds = true
        layer.cornerRadius  = radius
    }
    
    func roundBottomCorners(radius: CGFloat){
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layer.masksToBounds = true
        layer.cornerRadius  = radius
    }
    
    func setupShadow(opacity: Float = 0,
                     radius: CGFloat = 0,
                     offset: CGSize = .zero,
                     color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius  = radius
        layer.shadowOffset  = offset
        layer.shadowColor   = color.cgColor
    }

    
    func withBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    //MARK: Stacking
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical,
                            views: [UIView],
                            spacing: CGFloat = 0,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    func stack(_ views: UIView...,
               spacing: CGFloat = 0,
               alignment: UIStackView.Alignment = .fill,
               distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    func hstack(_ views: UIView...,
                spacing: CGFloat = 0,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
}
