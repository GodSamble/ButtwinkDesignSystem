//
//  File.swift
//  
//
//  Created by 고영민 on 11/22/24.
//

import UIKit

extension Typography {
    public static func font(style: Attributes.TypoStyle, weight: Font.Weight) -> UIFont {
        let font = Font.ButtwinkFont(name: .Pretendard, weight: weight)
        if let loadedFont = UIFont(name: font.fileName, size: style.fontSize) {
              return loadedFont
          } else {
              return UIFont.systemFont(ofSize: style.fontSize)
          }
    }
    
    public static func build(
        string: String?,
        attributes: Attributes,
        customAttributes: [NSAttributedString.Key : Any]? = nil
    ) -> NSMutableAttributedString {
        var stringAttributes: [NSAttributedString.Key: Any] = [:]
        
        let weight = Font.Weight(rawValue: attributes.weight.rawValue)!
        let font = font(style: attributes.style, weight: weight)
        
        let style = NSMutableParagraphStyle()
        style.maximumLineHeight = attributes.style.lineHeight
        style.minimumLineHeight = attributes.style.lineHeight
        
        stringAttributes[.paragraphStyle] = style
        stringAttributes[.font] = font
        stringAttributes[.baselineOffset] = (attributes.style.lineHeight - font.lineHeight) / 4
        
        if let customAttributes {
            for customAttribute in customAttributes {
                stringAttributes[customAttribute.key] = customAttribute.value
            }
        }
        if let textColor = attributes.textColor {
            stringAttributes[.foregroundColor] = textColor
        }
        
        stringAttributes[.kern] = attributes.style.kern
        
        return NSMutableAttributedString(string: string ?? "", attributes: stringAttributes)
    }
    
    public static func height(
        string: String?,
        attributes: Attributes,
        availableWidth: CGFloat = .greatestFiniteMagnitude,
        maxLines: Int? = nil
    ) -> CGFloat {
        guard let string,
              !string.isEmpty
        else { return 0.0 }
        
        guard let maxLines,
              maxLines > 0
        else { return .zero }
        
        let boundingHeight = build(
            string: string,
            attributes: attributes
        ).boundingRect(
            with: CGSize(
                width: availableWidth,
                height: .greatestFiniteMagnitude
            ),
            options: [.usesFontLeading, .usesLineFragmentOrigin],
            context: nil
        )
            .height
        
        let lineHeight = attributes.style.lineHeight
        let lines = min(Int(ceil(boundingHeight / lineHeight)), maxLines)
        
        return lineHeight * CGFloat(lines)
    }
}
