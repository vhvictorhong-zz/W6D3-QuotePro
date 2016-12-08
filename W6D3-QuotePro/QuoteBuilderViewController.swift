//
//  QuoteBuilderViewController.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit
import CoreData

class QuoteBuilderViewController: UIViewController, DataProtocol {

    //Storyboard properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    //Core data
    var context: NSManagedObjectContext?
    var appDelegate = AppDelegate()
    
    //Initialize instance
    var dataManager = DataManager()
    var imageHelper = ImageHelper()
    
    //Properties
    var quoteAuthor = ""
    var quoteText = ""
    var quoteImage: UIImage?
    var imagePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataManager.dataDelegate = self
        self.context = self.appDelegate.persistentContainer.viewContext
        
    }
    
    //MARK: - DataProtocol
    
    func gotQuoteAuthor(quoteAuthor: String) {
        
        self.quoteAuthor = quoteAuthor
        authorLabel.text = quoteAuthor
        
    }

    func gotQuoteText(quoteText: String) {
        
        self.quoteText = quoteText
        quoteLabel.text = quoteText
        
    }
    
    func gotImage(image: UIImage) {
        
        self.quoteImage = image
        imageView.image = image
        self.imagePath = imageHelper.saveImage(image: image)
        
    }
    
    //MARK: - QuoteBuilderVC Action
    

    @IBAction func getRandomImageButton(_ sender: UIBarButtonItem) {
        
        dataManager.getImageInfo()
        
    }
    
    @IBAction func getRandomQuoteButton(_ sender: UIBarButtonItem) {
        
        dataManager.getRandomQuote()
        
    }

    @IBAction func saveImageButtom(_ sender: UIBarButtonItem) {
        
        if !self.quoteAuthor.isEmpty && !self.quoteText.isEmpty && !self.imagePath.isEmpty {
            
            let mediaQuote = NSEntityDescription.insertNewObject(forEntityName: "MediaQuote", into: self.context!) as! MediaQuote
            
            mediaQuote.quoteAuthor = self.quoteAuthor
            mediaQuote.quoteText = self.quoteText
            mediaQuote.imagePath = self.imagePath
            
            do {
                try self.context?.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
