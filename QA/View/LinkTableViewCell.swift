//
//  LinkTableViewCell.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 23/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class LinkTableViewCell: UITableViewCell {

    @IBOutlet weak var linkLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
