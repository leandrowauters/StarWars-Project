//
//  IBDesignableViews.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class WhiteBorderedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
        titleLabel?.font = UIFont(name: "Futura-Bold", size: 30)
        setTitleColor(.white, for: .normal)
    }
}

class BorderedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel?.font = UIFont(name: "Futura-Bold", size: 30)
        setTitleColor(.white, for: .normal)
    }
}

class BorderedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

class RoundedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
}

class PlanetsBorderView: UIView {
    override func layoutSubviews() {
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.0005744225346, green: 0.1626783907, blue: 0.2327522039, alpha: 1)
    }
}

class ClimateBorderedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 30
        clipsToBounds = true
    }
}

