//
//  QuoteBuilderViewController.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 07/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataManager.getRandomQuote()
        
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
