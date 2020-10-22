//
//  ListViewController.swift
//  block
//
//  Created by aZu on 2020/10/22.
//

import UIKit

class ListViewController: UITableViewController {

    var personList = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData { list in
            
            self.personList += list
            
            self.tableView.reloadData()
            
            
            
        }
    }

    // MARK: - Table view data source

    private func loadData(completion:@escaping(_ list:[Person])->())->(){
        
        
        DispatchQueue.global().async {
            
            Thread.sleep(forTimeInterval: 1)
            
            var arrayM = [Person]()
            
            for i in 0..<20 {
                
                let p = Person()
                
                p.name = "a - \(i)"
                p.phone = "1860" + String(format: "%06d", arc4random_uniform(1000000))
                p.job = "boss"
                
                arrayM.append(p)
                
                
            }
            
            DispatchQueue.main.async {
                
                completion(arrayM)
                
                
            }
            
            
            
            
        }
        
        
        
        
    }

}
