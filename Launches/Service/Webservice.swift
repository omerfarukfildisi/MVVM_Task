//
//  WebService.swift
//  Launches
//
//  Created by Ömer Fildişi on 13.03.2021.
//

import Foundation

class Webservice {
    
    func downloadLaunches(url: URL, completion: @escaping ([Launch]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                    let launchList = try? JSONDecoder().decode([Launch].self, from: data)                    
                    if let launchList = launchList {
                        completion(launchList)
                    }
                    
                }
            
        }.resume()
        
    }
    
}
