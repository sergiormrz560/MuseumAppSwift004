//
//  MuseumAppPacketsCollectionDataSourceProtocol.swift
//  ViewMasterSwift
//
//  Created by M Vu, B Crist, and S Ramirez Martin on 3/11/18.
//  Copyright (c) 2018 M Vu, B Crist, and S Ramirez Martin. All rights reserved.
//

import UIKit

protocol MuseumAppPacketsCollectionDataSourceProtocol : UICollectionViewDataSource {
    
    // These properties are used by the view controller for the navagation bar and tab
    var name :String { get }
    var navigationBarName: String { get }
    var tabBarImage: UIImage { get }
    
    // This property determines the style of table view to be displayed
//    var tableViewStyle: UITableViewStyle { get }
    
    // This method provides a standardized way of asking for the packet at a
    //    specific index path, regardless of the sorting or display technique
    //    for the particular datasource
    func packetForindexPath(indexPath: NSIndexPath) -> MuseumAppPacket
    
    // [Optional:] This method allows the datasource to report the section header title,
    //    for those that have sections
    // (Note: Tough to make this "optional" in Swift! Instances that don't want to implement
    //        this will still need to return the empty string, for now)
    func titleForHeaderInSection(tableView: UITableView, section: Int) -> String
    
}
