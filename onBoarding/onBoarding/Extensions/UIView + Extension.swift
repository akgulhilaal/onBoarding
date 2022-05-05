//
//  UIView + Extension.swift
//  onBoarding
//
//  Created by Hilal Akgül on 13.04.2022.
//

import UIKit

extension UIView{
    //corner radius extension
    @IBInspectable var cornerRadius : CGFloat{
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
