//
//  SecondViewController.swift
//  Play Media
//
//  Created by Agus Cahyono on 12/7/15.
//  Copyright © 2015 Agus Cahyono. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class SecondViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var videoModel: [PlayVideoModel] = []
    var videoSelected = PlayVideoModel()
    var moviePlayer:MPMoviePlayerController! = MPMoviePlayerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.brownColor()]
        
        // Make List Video
        
        //1
        let video1 = PlayVideoModel()
        video1._namaVideo = "Video Lucu Kucing Bagian 1"
        video1._urlVideo = "http://kocakpedia.com/video-kucing-lucu-1.mp4"
        videoModel.append(video1)
        
        //2
        let video2 = PlayVideoModel()
        video2._namaVideo = "Video Lucu Kucing Bagian 2"
        video2._urlVideo = "http://kocakpedia.com/video-kucing-lucu-2.mp4"
        videoModel.append(video2)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoModel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let videoCell = tableView.dequeueReusableCellWithIdentifier("playvideoIdentifier", forIndexPath: indexPath) as! PlayVideoCell
        videoCell.namaVideo.text = videoModel[indexPath.row]._namaVideo
        videoCell.layoutMargins = UIEdgeInsetsZero
        videoCell.preservesSuperviewLayoutMargins = false
        return videoCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.videoSelected = self.videoModel[indexPath.row]
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let url_video = NSURL(string: self.videoModel[indexPath.row]._urlVideo)
        
        let playing = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Play", handler: { (action, indexPath) -> Void in
            
            let url = url_video!
            
            self.moviePlayer = MPMoviePlayerController(contentURL: url)
            self.view.addSubview(self.moviePlayer.view)
            self.moviePlayer.fullscreen = true
            self.moviePlayer.controlStyle = MPMovieControlStyle.Embedded
            
            print(url)
            
        })
        
        
        let arrayofactions: Array = [playing]
        
        return arrayofactions
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Dispose of any resources that can be recreated.
}