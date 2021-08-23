//
//  FilterViewController.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/22/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    let reuseIdentifier = "FilterCollectionViewCell"
    var items = ["All", "Low Sugar", "Keto", "Vegan"]
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        filterCollectionView.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
          

          // Do any additional setup after loading the view.
      }
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
   
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
