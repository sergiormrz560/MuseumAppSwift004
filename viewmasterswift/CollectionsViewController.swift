//
//  CollectionsViewController.swift
//  ViewMasterSwift
//
//  Created by Sergio R Martin on 4/16/18.
//  Copyright © 2018 Robert England. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func isMoosnick(_ sender: UIButton) {
        collection = "moosnick"
        callAgain = true
        _ = MuseumAppViewMasterPackets.sharedViewMasterPackets()
        
    }
    
    @IBAction func isOther(_ sender: UIButton) {
        collection = "other"
        callAgain = true
        _ = MuseumAppViewMasterPackets.sharedViewMasterPackets()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
