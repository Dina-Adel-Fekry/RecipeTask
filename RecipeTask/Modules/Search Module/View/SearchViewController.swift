//
//  SearchViewController.swift
//  RecipeTask-SoftExpert
//
//  Created by Dina Adel on 8/22/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController{
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var noSearchLabel: UILabel!
    var recipeArray  = [RecipeModel]()
    var response = [[String:Any]]()
   
    
    enum Segues{
        static let toFilterView = "toFilterCollectionView"
    }
    var presenter : SearchOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        presenter?.viewDidLoad()
        noSearchLabel.isHidden = false
        recipesTableView.isHidden = true
       
        // Do any additional setup after loading the view.
    }
    
    
    
    
    // MARK: - private methods
    private func initPresenter(){
        presenter = SearchPresenter(view: self,interactor:SearchInteractor(), router: SearchRouter())
    }
    
    
    private func registerCells(){
        self.recipesTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == Segues.toFilterView{
               let destVC = segue.destination as! FilterViewController
           }
       }
    
    
   
    
    
           
    
    }




extension SearchViewController: SearchInput{
 
    func reloadData() {
        recipesTableView.reloadData()
    }
    
    func showError() {
        
        recipesTableView.isHidden = true
        noSearchLabel.isHidden = false
    }
    
    func updateView() {
        noSearchLabel.isHidden = true
        recipesTableView.isHidden = false
        
    }
    
    func showSuggestions() {
        
    }
    
    func initRecipeArray(recipesArray:[RecipeModel]){

        recipeArray = recipesArray
        
    }
    
    func setup(){
        registerCells()
    }

}


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
          return recipeArray.count
          
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          var cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell",for: indexPath) as! RecipeTableViewCell
          let recipe = recipeArray[indexPath.row]
        cell.setupCell(title: recipe.title, image: recipe.image, source: recipe.source, health: recipe.healthLabels)
        cell.recipeImage.sd_setImage(with: URL(string: recipe.image!))

          return cell
      }
      
       func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
          
      }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 160
    }
}



extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        
       // presenter?.didTapSearchBar(searchBarInput:searchBar.text ?? "meat")
        
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       print("searchText \(searchBar.text)")

      //  print("searchText \(String(describing: searchBar.text))")
        presenter?.didTapSearchBar(searchBarInput:searchBar.text ?? "meat")
    }
    


    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        return true
         do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
           if regex.firstMatch(in: text, options: [], range: NSMakeRange(0, text.count)) != nil {
                 return false

            }
        }
       catch {
           print("Error in Using Search Bar")
        }
       return true
   }

    
}
