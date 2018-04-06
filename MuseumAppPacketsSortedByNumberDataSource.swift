//
//  MuseumAppPacketsSortedByNumberDataSource.swift
//  ViewMasterSwift
//
//  Created by Robert England on 3/11/18.
//  Copyright (c) 2018 Robert England. All rights reserved.
//
//  Description: Provides the table view data for the packets sorted by number
//

import UIKit

// Note: Thie *automatically* picks up UITableDataSource protocol through
//    MuseumAppPacketsTableDataSourceProtocol

class MuseumAppPacketsSortedByDateDataSource: NSObject, MuseumAppPacketsTableDataSourceProtocol {
    
    //// Protocol methods to comply with "MuseumAppPacketsDataSource" protocol
    
    // Getters for properties for navagation and tab bars
    var name: String {
        get {
            return "Date"
        }
    }
    var navigationBarName: String {
        get {
            return "Packets Sorted by Date"
        }
    }
    var tabBarImage: UIImage {
        get {
            return UIImage(named: "TabDate.png")!
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //       println("Making a cell...")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuseumAppPacketTableViewCell", for: indexPath) as! MuseumAppPacketTableViewCell
        
        // Set the packet for this cell as indicated by the datasource
        cell.packet = packetForindexPath(indexPath: indexPath as NSIndexPath)
        cell.setNeedsDisplay()
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
  //      println("numberOfSectionsInTableView is \(MuseumAppViewMasterPackets.packetTitleIndexArray!.count)")
        // The numbers table is just one big section
        return 1
    }
    
//    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
//        // The numbers table is juts one big section
//        return MuseumAppViewMasterPackets.packetTitleIndexArray
//    }
  
//    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
//        // Supposedly, you send me a section title (letter) and its index number, and I send you back
//        //    the index number (what??!)
//        return index
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // One big section: Return how many packets there are total
        return MuseumAppViewMasterPackets.packetsSortedByDate!.count
     }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        // This table has multiple sections, per each initial letter of the packet titles
//        // Return the letter that corressponds to the requested section
//        // [From Elements project files comments:]
//        //    "This is actually a delegate method, but we forward the request to the datasource in the view controller"
//        return MuseumAppViewMasterPackets.packetTitleIndexArray![section]
//    }
  
    
}
