MEDIA PLAYER SWIFT
=====================

Media Player Used to Play Mp3 and Video Locale and http streaming
----------------------------------

** Importing Packages **
> 1) import AVFoundation
>
> 2) import MediaPlayer

---------------

Screenshot
==========
**Currently these methods are available**


![Screenshot](http://i.imgur.com/WKw6teu.png)

----------

![Screenshot](http://i.imgur.com/4fHOfH1.jpg)



Sample code
-----------

**PLAY MP3**

	let url_mp3 = NSURL("htp://kocakpedia.com/netral-garuda-di-dadaku.mp3")
    
    playerItem = AVPlayerItem(URL: url_mp3!)
    player = AVPlayer(playerItem: playerItem!)
    let playerLayer:AVPlayerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = CGRectMake(0, 0, 300, 50)
    self.view.layer.addSublayer(playerLayer)

    if self.player?.rate == 0 {
            self.player?.play()
    }
    else {
        self.player?.pause()
    }

**PLAY VIDEO**
	
	 let url = url_video!
            
    self.moviePlayer = MPMoviePlayerController(contentURL: url)
    self.view.addSubview(self.moviePlayer.view)
    self.moviePlayer.fullscreen = true
    self.moviePlayer.controlStyle = MPMovieControlStyle.Embedded







