//
//  UIKitViewController.swift
//  SFSymbolsDemo
//
//  Created by Masakiyo Tachikawa on 2023/03/16.
//

import UIKit

class UIKitViewController: UIViewController {

    private static let symbolName: String = "person.3.sequence.fill"
    private static let symbolOriginalSize: CGSize = UIImage(systemName: symbolName)!.size
    private static let symbolSizeRate: CGFloat = symbolOriginalSize.width / symbolOriginalSize.height
    private static let font: UIFont = .preferredFont(forTextStyle: .title1)
    //private static let fontHeight: CGFloat = font.capHeight
    //private static let fontHeight: CGFloat = font.ascender
    private static let fontHeight: CGFloat = font.pointSize
    private static let symbolBounds = CGRect(
        origin: .init(
            x: 0.0,
            y: ((font.capHeight - fontHeight) * 0.5).rounded()
        ),
        size: .init(
            width: (symbolSizeRate * fontHeight).rounded(),
            height: fontHeight.rounded()
        )
    )

    @IBOutlet private weak var label: UILabel!

    private var originalSymbol: NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: Self.symbolName)
        attachment.bounds = Self.symbolBounds
        return NSAttributedString(attachment: attachment)
    }

    private var hierarchicalSymbolImage: NSAttributedString {
        let attachment = NSTextAttachment()
        let config: UIImage.SymbolConfiguration = .init(hierarchicalColor: label.textColor)
        attachment.image = UIImage(systemName: Self.symbolName, withConfiguration: config)
        attachment.bounds = Self.symbolBounds
        return NSAttributedString(attachment: attachment)
    }

    private var hierarchicalSymbol: NSAttributedString {
        let attachment = NSTextAttachment()
        let config: UIImage.SymbolConfiguration = .init(hierarchicalColor: .systemPink)
        attachment.image = UIImage(systemName: Self.symbolName, withConfiguration: config)
        attachment.bounds = Self.symbolBounds
        return NSAttributedString(attachment: attachment)
    }

    private var multiColorSymbol: NSAttributedString {
        let attachment = NSTextAttachment()
        let config: UIImage.SymbolConfiguration = .init(
            paletteColors: [
                .yellow,
                .green,
                .blue
            ]
        )
        attachment.image = UIImage(systemName: Self.symbolName, withConfiguration: config)
        attachment.bounds = Self.symbolBounds
        return NSAttributedString(attachment: attachment)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit"

        let text: String = "SF Symbols sample"

        /// Dynamic Text
        label.font = Self.font
        label.adjustsFontForContentSizeCategory = true


        let mutableString = NSMutableAttributedString(string: text)
        mutableString.insert(originalSymbol, at: 0)
        mutableString.insert(hierarchicalSymbolImage, at: text.count + 1)

        mutableString.insert(NSAttributedString(string: "\n"), at: text.count + 2)
        mutableString.insert(originalSymbol, at: text.count + 3)
        mutableString.insert(NSAttributedString(string: text), at: text.count + 4)
        mutableString.insert(hierarchicalSymbol, at: (text.count * 2) + 4)

        mutableString.insert(NSAttributedString(string: "\n"), at: (text.count * 2) + 5)
        mutableString.insert(originalSymbol, at: (text.count * 2) + 6)
        mutableString.insert(NSAttributedString(string: text), at: (text.count * 2) + 7)
        mutableString.insert(multiColorSymbol, at: (text.count * 3) + 7)

        label.attributedText = mutableString
    }
}
