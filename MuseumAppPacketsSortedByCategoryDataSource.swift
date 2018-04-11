//
//  MuseumAppPacketsSortedByLocationDataSource.swift
//  ViewMasterSwift
//
//  Created by Robert England on 3/11/18.
//  Copyright (c) 2018 Robert England. All rights reserved.
//
//  Description: Provides the table view data for the packets sorted by category
//

import UIKit

// Note: Thie *automatically* picks up UITableDataSource protocol through
//    MuseumAppPacketsTableDataSourceProtocol

class MuseumAppPacketsSortedByCategoryDataSource: NSObject, MuseumAppPacketsTableDataSourceProtocol {
    
    //// Protocol methods to comply with "MuseumAppPacketsDataSource" protocol
    
    // Getters for properties for navagation and tab bars
    var name: String {
        get {
            return "Category"
        }
    }
    var navigationBarName: String {
        get {
            return "Packets Sorted by Category"
        }
    }
    var tabBarImage: UIImage {
        get {
            return UIImage(named: "TabCategory.png")!
        }
    }
    
    // Sorted by titles is a plain table style
    var tableViewStyle: UITableViewStyle {
        get {
            return UITableViewStyle.plain
        }
    }
    
    // Return the packet for the given index path (--> Take a closer look at this!)
    func packetForindexPath(indexPath: NSIndexPath) -> MuseumAppPacket {
        // This table has multiple sections --- One for each Category
        // The section number is the index into the Category array,
        //    the row number is the index into that Category's array of packets.
        
        // Get the Category
        let packetCategory = MuseumAppViewMasterPackets.packetCategory![indexPath.section]
        
        // Get the packet from that category's array
        let packetsInThisCategory = MuseumAppViewMasterPackets.packetsInCategory(category: packetCategory)
        return packetsInThisCategory![indexPath.row]
    }
    
    // (Don't really use this)
    func titleForHeaderInSection(tableView: UITableView, section: Int) -> String {
        return ""
    }
    
//    #pragma mark - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //       println("Making a cell...")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuseumAppPacketTableViewCell", for: indexPath) as! MuseumAppPacketTableViewCell
        
        // Set the packet for this cell as indicated by the datasource
        cell.packet = packetForindexPath(indexPath: indexPath as NSIndexPath)
        cell.setNeedsDisplay()
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // The number of different sections in thei table depends on the number of different first letters
        return MuseumAppViewMasterPackets.packetCategory!.count
    }
  
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        // Supposedly, you send me a section title (letter) and its index number, and I send you back
        //    the index number (what??!)
        return index
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //       print("numberOfRowsInSection \(section)")
        // This table has one section per location.
        // Return the number of packets in the current category.

        // Get the category name...
        let categoryKey = MuseumAppViewMasterPackets.packetCategory![section]

        // ... and then get the number of packets in that category
        let packetsInThisCategory = MuseumAppViewMasterPackets.packetsInCategory(category: categoryKey)
        
        // Return how many there are in this category
        if packetsInThisCategory != nil {
            return packetsInThisCategory!.count
        }
        else {
 //           println("whoops!")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return the location name that corresponds to the given section, but only if there
        //    are packets in this location
        // [Technically, this is a delegate method for the table, but we get it from the data source]
//        if tableView.numberOfRowsInSection(section) != 0 {
//            return MuseumAppViewMasterPackets.packetLocation![section]
//        }
//        return nil
        return MuseumAppViewMasterPackets.packetCategory![section]
    }
  
    
}
