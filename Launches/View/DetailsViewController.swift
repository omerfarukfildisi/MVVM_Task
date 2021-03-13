//
//  DetailsViewController.swift
//  Launches
//
//  Created by Ömer Fildişi on 13.03.2021.
//

import UIKit

class DetailsViewController: UIViewController {

   
    @IBOutlet weak var missionPatch: UIImageView!
    @IBOutlet weak var detail: UITextView!
    
    var launchDetail: Launch?
    var photo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage(from: launchDetail?.links.mission_patch ?? "https://marka-logo.com/wp-content/uploads/2020/09/SpaceX-Logo-675x380.png")
        detail.text = launchDetail?.details
        
        // Do any additional setup after loading the view.
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.missionPatch.image = image
            }
        }
    }
    

}
