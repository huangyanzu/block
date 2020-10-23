//
//  DetailViewController.swift
//  block
//
//  Created by aZu on 2020/10/22.
//

import UIKit

class DetailViewController: UITableViewController {

    
    var person : Person?
    
    var completionCallBack:(()->())?
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var jobText: UITextField!
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
   
        if person != nil {
           nameText.text = person?.name
           phoneText.text = person?.phone
           jobText.text = person?.job
        }
      
        
        
        
    }

    @IBAction func saveAction(_ sender: Any) {
        
        if person == nil {
            person = Person()
        }
        
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.job = jobText.text
        
        completionCallBack?()
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
