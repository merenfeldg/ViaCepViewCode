//
//  UIEdgeInsets+Extension.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

extension UIEdgeInsets {
    init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
}
