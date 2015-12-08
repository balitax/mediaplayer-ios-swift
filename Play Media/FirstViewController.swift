//
//  FirstViewController.swift
//  Play Media
//
//  Created by Agus Cahyono on 12/7/15.
//  Copyright © 2015 Agus Cahyono. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mp3Model: [PlayMp3Model] = []
    var mp3Selected = PlayMp3Model()
    
    var playerItem: AVPlayerItem?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.brownColor()]
        
        // Make List MP3
        
        //1
        let mp31 = PlayMp3Model()
        mp31._namaMp3 = "Anggun S C Sasmi - Mimpi"
        mp31._urlMp3 = "http://kocakpedia.com/anggun-c-sasmi-Mimpi.mp3"
        mp3Model.append(mp31)
        
        //2
        let mp32 = PlayMp3Model()
        mp32._namaMp3 = "Andra And The Backbone - Sempurna"
        mp32._urlMp3 = "http://kocakpedia.com/andra-and-the-backbone-Sempurna.mp3"
        mp3Model.append(mp32)
        
        //2
        let mp33 = PlayMp3Model()
        mp33._namaMp3 = "Netral - Garuda Di Dadaku"
        mp33._urlMp3 = "htp://kocakpedia.com/netral-garuda-di-dadaku.mp3"
        mp3Model.append(mp33)
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mp3Model.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let mp3Cell = tableView.dequeueReusableCellWithIdentifier("playmp3Identifier", forIndexPath: indexPath) as! PlayMP3Cell
        mp3Cell.namaMp3.text = mp3Model[indexPath.row]._namaMp3
        mp3Cell.layoutMargins = UIEdgeInsetsZero
        mp3Cell.preservesSuperviewLayoutMargins = false
        return mp3Cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.mp3Selected = self.mp3Model[indexPath.row]
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let url_mp3 = NSURL(string: self.mp3Model[indexPath.row]._urlMp3)
        
        playerItem = AVPlayerItem(URL: url_mp3!)
        player = AVPlayer(playerItem: playerItem!)
        let playerLayer:AVPlayerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRectMake(0, 0, 300, 50)
        self.view.layer.addSublayer(playerLayer)
        
        let deleting = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Play", handler: { (action, indexPath) -> Void in
            
            if self.player?.rate == 0 {
                self.player?.play()
            }
            else {
                self.player?.pause()
            }
            
            print(url_mp3!)
            
        })
        deleting.backgroundColor = UIColor.greenColor()
        
        let pause = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Pause", handler: { (action, indexPath) -> Void in
            self.player?.pause()
            print(url_mp3!)
            
        })
        
        pause.backgroundColor = UIColor.lightGrayColor()
        
        let arrayofactions: Array = [deleting, pause]
        
        return arrayofactions
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

























































