//
//  QuoteView.swift
//  W6D3-QuotePro
//
//  Created by Victor Hong on 08/12/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupNib(image: UIImage, quote: String, author: String) {
        self.quoteImageView.image = image
        self.quoteLabel.text = quote
        self.authorLabel.text = author
    }
    
    class func instanceFromNib() -> QuoteView {
        
        return (UINib(nibName: "QuoteView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! QuoteView)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
