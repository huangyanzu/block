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
    @IBAction func addPerson(_ sender: Any) {
        
        print("aaaaa")
        
        performSegue(withIdentifier: "listToDetail", sender: nil)
        
      
        
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        
     
        
        return cell 
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "listToDetail", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let vc = segue.destination as! DetailViewController
        
        if let indexPath = sender as? IndexPath{
            
            vc.person = personList[indexPath.row]
            vc.completionCallBack = {
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }else{
            vc.completionCallBack = { [weak vc] in
                
                guard let p = vc?.person else{
                    return
                }
                
                self.personList.insert(p, at: 0)
                
                self.tableView.reloadData()
                
                
            }
        }
        
        
    }
    
    

}
