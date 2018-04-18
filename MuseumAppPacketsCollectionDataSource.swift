//
//  MuseumAppPacketsCollectionDataSource.swift
//  ViewMasterSwift
//
//  Created by M Vu, B Crist, and S Ramirez Martin on 3/11/18.
//  Copyright (c) 2018 M Vu, B Crist, and S Ramirez Martin. All rights reserved.
//
//  Description: Provides the table view data for the packets sorted by number
//

import UIKit

// Note: Thie *automatically* picks up UICollectionDataSource protocol through
//    MuseumAppPacketsCollectionDataSourceProtocol

class MuseumAppPacketsCollectionDataSource: NSObject, MuseumAppPacketsCollectionDataSourceProtocol {
    
    //// Protocol methods to comply with "MuseumAppPacketsDataSource" protocol
    
    // Getters for properties for navagation and tab bars
    var name: String {
        get {
            return "Grid"
        }
    }
    var navigationBarName: String {
        get {
            return "Artifacts by Number in Grid"
        }
    }
    var tabBarImage: UIImage {
        get {
            return UIImage(named: "TabGrid.png")!
        }
    }
    
    //// Make UICollectionViewDataSource happy...
    
    // Number of items in the section is the number of packets
    func collectionView(_ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return MuseumAppViewMasterPackets.packetsSortedByDate!.count
    }
    
    // Just one section in the grid
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Return a cell for the corresponding index path
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MuseumAppPacketCollectionViewCell", for: indexPath as IndexPath) as! MuseumAppPacketCollectionViewCell

            // Set the packet for this cell as indicated by the datasource
        cell.packet = packetForindexPath(indexPath: indexPath as NSIndexPath)
            cell.setNeedsDisplay()
            return cell
    }
    
    // Return the packet for the given index path (--> Take a closer look at this!)
    func packetForindexPath(indexPath: NSIndexPath) -> MuseumAppPacket {
        //        println("packetForIndexPath")
        //        let firstLetter = MuseumAppViewMasterPackets.packetTitleIndexArray![indexPath.section]
        //        let packetsWithSameFirstLetter = MuseumAppViewMasterPackets.packetsWithInitialLetter(firstLetter)
        return MuseumAppViewMasterPackets.packetsSortedByDate![indexPath.row]
    }
    
    // (Don't really use this)
    func titleForHeaderInSection(tableView: UITableView, section: Int) -> String {
        return ""
    }
    
//    #pragma mark - UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 //       println("Making a cell...")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuseumAppPacketTableViewCell", for: indexPath as IndexPath) as! MuseumAppPacketTableViewCell
        
        // Set the packet for this cell as indicated by the datasource
        cell.packet = packetForindexPath(indexPath: indexPath)
        cell.setNeedsDisplay()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // One big section: Return how many packets there are total
        return MuseumAppViewMasterPackets.packetsSortedByDate!.count
     }
  
    
}
