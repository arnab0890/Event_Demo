//
//  EventDetailViewCell.swift
//  TGropseAssignment
//
//  Created by Arnab  maity on 04/07/20.
//  Copyright © 2020 Arnab  maity. All rights reserved.
//

import UIKit

class EventDetailViewCell: UITableViewCell {

    @IBOutlet weak var eventDetailImage: UIImageView!
    
    @IBOutlet weak var eventDetailLbl: UILabel!
    
    @IBOutlet weak var eventTimeLbl: UILabel!
    
    @IBOutlet weak var eventLanguageLbl: UILabel!
    
    @IBOutlet weak var eventGenderLbl: UILabel!
    
    @IBOutlet weak var eventAgeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
