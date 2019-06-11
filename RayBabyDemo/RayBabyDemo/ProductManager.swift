//
//  ProductManager.swift
//  RayBabyDemo
//
//  Created by Abhishek Binniwale on 10/06/19.
//  Copyright © 2019 Abhishek Binniwale. All rights reserved.
//

import Foundation

class ProductManager {
    
    static var shared = ProductManager()
    
    var productList : [ProductModel] = []
    var productInCart : [ProductModel] = []
    private init(){ }
    
    
    
}
