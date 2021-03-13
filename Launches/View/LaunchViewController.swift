//
//  ViewController.swift
//  Launches
//
//  Created by Ömer Fildişi on 13.03.2021.
//

import UIKit

class LaunchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        
    
    private var launchListViewModel: LaunchListViewModel!
    var launch: [Launch] = [Launch]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getData()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(filterButtonClicked))
    }
    
    private func getData() {
              
         let url = URL(string: "https://api.spacexdata.com/v2/launches")!
         
         Webservice().downloadLaunches(url: url) { launch in
            if launch != nil {
                self.launchListViewModel = LaunchListViewModel(launchList: launch!)
                self.launch = launch!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
             }
         }
         
     }
    
    @objc func filterButtonClicked(){
        
            
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.launchListViewModel == nil ? 0 : self.launchListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "launchCell", for: indexPath) as! LaunchTableViewCell
        
        let launchViewModel = self.launchListViewModel.launchAtIndex(indexPath.row)
        
        cell.missionName.text = launchViewModel.missionName
        cell.launchYear.text = launchViewModel.launchYear
        cell.launchSucces.text = launchViewModel.launchSucces ? "Launch Successful" : "Launch Failed"
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: launch[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailsVC" {
                let destination = segue.destination as! DetailsViewController
                destination.launchDetail = sender as? Launch
                
            }

}
    
}


