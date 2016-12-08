//
//  HomeViewController.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Storyboard properties
    @IBOutlet weak var tableView: UITableView!
    
    //Core Data
    var context: NSManagedObjectContext?
    var appDelegate = AppDelegate()
    
    //Initialize instance
    var imageHelper = ImageHelper()
    
    //Properties
    var mediaQuoteArray = [(imagePath: String, quoteText: String, quoteAuthor: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchData()
        
        tableView.reloadData()
        
    }
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mediaQuoteArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        //Configure cell
        cell.cellQuoteLabel.text = mediaQuoteArray[indexPath.row].quoteText
        cell.cellAuthorLabel.text = mediaQuoteArray[indexPath.row].quoteAuthor
        cell.cellImageView.image = imageHelper.loadImage(imagePathString: mediaQuoteArray[indexPath.row].imagePath)
        
        return cell
        
    }
    
    func fetchData() {
        
        mediaQuoteArray.removeAll()
        
        self.context = self.appDelegate.persistentContainer.viewContext
        let mediaQuoteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "MediaQuote")
        
        do {
            let fetchedMediaQuotes = try self.context?.fetch(mediaQuoteFetch) as! [MediaQuote]
            for mediaQuote in fetchedMediaQuotes {
                //                print(mediaQuote.imagePath)
                //                print(mediaQuote.quoteText)
                //                print(mediaQuote.quoteAuthor)
                mediaQuoteArray.append((imagePath: mediaQuote.imagePath!, quoteText: mediaQuote.quoteText!, quoteAuthor: mediaQuote.quoteAuthor!))
            }
        } catch {
            fatalError("Failed to fetch MediaQuote: \(error)")
        }
        
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
