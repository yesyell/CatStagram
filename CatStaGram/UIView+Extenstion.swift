//
//  UIView+Extenstion.swift
//  CatStaGram
//
//  Created by 김예린 on 2022/12/28.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { // 모따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
