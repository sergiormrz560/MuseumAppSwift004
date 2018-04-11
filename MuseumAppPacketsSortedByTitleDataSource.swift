//
//  MuseumAppPacketsSortedByTitleDataSource.swift
//  ViewMasterSwift
//
//  Created by M Vu, B Crist, and S Ramirez Martin on 3/11/18.
//  Copyright (c) 2018 M Vu, B Crist, and S Ramirez Martin. All rights reserved.
//
//  Description: Provides the table view data for the packets sorted by name
//

import UIKit

// Note: Thie *automatically* picks up UITableDataSource protocol through
//    MuseumAppPacketsTableDataSourceProtocol

class MuseumAppPacketsSortedByTitleDataSource: NSObject, MuseumAppPacketsTableDataSourceProtocol {
 
    //// Protocol methods to comply with "MuseumAppPacketsDataSource" protocol
    
    // Getters for properties for navagation and tab bars
    var name: String {
        get {
            return "Title"
        }
    }
    var navigationBarName: String {
        get {
            return "Packets Sorted by Title"
        }
    }
    var tabBarImage: UIImage {
        get {
            return UIImage(named: "TabTitle.png")!
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

        let firstLetter = MuseumAppViewMasterPackets.packetTitleIndexArray![indexPath.section]
//        print("firstLetter is \(firstLetter)")
//        firstLetter = "E"
//        print("firstLetter is now \(firstLetter)")
        let packetsWithSameFirstLetter = MuseumAppViewMasterPackets.packetsWithInitialLetter(letter: firstLetter)
        return packetsWithSameFirstLetter![indexPath.row]

    /*
        return MuseumAppViewMasterPackets.sharedViewMasterPackets().packetsWithInitialLetter(MuseumAppViewMasterPackets.sharedViewMasterPackets().packetTitleIndexArray[indexPath.section])![indexPath.row]
 */
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
    
    // (changed func name via TheElements, swift edition)
    func numberOfSections(in tableView: UITableView) -> Int {
   //     print("numberOfSectionsInTableView is \(MuseumAppViewMasterPackets.packetTitleIndexArray!.count)")
        // The number of different sections in thei table depends on the number of different first letters
        return MuseumAppViewMasterPackets.packetTitleIndexArray!.count
    }
    
    // (another func name update)
//    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        // Returns the array of section titles --- these are just the first letters that
        //    occur in any packet title in the data set
        // NOTE: "title" here is the title of a table section, *not* the title of a packet!
//        return MuseumAppViewMasterPackets.packetTitleIndexArray! as [AnyObject]
        return MuseumAppViewMasterPackets.packetTitleIndexArray!
    }
  
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        // Supposedly, you send me a section title (letter) and its index number, and I send you back
        //    the index number (what??!)
        return index
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //       print("numberOfRowsInSection \(section)")
        // The section corresponds to the first letter of the packet title
        // Grab that letter out of the array of packet title index letters
        let initialLetter = MuseumAppViewMasterPackets.packetTitleIndexArray![section]
 //       println(" initial letter \(initialLetter)")
        
        // Now get the array of packets whose titles start with that letter
        let packetsWithInitialPacketTitleLetter = MuseumAppViewMasterPackets.packetsWithInitialLetter(letter: initialLetter)
        // Return how many there are that start with this letter
        if packetsWithInitialPacketTitleLetter != nil {
 //           println("Number of rows in \(initialLetter) section is \(packetsWithInitialPacketTitleLetter!.count)")
            return packetsWithInitialPacketTitleLetter!.count
        }
        else {
 //           println("whoops!")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // This table has multiple sections, per each initial letter of the packet titles
        // Return the letter that corressponds to the requested section
        // [From Elements project files comments:]
        //    "This is actually a delegate method, but we forward the request to the datasource in the view controller"
        return MuseumAppViewMasterPackets.packetTitleIndexArray![section]
    }
  
    
}
