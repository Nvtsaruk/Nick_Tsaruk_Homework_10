//
//  TextDecoration.swift
//  NickTsarukHomewrok_9_MVP
//
//  Created by Tsaruk Nick on 17.07.23.
//

import UIKit

final class TextDecoration {
    static func getDecoratedString(name: String, lastname: String? = nil, age: Int16? = nil) -> NSMutableAttributedString {
        let nameFont = UIFont.systemFont(ofSize: 22, weight: .bold)
        let lastnameFont = UIFont.systemFont(ofSize: 22, weight: .regular)
        let ageString = String(Int(age ?? 0))
        let fullString = NSMutableAttributedString(string: name + " " + (lastname ?? "") + ageString)
        let fullLength = NSRange(location: 0, length: fullString.length)
        let nameRange = NSRange(location: 0, length: name.count)
        fullString.addAttributes([.font: lastnameFont, .foregroundColor: UIColor.black], range: fullLength)
        fullString.addAttributes([.font: nameFont, .foregroundColor: UIColor.black], range: nameRange)
        return fullString
    }
}
