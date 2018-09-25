//
//  VideoPlayerCell.swift
//  VideoCellDemo
//
//  Created by SOTSYS024 on 21/09/18.
//  Copyright © 2018 digicom. All rights reserved.
//

import UIKit

class VideoPlayerCell: UITableViewCell {

    @IBOutlet weak var playerView: PlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
