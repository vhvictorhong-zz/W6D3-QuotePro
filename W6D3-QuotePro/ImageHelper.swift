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
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(self.getDate()).png")
        print(paths)
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        
        return paths
        
    }
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func loadImage(imagePathString: String) -> UIImage? {
        
        let fileManager = FileManager.default
        let imagePath = (self.getDirectoryPath() as NSString).appendingPathComponent("\(imagePathString).png")
        print(imagePath)
        if fileManager.fileExists(atPath: imagePath){
            
            return UIImage(contentsOfFile: imagePath)!
            
        }else{
            
            print("No Image")
            return nil
        }
        
    }
        
}
