//
//  ViewController.swift
//  InClass03
//
//  Created by Kabra, Sunidhi on 10/25/18.
//  Copyright © 2018 Kabra, Sunidhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data1 = AppsData()
    var title1 = ""
    
    
    
    @IBOutlet weak var tableForTitles: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel        
        label.text = data1.titles[indexPath.row]
     
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        title1 = data1.titles[indexPath.row]
        
        self.performSegue(withIdentifier: "goToNextSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNextSegue"{
            let vc = segue.destination as! ViewController2
            vc.title2 = title1
        }
        
   }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
    }


}

