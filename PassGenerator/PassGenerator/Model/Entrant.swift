//
//  Entrant.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

protocol Entrant {
    func swipe(_ pass: AmusementParkPass, on area: AreaAccess)
    func swipe(_ pass: AmusementParkPass, for area: RideAccess)
}


