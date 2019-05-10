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
    
    static func playCorrectSystemSound() {
        let path = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")!
        let soundURL = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctSound)
        AudioServicesPlaySystemSound(correctSound)
    }
    
    static func playInCorrectSystemSound() {
        let path = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")!
        let soundURL = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &incorrectSound)
        AudioServicesPlaySystemSound(incorrectSound)
    }
}
