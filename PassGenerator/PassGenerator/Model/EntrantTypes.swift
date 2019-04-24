//
//  Entrant.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

enum PassType {
    case classic
    case vip
    case child
    case season
    case senior
    case manager
    case foodService
    case rideService
    case maintenance
    case contract(project: Int)
    case vendor(company: String)
}

extension PassType {
    func areaAccess() -> [AreaAccess] {
        switch self {
        case .child, .classic, .vip, .season, .senior: return [.amusement]
        case .foodService: return [.amusement, .kitchen]
        case .rideService, .contract(project: 1001): return [.amusement, .rideControl]
        case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
        case .contract(project: 1002) : return [.amusement, .rideControl, .maintenance]
        case .contract(project: 1003): return [.amusement, .rideControl, .kitchen, .office]
        case .contract(project: 2001): return [.office]
        case .contract(project: 2002): return [.kitchen, .maintenance]
        case .vendor(company: "Acme"): return [.kitchen, .maintenance]
        case .vendor(company: "Orkin"): return [.amusement, .rideControl, .kitchen]
        case .vendor(company: "Fedex"): return [.maintenance, .office]
        case .vendor(company: "NW Eletrical"), .manager: return [.amusement, .rideControl, .kitchen, .maintenance, .office]
        default: return []
        }
    }
    
    func rideAccess() -> [RideAccess] {
        switch self {
        case .vip, .senior, .season: return [.allRides, .skipAllLines]
        case .foodService, .rideService, .maintenance, .manager, .child, .classic: return [.allRides]
        default: return []
        }
    }
    
    func discounts() -> [Discounts] {
        switch self {
        case .vip, .season: return [.food(percentage: 10), .merchandise(percentage: 20)]
        case .senior: return [.food(percentage: 10), .merchandise(percentage: 10)]
        case .foodService, .rideService, .maintenance: return [.food(percentage: 15), .merchandise(percentage: 25)]
        case.manager: return [.food(percentage: 25), .merchandise(percentage: 25)]
        case .child, .classic: return []
        default: return []
        }
    }
}
