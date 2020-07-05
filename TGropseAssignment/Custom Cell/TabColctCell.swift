//
//  TabColctCell.swift
//  TGropseAssignment
//
//  Created by Arnab  maity on 03/07/20.
//  Copyright © 2020 Arnab  maity. All rights reserved.
//

import UIKit

class TabColctCell: UICollectionViewCell {
    
    @IBOutlet weak var headingLbl: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
           self.lineView.backgroundColor = .white
           //        imgViewLeft.backgroundColor = .clear
           //        imgViewRight.backgroundColor = .clear
       }
       
       var slect: Bool = false{
           didSet{
               self.lineView.backgroundColor = .white
               if slect{
                   self.lineView.backgroundColor = .cyan
               }else{
               }
           }
       }
    
}
