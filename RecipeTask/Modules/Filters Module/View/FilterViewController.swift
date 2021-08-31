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
        filterCollectionView.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
    }
    
}
extension FilterViewController: FilterInput{
    func updateView(filterType: String){
        if let parent = self.parent as? SearchViewController {
            parent.setCurrentFilter(filter: filterType)
        }
    }
    func initFilterArray(){
        items.append("All")
        items.append("Low Sugar")
        items.append("Keto")
        items.append("Vegan")
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
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as? FilterCollectionViewCell
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
        return CGSize(width: 120.0, height: 60.0)
     }
    
}
