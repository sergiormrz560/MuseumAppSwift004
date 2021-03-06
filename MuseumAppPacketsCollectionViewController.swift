//
//  MuseumAppPacketsCollectionViewController.swift
//  ViewMasterSwift
//
//  Created by M Vu, B Crist, and S Ramirez Martin on 3/11/18.
//  Copyright (c) 2018 M Vu, B Crist, and S Ramirez Martin. All rights reserved.
//

import UIKit


class MuseumAppPacketsCollectionViewController : UICollectionViewController {
    var dataSource : MuseumAppPacketsCollectionDataSourceProtocol? {
      didSet {
        
            // Set the title and tab bar images from the dataSource object
            // They have to be there because of the MuseumAppPacketDataSourceProtocol
            self.title = self.dataSource!.name
            self.tabBarItem.image = self.dataSource!.tabBarImage
            
            // Set the long name shown in the navigation bar
            self.navigationItem.title = self.dataSource!.navigationBarName

        }
    }
    
    required init (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [From doc:] "The number of table rows at which to display the index list on the right edge of the table."
//        self.tableView.sectionIndexMinimumDisplayRowCount = 10
//        self.tableView.delegate = self
//        self.tableView.dataSource = self.dataSource!
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self.dataSource
        
        
        // Create a custom navigation bar button and set it to always say "Packets"
        let tempBarButtonItem = UIBarButtonItem()
        tempBarButtonItem.title = "See All"
        self.navigationItem.backBarButtonItem = tempBarButtonItem
    }
    
    // [Next method: In TheElements, but not in the template...]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Force the tableview to reload
//        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Get the new view controller using segue.destinationViewController
    // Pass the selected object to the new view controller
    // prepareForSegue...
    
    // Google: "swift prepareforsegue"
    //https://stackoverflow.com/questions/44790918/swift-prepareforsegue-not-working
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            // Google: "swift indexpathforselecteditem"
            // https://developer.apple.com/documentation/uikit/uicollectionview/1618099-indexpathsforselecteditems
            let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first as NSIndexPath?
            
            // Find the corresponding view controller
            let aPacket = dataSource!.packetForindexPath(indexPath: selectedIndexPath!)
            let viewController: MuseumAppPacketViewController? = segue.destination as? MuseumAppPacketViewController
            
            if viewController != nil {
                // Hide the bottom tab bar when we push this new view controller
                viewController!.hidesBottomBarWhenPushed = true
            
                // Pass the packet to this view controller
                viewController!.myPacket = aPacket
            }
        }
    }
    
    @IBAction func goHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "goHome2", sender: nil)
    }
}



