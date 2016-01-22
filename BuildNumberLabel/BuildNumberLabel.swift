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
    font font: UIFont? = UIFont.systemFontOfSize(11.0),
    color: UIColor = UIColor.blackColor(),
    padding: CGFloat = 10.0
    ) -> BuildLabel
{
    let label = BuildLabel()
    
    let items : [(name: String, value: String?)] = [
        (
            name: "version",
            value:NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String? ?? nil
        ),
        (
            name: "build",
            value: NSBundle.mainBundle().objectForInfoDictionaryKey(String(kCFBundleVersionKey)) as? String? ?? nil
        )
    ]
    
    let versionString = items.flatMap({ item in
        guard let value = item.value else { return nil }
        return "\(item.name) \(value)"
    }).joinWithSeparator(" ")
    
    label.text = versionString
    label.font = font
    label.backgroundColor = UIColor.clearColor()
    label.textColor = color
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    
    return label
}

public enum VerticalEdge {
    case Top, Bottom
    private func layoutValue() -> NSLayoutAttribute {
        switch (self) {
        case .Top: return .Top
        case .Bottom: return .Bottom
        }
    }
}

public enum HorizontalEdge {
    case Left, Right
    private func layoutValue() -> NSLayoutAttribute {
        switch (self) {
        case .Left: return .Left
        case .Right: return .Right
        }
    }
}

public class BuildLabel : UILabel {
    public func addToView(
        view: UIView,
        vertical: VerticalEdge = .Bottom,
        horizontal: HorizontalEdge = .Left,
        horizontalPadding: CGFloat = 0.0,
        verticalPadding: CGFloat = 0.0)
    {
        view.addSubview(self)
        
        view.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: vertical.layoutValue(),
            relatedBy: .Equal,
            toItem: view,
            attribute: vertical.layoutValue(),
            multiplier: 1.0,
            constant: (vertical == .Top ? verticalPadding : -verticalPadding))
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: horizontal.layoutValue(),
            relatedBy: .Equal,
            toItem: view,
            attribute: horizontal.layoutValue(),
            multiplier: 1.0,
            constant: (horizontal == .Left ? horizontalPadding : -horizontalPadding))
        )
        
        self.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Width,
            multiplier: 1.0,
            constant: self.frame.size.width)
        )
    }
}
