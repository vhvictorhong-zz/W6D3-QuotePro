//
//  DataManager.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol DataProtocol {
    
    func gotQuoteText(quoteText: String)
    func gotQuoteAuthor(quoteAuthor: String)
    func gotImage(image: UIImage)
    
}

class DataManager: NSObject {

    var dataDelegate: DataProtocol?
    let urlStringQuote = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
    
    func getRandomQuote() {
        
        Alamofire.request(urlStringQuote).responseJSON { response in

            if let JSON = response.result.value {
                
                if let quoteDictionary = JSON as? [String: AnyObject] {
                    
                    if let quoteText = quoteDictionary["quoteText"] as? String {
                        
                        print(quoteText)
                        self.dataDelegate?.gotQuoteText(quoteText: quoteText)
                        
                    }
                    
                    if let quoteAuthor = quoteDictionary["quoteAuthor"] as? String {
                        
                        print(quoteAuthor)
                        self.dataDelegate?.gotQuoteAuthor(quoteAuthor: quoteAuthor)
                        
                    }
                    
                }
            }
            
        }
        
    }
    
    let urlStringImageInfo = "https://unsplash.it/200/300/?random"
    
    func getImageInfo() {
        
        Alamofire.request(urlStringImageInfo).responseImage { response in
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                
                self.dataDelegate?.gotImage(image: image)
                
            }
            
            
        }
        
        
    }
   
    
}
