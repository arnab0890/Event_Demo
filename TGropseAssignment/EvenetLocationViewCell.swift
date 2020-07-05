//
//  EvenetLocationViewCell.swift
//  TGropseAssignment
//
//  Created by Arnab  maity on 04/07/20.
//  Copyright © 2020 Arnab  maity. All rights reserved.
//

import UIKit

class EvenetLocationViewCell: UITableViewCell {

    @IBOutlet weak var eventHeadingLbl: UILabel!
    
    @IBOutlet weak var eventLocationImg: UIImageView!
    
    @IBOutlet weak var eventLocationLbl: UILabel!
    
    @IBOutlet weak var eventMarkerLbl: UILabel!
    
    
    
    @IBOutlet weak var eventPinLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
