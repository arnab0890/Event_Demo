//
//  SegmentController.swift
//  Pydeya Provider
//
//  Created by Nitesh jha on 30/06/20.
//  Copyright © 2020 Himanshu Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)], for: .selected)
    }

    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(red: 0/255, green: 183/255, blue: 249/255, alpha: 1)
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}
//import UIKit
//protocol CustomSegmentedControlDelegate:class {
//    func changeToIndex(index:Int)
//}
//
//class CustomSegmentedControl: UIView {
//    private var buttonTitles:[String]!
//    private var buttons: [UIButton]!
//    private var selectorView: UIView!
//
//    var textColor:UIColor = .black
//    var selectorViewColor: UIColor = .red
//    var selectorTextColor: UIColor = .red
//
//    weak var delegate:CustomSegmentedControlDelegate?
//
//    public private(set) var selectedIndex : Int = 0
//    var selectedTndexes = 0
//
//    convenience init(frame:CGRect,buttonTitle:[String]) {
//        self.init(frame: frame)
//        self.buttonTitles = buttonTitle
//    }
//
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        self.backgroundColor = UIColor.white
//        updateView()
//    }
//
//    func setButtonTitles(buttonTitles:[String]) {
//        self.buttonTitles = buttonTitles
//        self.updateView()
//    }
//
//    func setIndex(index:Int) {
//        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
//        let button = buttons[index]
//        selectedTndexes = index
//        button.setTitleColor(selectorTextColor, for: .normal)
//        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
//        UIView.animate(withDuration: 0.2) {
//            self.selectorView.frame.origin.x = selectorPosition
//        }
//    }
//
//    @objc func buttonAction(sender:UIButton) {
//        for (buttonIndex, btn) in buttons.enumerated() {
//            btn.setTitleColor(textColor, for: .normal)
//            if btn == sender {
//                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
//                selectedTndexes = buttonIndex
//                delegate?.changeToIndex(index: selectedTndexes)
//                UIView.animate(withDuration: 0.3) {
//                    self.selectorView.frame.origin.x = selectorPosition
//                }
//                btn.setTitleColor(selectorTextColor, for: .normal)
//            }
//        }
//    }
//}
//
////Configuration View
//extension CustomSegmentedControl {
//    private func updateView() {
//        createButton()
//        configSelectorView()
//        configStackView()
//    }
//
//    private func configStackView() {
//        let stack = UIStackView(arrangedSubviews: buttons)
//        stack.axis = .horizontal
//        stack.alignment = .fill
//        stack.distribution = .fillEqually
//        addSubview(stack)
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//    }
//
//    private func configSelectorView() {
//        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
//        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
//        selectorView.backgroundColor = selectorViewColor
//        addSubview(selectorView)
//    }
//
//    private func createButton() {
//        buttons = [UIButton]()
//        buttons.removeAll()
//        subviews.forEach({$0.removeFromSuperview()})
//        for buttonTitle in buttonTitles {
//            let button = UIButton(type: .system)
//            button.setTitle(buttonTitle, for: .normal)
//            button.addTarget(self, action:#selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
//            button.setTitleColor(textColor, for: .normal)
//            buttons.append(button)
//        }
//        buttons[0].setTitleColor(selectorTextColor, for: .normal)
//    }
//
//
//}
