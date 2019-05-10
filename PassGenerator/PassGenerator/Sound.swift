//
//  Sound.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 10/05/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation
import AudioToolbox

class SoundEffect {
    static var correctSound: SystemSoundID = 0
    static var incorrectSound: SystemSoundID = 0
    
    static func loadCorrectSystemSound() {
        let path = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")!
        let soundURL = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctSound)
    }
    
    static func loadInCorrectSystemSound() {
        let path = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")!
        let soundURL = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &incorrectSound)
    }
    
    static func playSound(with systemID: SystemSoundID) {
        AudioServicesPlaySystemSound(systemID)
    }
}
