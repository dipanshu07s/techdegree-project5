//
//  Entrant.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

protocol Entrant {
    var passType: PassType? { get }
    func swipe(_ pass: AmusementParkPass, on area: AreaAccess) -> Bool
    func swipe(_ pass: AmusementParkPass, for area: RideAccess) -> Bool
    func swipe(_ pass: AmusementParkPass, for discount: Discounts) -> Bool
}


