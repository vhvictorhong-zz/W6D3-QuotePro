//
//  DataManager.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit
import Alamofire

class DataManager: NSObject {

    let urlString = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
    
    func getRandomQuote() {
        
        Alamofire.request(urlString).responseJSON { response in

            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                
                if let quoteDictionary = JSON as? [String: AnyObject] {
                    
                    if let quoteText = quoteDictionary["quoteText"] as? String {
                        
                        print(quoteText)
                        
                    }
                    
                    if let quoteAuthor = quoteDictionary["quoteAuthor"] as? String {
                        
                        print(quoteAuthor)
                        
                    }
                    
                }
            }
            
        }
        
    }
    
    
   
    
}
