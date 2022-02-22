//
//  soundPlayer.swift
//  timerArrange
//
//  Created by かんべみさき on 2022/02/21.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    
    let getUpDate = NSDataAsset(name:"getUp")!.data
    
    
    var getUpPlayer:AVAudioPlayer!
    
    func getUpPlay() {
        do{
        getUpPlayer = try AVAudioPlayer(data:getUpDate)
        
        getUpPlayer.play()
        
        } catch {
    
         print("再生できませんでした")
        
    }

    }
    
}

