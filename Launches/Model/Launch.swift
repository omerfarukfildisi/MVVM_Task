//
//  Launches.swift
//  Launches
//
//  Created by Ömer Fildişi on 13.03.2021.
//

import Foundation

struct Launch : Decodable {
    
    var mission_name : String?
    var launch_year : String?
    var links :  Links
    var details : String?
    var rocket : Rocket
    var launch_success : Bool?
    
}

struct Links : Decodable {
    
    let  mission_patch : String?
    
    
}

struct Rocket : Decodable {
    var  rocket_name : String?
}
