//
//  MuseumAppPacketCollectionViewCell.swift
//  ViewMasterSwift
//
//  Created by M Vu, B Crist, and S Ramirez Martin on 3/12/18.
//  Copyright (c) 2018 M Vu, B Crist, and S Ramirez Martin. All rights reserved.
//

import UIKit

class MuseumAppPacketCollectionViewCell: UICollectionViewCell {
    
    var packet : MuseumAppPacket {
        didSet {
            // Associate a packet with the image view in this cell
            let imageView = self.contentView.viewWithTag(1) as! UIImageView
            imageView.image = self.packet.imageForPacketFrontView()
            // Tell the system these need refreshing
            imageView.setNeedsDisplay()
        }
    }
    
    required init (coder aDecoder: NSCoder) {
        packet = MuseumAppPacket()
        super.init(coder: aDecoder)!
    }
    
    
}
