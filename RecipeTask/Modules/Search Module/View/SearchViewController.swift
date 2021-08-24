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
    var recipeArray = [Recipe]()
    var response = [[String:Any]]()
    
    enum Segues{
        static let toFilterView = "toFilterCollectionView"
    }
    var presenter : SearchOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        initPresenter()
        presenter?.viewDidLoad()
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    // MARK: - private methods
    private func initPresenter(){
        presenter = SearchPresenter(view: self,interactor:SearchInteractor(), router: SearchRouter())
    }
    
    
    private func registerCells(){
        
      // self.recipesTableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: "RecipeCell")
        
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
    
    
    struct Recipe{
        let title : String
        let source : String
        let health : String
    }
    
    func fetch(){
        Alamofire.request("https://api.edamam.com/api/recipes/v2?q=chicken&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public").responseJSON { (response) in
//print("Response value \(response)")
             //print("Response.result.value \(response.result.value!)")
             
                if let json = response.result.value as! [String:Any]?{
                if let responseValue = json["hits"] as! [[String:Any]]?{
                    self.response = responseValue
                  
                }
           
    }
    
    }
}
}
extension SearchViewController: SearchInput{
    func showRecipes() {
        
    }
    
    func showError() {
        
    }
    
    func updateView() {
        
    }
    
    func showSuggestions() {
        
    }
    
    func initRecipeArray(){
        recipeArray.append(Recipe(title: "Title" , source: "Source", health: "Health Labels"))
        recipeArray.append(Recipe(title: "Title" , source: "Source", health: "Health Labels"))
        recipeArray.append(Recipe(title: "Title" , source: "Source", health: "Health Labels"))
        recipeArray.append(Recipe(title: "Title" , source: "Source", health: "Health Labels"))
        recipeArray.append(Recipe(title: "Title" , source: "Source", health: "Health Labels"))
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
          cell.setupCell(title: recipe.title, source: recipe.source, health: recipe.health)
          return cell
      }
      
       func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
          
      }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 160
    }
}
