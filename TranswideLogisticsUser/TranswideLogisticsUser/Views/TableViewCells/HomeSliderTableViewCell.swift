//
//  homeSliderTableViewCell.swift
//  Hitch
//
//  Created by apple on 11/5/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
 
protocol HomeSliderCellDelegate: NSObjectProtocol {
    func actionCallBackShowProductDetail(product:ProductViewModel)
}
class HomeSliderTableViewCell: BaseTableViewCell{
   
    @IBOutlet weak var pageControlHomeSlider: UIPageControl!
    @IBOutlet weak var collectionView:UICollectionView?
    
    var delegate: HomeSliderCellDelegate?
    var productList:[ProductViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(list:[ProductViewModel])  {
        self.productList = list
        self.pageControlHomeSlider.numberOfPages = list.count
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
       

}

extension HomeSliderTableViewCell: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let list = self.productList{
            return list.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width) - 7, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.HomeSliderCollectionViewCell , for: indexPath) as! HomeSliderCollectionViewCell
        let product = self.productList![indexPath.row]
        cell.configureView(product: product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = self.productList![indexPath.row]
        if let del = self.delegate{
            del.actionCallBackShowProductDetail(product: product)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let row = self.collectionView!.indexPathsForVisibleItems.first?.row{
            self.pageControlHomeSlider?.currentPage = row
        }
        
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        if let row = self.collectionView!.indexPathsForVisibleItems.first?.row{
            self.pageControlHomeSlider?.currentPage = row
        }
        
    }
    
    
    
}
