//
//  ProductTableViewCell.swift
//  RayBabyDemo
//
//  Created by Abhishek Binniwale on 10/06/19.
//  Copyright © 2019 Abhishek Binniwale. All rights reserved.
//

import UIKit

protocol AddToCartDelegate {
    func addToCartPressed(index : Int)
}

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var addTOCartButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    var addToCartDelegate : AddToCartDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(product : ProductModel){
        self.productTitle.text = product.productTitle
        self.productPrice.text = "Price : \(product.productPrice) ₹"
        self.productImage.image = UIImage(named: "\(product.productTitle)")
    }
    
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        self.addToCartDelegate.addToCartPressed(index: sender.tag)
    }
    
    
}
