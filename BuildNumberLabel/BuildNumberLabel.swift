//
//  BuildNumberLabel.swift
//  BuildNumberLabel
//
//  Created by David Sweetman on 1/22/16.
//  Copyright © 2016 smashingboxes. All rights reserved.
//

import Foundation

/**
 *  Example usage:
 *
 *  import BuildNumberLabel
 *
 *  // if the defaults are ok:
 *
 *  BuildNumberLabel.create().addToView(view)
 *
 *
 *  // If you need to customize the appearance:
 *
 *  BuildNumberLabel.create(
 *      font: UIFont(name: "HelveticaNeue-Bold", size: 10),
 *      color: UIColor.lightGrayColor()
 *  ).addToView(
 *      view,
 *      vertical: .Top,
 *      verticalPadding: 70.0
 *  )
 *
 */

public func create(
    font: UIFont? = UIFont.systemFont(ofSize: 11.0),
    color: UIColor = UIColor.black,
    padding: CGFloat = 10.0,
    bundle: Bundle = Bundle.main
    ) -> BuildLabel
{
    let label = BuildLabel()
    
    let items : [(name: String, value: String?)] = [
        (
            name: "version",
            value: bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String? ?? nil
        ),
        (
            name: "build",
            value: bundle.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as? String? ?? nil
        )
    ]
    
    let versionString = items.compactMap({ item in
        guard let value = item.value else { return nil }
        return "\(item.name) \(value)"
    }).joined(separator: " ")
    
    label.text = versionString
    label.font = font
    label.backgroundColor = UIColor.clear
    label.textColor = color
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    
    return label
}

public enum VerticalEdge {
    case top, bottom
    fileprivate func layoutValue() -> NSLayoutAttribute {
        switch (self) {
        case .top: return .top
        case .bottom: return .bottom
        }
    }
}

public enum HorizontalEdge {
    case left, right
    fileprivate func layoutValue() -> NSLayoutAttribute {
        switch (self) {
        case .left: return .left
        case .right: return .right
        }
    }
}

open class BuildLabel : UILabel {
    open func addToView(
        _ view: UIView,
        vertical: VerticalEdge = .bottom,
        horizontal: HorizontalEdge = .left,
        horizontalPadding: CGFloat = 0.0,
        verticalPadding: CGFloat = 0.0)
    {
        view.addSubview(self)
        
        view.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: vertical.layoutValue(),
            relatedBy: .equal,
            toItem: view,
            attribute: vertical.layoutValue(),
            multiplier: 1.0,
            constant: (vertical == .top ? verticalPadding : -verticalPadding))
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: horizontal.layoutValue(),
            relatedBy: .equal,
            toItem: view,
            attribute: horizontal.layoutValue(),
            multiplier: 1.0,
            constant: (horizontal == .left ? horizontalPadding : -horizontalPadding))
        )
        
        self.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .width,
            multiplier: 1.0,
            constant: self.frame.size.width)
        )
    }
}
