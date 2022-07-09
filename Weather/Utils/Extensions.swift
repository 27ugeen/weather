//
//  Utils.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

extension UIFont {
    static func setAppMainFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Regular", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func setAppMediumFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Medium", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}

extension UIImage {
    static func textToImage(drawText text: String, inImage image: UIImage, font textFont: UIFont, color textColor: UIColor, atPoint point: CGPoint) -> UIImage {
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
        ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
            color.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        }
        setBackgroundImage(colorImage, for: controlState)
    }
}

extension String {
    func setUnderlineStyle() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}

extension String {
    func toCountry() -> String {
        let country = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: self)
        
        return country ?? ""
    }
}

extension UINavigationController {
    func pushVCFromLeft(controller: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        pushViewController(controller, animated: false)
    }
    
    func popVCToLeft() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        popViewController(animated: false)
    }
}

extension UIViewController {
    func showAlert(message: String) {
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension Double {
    func dateFormatted(_ format: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}

enum Direction: String, CaseIterable {
    case n, nne, ne, ene, e, ese, se, sse, s, ssw, sw, wsw, w, wnw, nw, nnw
}

extension Direction: CustomStringConvertible  {
    init<D: BinaryFloatingPoint>(_ direction: D) {
        self =  Self.allCases[Int((direction.angle + 11.25).truncatingRemainder(dividingBy: 360)/22.5)]
    }
    var description: String { rawValue.uppercased() }
}

extension BinaryFloatingPoint {
    var angle: Self {
        (truncatingRemainder(dividingBy: 360) + 360)
            .truncatingRemainder(dividingBy: 360)
    }
    var direction: Direction { .init(self) }
}

enum UVI: String, CaseIterable {
    case Low, Moderate, High, VeryHigh = "Very High", Extreme
}

extension Int {
    func uviToStr() -> String {
        switch self {
        case let x where x < 2:
            return UVI.Low.rawValue
        case let x where x > 2 && x < 6:
            return UVI.Moderate.rawValue
        case let x where x > 5 && x < 8:
            return UVI.High.rawValue
        case let x where x > 7 && x < 11:
            return UVI.VeryHigh.rawValue
        default:
            return UVI.Extreme.rawValue
        }
    }
}
