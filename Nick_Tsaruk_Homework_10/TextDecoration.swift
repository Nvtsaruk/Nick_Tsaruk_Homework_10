import UIKit

enum TextDecorationVariant {
    case list
    case details
    static var boldFont = UIFont.systemFont(ofSize: 22, weight: .bold)
    static var regularFont = UIFont.systemFont(ofSize: 22, weight: .regular)
}

final class TextDecoration {
    static func getDecoratedString(firstWord: String? = nil, secondWordString: String? = nil, secondWordInt: Int16? = nil, style: TextDecorationVariant) -> NSMutableAttributedString {
        var fullString = NSMutableAttributedString(string: "")
        var nameFont = TextDecorationVariant.boldFont
        var lastnameFont = TextDecorationVariant.regularFont
        switch style {
            case .list:
                nameFont = TextDecorationVariant.boldFont
                lastnameFont = TextDecorationVariant.regularFont
            case .details:
                nameFont = TextDecorationVariant.regularFont
                lastnameFont = TextDecorationVariant.boldFont
        }
        
                if let unwrapAge = secondWordInt {
                    let ageString = String(Int(unwrapAge))
                    fullString = NSMutableAttributedString(string: (firstWord ?? "") + " " + ageString)
                } else {
                    fullString = NSMutableAttributedString(string: (firstWord ?? "") + " " + (secondWordString ?? ""))
                }
        let fullLength = NSRange(location: 0, length: fullString.length)
        let nameRange = NSRange(location: 0, length: firstWord?.count ?? 0)
        fullString.addAttributes([.font: lastnameFont, .foregroundColor: UIColor.black], range: fullLength)
        fullString.addAttributes([.font: nameFont, .foregroundColor: UIColor.black], range: nameRange)
        return fullString
    }
}
