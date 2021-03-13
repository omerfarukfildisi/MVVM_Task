//
//  LaunchViewModel.swift
//  Launches
//
//  Created by Ömer Fildişi on 13.03.2021.
//

import Foundation

struct LaunchListViewModel {
    
    let launchList : [Launch]
    
    func numberOfRowsInSection() -> Int {
    
     return self.launchList.count
 }
    func launchAtIndex(_ index: Int) -> launchViewModel {
        let launch = self.launchList[index]
        return launchViewModel(launch)
    }
    
}

struct launchViewModel {
    
    let launch : Launch
    
    init(_ launch: Launch) {
            self.launch = launch
        }
        
        var missionName: String {
            return self.launch.mission_name ?? "none"
        }
        
        var launchYear: String {
            return self.launch.launch_year ?? "none"
        }
        
        var launchSucces: Bool {
        return self.launch.launch_success ?? false
    }
    
}
