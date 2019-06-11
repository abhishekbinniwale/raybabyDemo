//
//  ProductListViewController.swift
//  RayBabyDemo
//
//  Created by Abhishek Binniwale on 10/06/19.
//  Copyright © 2019 Abhishek Binniwale. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    
    @IBOutlet weak var productListTableView: UITableView!
    var produts : [ProductModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productListTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        ProductManager.shared.productList = self.createProductList()
        self.setUpUI()
    }

    func setUpUI(){
        self.produts = getProductList()
        self.productListTableView.reloadData()
        
    }
    
    func getProductList()-> [ProductModel]{
        return ProductManager.shared.productList
    }
    
    func createProductList()-> [ProductModel]{
        var productTitles = ["Banana" , "Apple" , "Orange" , "Grapes" , "Mangoes","Watermelon" ,"Muskmelon" , "Pineapple" ,"Jackfruit","Pear"]
        var productId : [Int] = [101, 102, 103, 104, 105,106,107,108,109,110]
        var prices = [40 , 150 , 80, 100, 250, 30 , 50, 30, 150, 200]
        var produts : [ProductModel] = []
        for index in 0...9 {
            let product = ProductModel(id : productId[index],title: productTitles[index], price: prices[index], addedToCart: false)
            produts.append(product)
        }
       return produts
    }
    
    
    @IBAction func goToCartAction(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
        self.navigationController?.pushViewController(view!, animated: true)
    }
    

}

extension ProductListViewController : UITableViewDelegate , UITableViewDataSource , AddToCartDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.productListTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell {
            let product = self.produts[indexPath.row]
            cell.configureCell(product: product)
            cell.addTOCartButton.tag = indexPath.row
            cell.addToCartDelegate = self
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func addToCartPressed(index: Int) {
        print("item pressed at index :\(index)")
        let product = produts[index]
        product.isAddedToCart = true
        ProductManager.shared.productInCart.append(product)
        self.showAddedToCartAlert(title: "Alert", message: "\( product.productTitle) added to cart")
    }
    func showAddedToCartAlert(title : String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}


