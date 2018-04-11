//
//  TrailerViewController.swift
//  ViewMasterSwift
//
//  Created by Minh Vu on 4/10/18.
//  Copyright © 2018 Robert England. All rights reserved.
//

import UIKit
import AVKit


class TrailerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playTouched(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "video2", ofType: "m4v") {
            let video = AVPlayer(url: URL(fileURLWithPath: filePath))
            let videoController = AVPlayerViewController()
            videoController.player = video
            present(videoController, animated: true, completion: {
                video.play()
            })
        }
    }
}
