//
//  Error.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

enum PassError: String, Error {
    case firstNameMissing = "Please provide the first name of entrant"
    case lastNameMissing = "Please provide the last name of entrant"
    case dateOfBirthMissing = "Please provide date of Birth of entrant"
    case streetAddressMissing = "Please provide streetAddress of entrant"
    case cityMissing = "Please provide city of entrant"
    case stateMissing = "Please provide state of entrant"
    case zipcodeMissing = "Please provide zip code of entrant"
    case invalidDateOfBirth = "Please provide appropriate Date of Birth"
    case companyMissing = "Please provide company"
    case projectMissing = "Please provide project"
    case invalidPass
}
