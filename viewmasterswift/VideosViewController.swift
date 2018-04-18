//
//  VideosViewController.swift
//  ViewMasterSwift
//
//  Created by Brogan Crist on 4/18/18.
//  Copyright © 2018 Robert England. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideosViewController: UIViewController {
    
    @IBOutlet weak var videoCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func playVideo(_ sender: UIButton) {
        guard let path = Bundle.main.path(forResource: sender.accessibilityIdentifier, ofType:"m4v") else {
            debugPrint("museumTrailer.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: false) {
            player.play()
        }
    }
}
