//
//  FilterViewController.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/22/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController{
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    private var presenter : FilterOutput?
    
    private var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        presenter?.viewDidLoad()
        
    }
    
    // MARK: - private methods
    private func initPresenter(){
        presenter = DependencyFactory.sharedDependencyFactory.presenterForFilter(self)
    }
    
    
    private func registerCells(){
        filterCollectionView.register(UINib(nibName: NibName.FILTER_COLLECTION_VIEW_CELL.rawValue, bundle: nil), forCellWithReuseIdentifier: Identifiers.FILTER_COLLECTION_VIEW_CELL.rawValue)
    }
    
}
extension FilterViewController: FilterInput{
    func updateView(filterType: String){
        if let parent = self.parent as? SearchViewController {
            parent.setCurrentFilter(filter: filterType)
        }
    }
    func initFilterArray(){
        items.append(FilterTypes.ALL.rawValue)
        items.append(FilterTypes.LOW_SUGAR.rawValue)
        items.append(FilterTypes.KETO.rawValue)
        items.append(FilterTypes.VEGAN.rawValue)
    }
    func setup(){
        registerCells()
    }
    
}

extension FilterViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.FILTER_COLLECTION_VIEW_CELL.rawValue, for: indexPath) as? FilterCollectionViewCell
        let health = items[indexPath.row]
        cell?.setupCell(healthName: health)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)")
        presenter?.didTapFilterHealth(cellNumber: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:CGFloat(Dimension.COLLECTION_VIEW_WIDTH.rawValue), height:CGFloat(Dimension.COLLECTION_VIEW_HEIGHT.rawValue))
    }
    
}
