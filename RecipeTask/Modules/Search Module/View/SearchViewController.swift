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
    @IBOutlet weak var suggestionsView: UIView!
    @IBOutlet weak var FilterView: UIView!
    
    
    var recipeArray  = [RecipeModel]()
    var fromIndex : Int?
    var countNumber : Int?
    var nextUrl : String?
    var response = [[String:Any]]()
    private var  currentFilter : String?{
        didSet{
            if (currentFilter == "all"){
                presenter?.didTapSearchBar(searchBarInput: searchBar?.text ?? "meat")
            }
            else{
                presenter?.didTapFilterCell(searchBarInput: searchBar?.text ?? "meat", filterType: currentFilter ?? "low-sugar")
            }
        }
    }
    
    private var currentSuggestion: String?{
        didSet{
        presenter?.didChooseSuggestion(suggestion: currentSuggestion ?? "")
        }
    }
    
//    enum Segues{
//        static let toFilterView = "toFilterCollectionView"
//        static let toSuggestionsView = "toSuggestionsView"
//    }
    var presenter : SearchOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        presenter?.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    
    
    
    
    // MARK: - private methods
    private func initPresenter(){
        
        presenter = DependencyFactory().presenterForSearch(self)
        
    }
    
    
    private func registerCells(){
        self.recipesTableView?.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
    // MARK: - public methods
    
    func setCurrentFilter(filter: String){
        currentFilter = filter
    }
    func setCurrentSuggestion(suggestion: String){
        currentSuggestion = suggestion
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           if segue.identifier == Segues.toFilterView{
//               let destVC = segue.destination as! FilterViewController
//
//           }
//          if segue.identifier == Segues.toSuggestionsView{
//                      let destVC = segue.destination as! SuggestionsViewController
//
//                  }       }
//
    
   
    
    
           
    
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
    
    func setSuggestions(suggestion: String) {
        if let child = self.children[1] as? SuggestionsViewController {
            child.setSuggestionItem(suggestion: suggestion)
        }
        
    }
    
    func initRecipeArray(recipesArray:[RecipeModel],from:Int, count: Int,nextUrl: String){
        self.countNumber = count
        if (from == 1){
        recipeArray = recipesArray
        }
        else{
            recipeArray = recipeArray+recipesArray
        }
        self.nextUrl = nextUrl
        
    }
    
    func setup(){
        registerCells()
    }
    
    func setHiddenViews() {
        noSearchLabel?.isHidden = false
        recipesTableView?.isHidden = true
        suggestionsView?.isHidden = true
        
    }
    func setSearchBarText(suggestion: String) {
        searchBar.text = suggestion
        suggestionsView.isHidden = true
    }

}


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
          return recipeArray.count
          
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          var cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell",for: indexPath) as? RecipeTableViewCell
          let recipe = recipeArray[indexPath.row]
        cell?.setupCell(title: recipe.title, image: recipe.image, source: recipe.source, health: recipe.healthLabels)
        cell?.recipeImage.sd_setImage(with: URL(string: recipe.image!))
        if indexPath.row == recipeArray.count - 1 { // last cell
            if countNumber ?? 20 > recipeArray.count { // more items to fetch
                presenter?.didNeedMoreData(request:nextUrl ?? "")
                
            }
        }

        return cell ?? UITableViewCell()
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
//         let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
//        self.present(detailsViewController, animated: true, completion: nil)
         //self.navigationController?.pushViewController(detailsViewController, animated: true)
        print(recipeArray[indexPath.row].title)
        presenter?.navigateToDetails(recipe: recipeArray[indexPath.row])
        //TODO: - presenter?.didSelectRoeAt(indexPath.row)
    }

   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    //RecipeRowHeight
    }
}



extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        suggestionsView.isHidden = false
        
       // presenter
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        suggestionsView.isHidden = false
        
    }
    
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       print("searchText \(searchBar.text)")

      //  print("searchText \(String(describing: searchBar.text))")
        suggestionsView.isHidden = true
        presenter?.didTapSearchBar(searchBarInput:searchBar.text ?? "meat")
    }
    


    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

         do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z \n].*", options: [])
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
