//
//  CartViewController.swift
//  RayBabyDemo
//
//  Created by Abhishek Binniwale on 10/06/19.
//  Copyright © 2019 Abhishek Binniwale. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var totalItemsCount: UILabel!
    
    @IBOutlet weak var cartTotal: UILabel!
    var products : [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cartTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        self.setUpUI()
    }
    
    func setUpUI(){
        products = ProductManager.shared.productInCart
        self.cartTableView.reloadData()
        let price = self.products.reduce(0) { (x, model) -> Int in
            return x + model.productPrice
        }
        self.cartTotal.text = "\(price) ₹"
        self.totalItemsCount.text = "\(self.products.count)"
    }

}

extension CartViewController : UITabBarDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return products.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.cartTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell {
            let product = self.products[indexPath.row]
            cell.configureCell(product: product)
            cell.addTOCartButton.isHidden = true
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ProductManager.shared.productInCart.remove(at: indexPath.row)
            self.setUpUI()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
}
