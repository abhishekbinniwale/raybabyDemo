//
//  ProductModel.swift
//  RayBabyDemo
//
//  Created by Abhishek Binniwale on 10/06/19.
//  Copyright © 2019 Abhishek Binniwale. All rights reserved.
//

import Foundation

class ProductModel {
    var productId : Int = 0
    var productTitle : String = ""
    var productPrice : Int = 0
    var isAddedToCart : Bool = false
    
    init(id : Int , title: String , price : Int , addedToCart : Bool) {
        self.productId = id
        self.productTitle = title
        self.productPrice = price
        self.isAddedToCart = addedToCart
    }
}
