//
//  UIView+Extension.swift
//  RTC
//
//  Created by Varun Tyagi on 17/01/20.
//  Copyright © 2020 Ayush Parashar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
        }
    }
    
    func dropShadow(scale: Bool = true) {
       layer.masksToBounds = false
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOpacity = 0.1
       layer.shadowOffset = CGSize(width: -1, height: 1)
       layer.shadowRadius = 1

       layer.shadowPath = UIBezierPath(rect: bounds).cgPath
       layer.shouldRasterize = true
       layer.rasterizationScale = scale ? UIScreen.main.scale : 1
     }
    
//    func addBackgroundImg(img : String?){
//
//    //   if DeviceType.IS_IPHONESE || DeviceType.IS_IPHONE8 || DeviceType.IS_IPHONE8PLUS
//     //  {
//           let imgView =  UIImageView(image: UIImage(named: img ?? "OldRegisterationBackground")!)
//           imgView.frame = self.view.bounds
//           self.view.insertSubview(imgView, at: 0)
//           imgView.contentMode = .scaleAspectFit
//
//}
}

extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor

    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
}

extension UIViewController {
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK : Set Background Image
    func addBackgroundImg(img : String?){
        
     //   if DeviceType.IS_IPHONESE || DeviceType.IS_IPHONE8 || DeviceType.IS_IPHONE8PLUS
      //  {
            let imgView =  UIImageView(image: UIImage(named: img ?? "OldRegisterationBackground")!)
            imgView.frame = self.view.bounds
            self.view.insertSubview(imgView, at: 0)
            imgView.contentMode = .scaleAspectFit
   //     }
      //  else
//        {
//        let imgView = UIImageView(image: UIImage(named: img ?? "registrationBackground")!)
//        imgView.frame = self.view.bounds
//        self.view.insertSubview(imgView, at: 0)
//        imgView.contentMode = .scaleAspectFit
//        }
    }
    
}
