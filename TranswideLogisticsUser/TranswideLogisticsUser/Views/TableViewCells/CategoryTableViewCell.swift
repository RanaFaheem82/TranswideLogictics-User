//
//  CategoryTableViewCell.swift
//  Hitch
//
//  Created by apple on 11/4/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
protocol CategoryCellDelegate: NSObjectProtocol {
    func actionCallBackShowCategory()
    func actionCallBackShowCategoryProducts()
}
extension CategoryCellDelegate{
    func actionCallBackShowCategory(){}
    func actionCallBackShowCategoryProducts(){}
}

class CategoryTableViewCell: BaseTableViewCell{
   
    @IBOutlet weak var collectionView:UICollectionView?

    var delegate: CategoryCellDelegate?
    var categoryList: [CategoryViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView?.register(UINib(nibName: NibNames.CategoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.CategoryCollectionViewCell)
    }

    
    func configureView(list:[CategoryViewModel])  {
        self.categoryList = list
    }
    
    @IBAction func actionSeeAll(_ sender: UIButton){
        if let del = self.delegate{
            del.actionCallBackShowCategory()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let list = self.categoryList{
            return list.count
        }
        return 0
       }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 76, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.CategoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
        let cat = self.categoryList![indexPath.row]
        cell.configureView(cat: cat)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        if let del = self.delegate{
            del.actionCallBackShowCategoryProducts()
        }
    }
    
}
