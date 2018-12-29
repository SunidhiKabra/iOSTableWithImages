//
//  AppDetailsViewController.swift
//  InClass03
//
//  Created by Kabra, Sunidhi on 10/31/18.
//  Copyright © 2018 Kabra, Sunidhi. All rights reserved.
//

import UIKit

class AppDetailsViewController: UIViewController {

    var object1 : ModelClass?
    
    @IBOutlet weak var close: UIBarButtonItem!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var developerName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTitle.text = object1?.title
        developerName.text = object1?.developer
        releaseDate.text = String(convertDateFormatter(date: (object1?.date)!))
        price.text = object1?.price
        
        let imageUrlString = object1?.imgLarge
        let imageUrl:URL = URL(string: imageUrlString!)!
        
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            
            
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                self.image.image = image
                self.image.contentMode = UIView.ContentMode.scaleAspectFit
            }
        }
        
    }
    

    @IBAction func onClickClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

}
