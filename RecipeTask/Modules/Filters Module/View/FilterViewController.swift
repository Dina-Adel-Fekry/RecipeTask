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
    let reuseIdentifier = "FilterCollectionViewCell"
     var presenter : FilterOutput?
     var items = [String]()
    override func viewDidLoad() {
          super.viewDidLoad()
          initPresenter()
          presenter?.viewDidLoad()
        
        
          

          // Do any additional setup after loading the view.
      }
    
    // MARK: - private methods
    private func initPresenter(){
        presenter = FilterPresenter(view: self,interactor:FilterInteractor(), router: FilterRouter())
    }
    
    
    private func registerCells(){
        filterCollectionView.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension FilterViewController: FilterInput{
    func updateView(){
        
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
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FilterCollectionViewCell
         let health = items[indexPath.row]
         cell.setupCell(healthName: health)
                return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

         print("You selected cell #\(indexPath.item)!")
     }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
     {
        return CGSize(width: 120.0, height: 60.0)
     }
    
}
