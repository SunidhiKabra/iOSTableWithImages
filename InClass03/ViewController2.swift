//
//  ViewController2.swift
//  InClass03
//
//  Created by Kabra, Sunidhi on 10/31/18.
//  Copyright © 2018 Kabra, Sunidhi. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
        var title2: String = ""
    
    let data2 = AppsData()
    var object: ModelClass?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array1 = data2.getAllDetails(t: title2)
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let title = cell.viewWithTag(1) as! UILabel
        let developerName = cell.viewWithTag(2) as! UILabel
        let releaseDate = cell.viewWithTag(3) as! UILabel
        let price = cell.viewWithTag(4) as! UILabel
        let img = cell.viewWithTag(5) as! UIImageView
        
        let array2 = data2.getAllDetails(t: title2)
        
        title.text = array2[indexPath.row].title
        developerName.text = array2[indexPath.row].developer
        releaseDate.text = String(convertDateFormatter(date: (array2[indexPath.row].date)!))
        price.text = array2[indexPath.row].price
        
        let imageUrlString = array2[indexPath.row].imgSmall
        let imageUrl:URL = URL(string: imageUrlString!)!
        
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            
            
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                img.image = image
                img.contentMode = UIView.ContentMode.scaleAspectFit
            }
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        object = data2.getAllDetails(t: title2)[indexPath.row]
        
        self.performSegue(withIdentifier: "segueAppDetails", sender: self)
//        print(object)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAppDetails"{
            let vc1 = segue.destination as! AppDetailsViewController
            vc1.object1 = object
        }
    }
    
    func convertDateFormatter(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "yyyy MMM HH:mm EEEE"///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
//        print(title2)
    }
        
    

}
