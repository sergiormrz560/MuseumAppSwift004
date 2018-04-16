//
//  TrailerViewController.swift
//  ViewMasterSwift
//
//  Created by Sergio R Martin on 4/11/18.
//  Copyright © 2018 Robert England. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class HomeViewController: UIViewController {

    @IBOutlet weak var hider: UILabel!
    
    static var num = 0
    
    //static var played = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if HomeViewController.num != 0 {
            self.hider.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if HomeViewController.num == 0 {
            playVideo()
            HomeViewController.num = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.hider.isHidden = true
            }
        }
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "museumTrailer", ofType:"m4v") else {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
