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
    
    
    private var recipeArray  = [RecipeModel]()
    private var fromIndex : Int?
    private var countNumber : Int?
    private var nextUrl : String?
    private var response = [[String:Any]]()
    private var  currentFilter : String?{
        didSet{
            if (currentFilter == FilterName.ALL.rawValue){
                presenter?.didTapSearchBar(searchBarInput: searchBar?.text ?? "")
            }
            else{
                presenter?.didTapFilterCell(searchBarInput: searchBar?.text ?? "", filterType: currentFilter ?? "")
            }
        }
    }
    
    private var currentSuggestion: String?{
        didSet{
            presenter?.didChooseSuggestion(suggestion: currentSuggestion ?? "")
        }
    }
    
    private var presenter : SearchOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        presenter?.viewDidLoad()
        
    }
    
    
    
    
    // MARK: - private methods
    private func initPresenter(){
        
        presenter = DependencyFactory.sharedDependencyFactory.presenterForSearch(self)
        
    }
    
    
    private func registerCells(){
        self.recipesTableView?.register(UINib(nibName: NibName.RECIPE_TABLE_VIEW_CELL.rawValue, bundle: nil), forCellReuseIdentifier:Identifiers.RECIPE_CELL.rawValue )
        
    }
    
    
    
    // MARK: - public methods
    
    func setCurrentFilter(filter: String){
        currentFilter = filter
    }
    func setCurrentSuggestion(suggestion: String){
        currentSuggestion = suggestion
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.RECIPE_CELL.rawValue,for: indexPath) as? RecipeTableViewCell
        let recipe = recipeArray[indexPath.row]
        cell?.setupCell(title: recipe.title, image: recipe.image, source: recipe.source, health: recipe.healthLabels)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recipeArray.count - 1 { // last cell
            if countNumber ?? 20 > recipeArray.count { // more items to fetch
                presenter?.didNeedMoreData(request:nextUrl ?? "")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        presenter?.navigateToDetails(recipe: recipeArray[indexPath.row])
        //TODO: - presenter?.didSelectRoeAt(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Dimension.TABLE_VIEW_HEIGHT.rawValue)
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
        print("searchText \(String(describing: searchBar.text))")
        suggestionsView.isHidden = true
        presenter?.didTapSearchBar(searchBarInput:searchBar.text ?? "")
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return text.englishLettersOnly()
        
    }
}

