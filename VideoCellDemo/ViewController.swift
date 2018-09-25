//
//  ViewController.swift
//  VideoCellDemo
//
//  Created by SOTSYS024 on 21/09/18.
//  Copyright © 2018 digicom. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    let count = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoPlayerCell
        
        
//        let playerItem = AVPlayerItem(url: url!)
        
//        let playerLayer = AVPlayerLayer(player: player)

        if cell.playerView.player == nil {
            let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            let player = AVPlayer(url: url!)
            cell.playerView.playerLayer.player = player
            
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let tableView = scrollView as? UITableView {
            findCellandPlay(tableView: tableView)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let tableView = scrollView as? UITableView {
            findCellandPlay(tableView: tableView)
        }
    }
    
    func findCellandPlay(tableView: UITableView) {
        for cell in tableView.visibleCells {
            (cell as! VideoPlayerCell).playerView.player?.pause()
            NotificationCenter.default.removeObserver((cell as! VideoPlayerCell).playerView)
            
        }
        
        let cell = tableView.visibleCells[tableView.visibleCells.count/2] as! VideoPlayerCell
        let indexPath = tableView.indexPathsForVisibleRows![tableView.indexPathsForVisibleRows!.count/2]
        print(indexPath.row)
        cell.playerView.player!.play()
        NotificationCenter.default.addObserver(cell.playerView, selector: #selector(cell.playerView.play), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
}

