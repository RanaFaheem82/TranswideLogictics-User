//
//  NewArrivalsTableViewCell.swift
//  Hitch
//
//  Created by apple on 11/5/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

protocol NewArrivalsDelegate:NSObjectProtocol {
    func actionCallBackShowProducts(_ product:ProductViewModel)
    func actionCallbackShowAllProducts(list:[ProductViewModel])
}

class NewArrivalsTableViewCell: BaseTableViewCell{
    
    @IBOutlet weak var NewArrivalsCollectionView: UICollectionView!
    @IBOutlet weak var lblArrivals: UILabel!
    @IBOutlet weak var OtherOptionsCollectionView: UICollectionView!
    
    var delegate: NewArrivalsDelegate?
    var productList: [ProductViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(list: [ProductViewModel])  {
        self.productList = list
    }
    
    @IBAction func actionSeeAll(_ sender: UIButton) {
        delegate?.actionCallbackShowAllProducts(list: self.productList!)
    }
    
    
    
}


extension NewArrivalsTableViewCell: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let list = self.productList{
            return list.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           if(collectionView == NewArrivalsCollectionView){
               return CGSize(width: (NewArrivalsCollectionView.frame.size.width/2) - 7, height: NewArrivalsCollectionView.frame.size.height)
           }
           else{
               return CGSize(width: (OtherOptionsCollectionView.frame.size.width/4) - 5, height: OtherOptionsCollectionView.frame.size.height)
               
           }
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == NewArrivalsCollectionView){
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.NewArrivalsCollectionViewCell, for: indexPath) as! NewArrivalsCollectionViewCell
            cell.configureView(product: self.productList![indexPath.row])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.OtherOptionsCollectionViewCell, for: indexPath) as! OtherOptionsCollectionViewCell
            cell.configureView(product: self.productList![indexPath.row])
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let del = self.delegate{
            del.actionCallBackShowProducts(self.productList![indexPath.item])
        }
    }
    
    
}
