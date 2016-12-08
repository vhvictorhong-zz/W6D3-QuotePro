//
//  ImageHelper.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class ImageHelper: NSObject {
    
    func getDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "ss.hh.dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    func saveImage(image: UIImage) -> String {
        
        let fileManager = FileManager.default
        let imagePath = "\(getDate()).png"
        let paths = (NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imagePath)
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        
        return imagePath
        
    }
    
    func loadImage(imagePathString: String) -> UIImage? {
        
        let fileManager = FileManager.default
        
        let paths = (NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imagePathString)
        
        if fileManager.fileExists(atPath: paths){
            
            return UIImage(contentsOfFile: paths)!
            
        }else{
            
            print("No Image")
            return nil
        }
        
    }
        
}
