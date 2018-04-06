//
//  MuseumAppPacketTableViewCell.swift
//  ViewMasterSwift
//
//  Created by Robert England on 3/11/18.
//  Copyright (c) 2018 Robert England. All rights reserved.
//

import UIKit

class MuseumAppPacketTableViewCell: UITableViewCell {
    var packet : MuseumAppPacket {
        didSet {
            // Associate a packet with the tile view in this cell
            let packetTileView = self.contentView.viewWithTag(1) as? MuseumAppPacketTileView
            packetTileView!.packet = self.packet
            
            // Set the label to the title of the packet
            var labelView = self.contentView.viewWithTag(2) as? UILabel
            labelView!.text = self.packet.title
            labelView = self.contentView.viewWithTag(3) as? UILabel
            labelView!.text = self.packet.date
            
            // Tell the system these need refreshing
            packetTileView!.setNeedsDisplay()
            labelView!.setNeedsDisplay()
        }
    }
    
    required init (coder aDecoder: NSCoder) {
        packet = MuseumAppPacket()
        super.init(coder: aDecoder)!
    }
    
    
}
