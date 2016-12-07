//
//  QuoteBuilderViewController.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController, DataProtocol {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var dataManager = DataManager()
    var quoteAuthor = ""
    var quoteText = ""
    var quoteImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataManager.dataDelegate = self
        
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
        
    }
    
    //MARK: - QuoteBuilderVC Action
    

    @IBAction func getRandomImageButton(_ sender: UIBarButtonItem) {
        
        dataManager.getImageInfo()
        
    }
    
    @IBAction func getRandomQuoteButton(_ sender: UIBarButtonItem) {
        
        dataManager.getRandomQuote()
        
    }

    @IBAction func saveImageButtom(_ sender: UIBarButtonItem) {
        
        
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
