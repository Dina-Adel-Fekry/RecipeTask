//
//  SuggestionsViewController.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/29/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit

class SuggestionsViewController: UIViewController {
    
  @IBOutlet weak var suggestionTableView: UITableView!
    
   private var presenter : SuggestionOutput?
   private var  currentSuggestion : String?{
        didSet{
            presenter?.viewSuggestion(suggestion: currentSuggestion ?? "")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPresenter()
        presenter?.viewDidLoad()

    }
    
    private func initPresenter(){
        presenter = DependencyFactory.sharedDependencyFactory.presenterForSuggestions(self)
    }
    
    private func registerCells(){
        self.suggestionTableView.register(UINib(nibName: "SuggestionsTableViewCell", bundle: nil), forCellReuseIdentifier: "SuggestionCell")
        
    }
    
    func setSuggestionItem(suggestion: String){
        currentSuggestion = suggestion
    }
    
 
}
extension SuggestionsViewController: SuggestionInput{
    func initSuggestionsArray(suggestion: String) {
        var suggestionsArray = [String]()
        let defaults = UserDefaults.standard
        if(defaults.stringArray(forKey: "SavedStringArray")?.count ?? 0 < 10 ){
            if let array = defaults.stringArray(forKey: "SavedStringArray"){
                suggestionsArray.append(contentsOf: array)
            }
            suggestionsArray.append(suggestion)
            defaults.set(suggestionsArray, forKey: "SavedStringArray")
            suggestionTableView.reloadData()
            
            
        }
            
        else
            {
             if let array = defaults.stringArray(forKey: "SavedStringArray"){
                           suggestionsArray.append(contentsOf: array)
                       }
            suggestionsArray.removeFirst()
            suggestionsArray.append(suggestion)
            defaults.set(suggestionsArray, forKey: "SavedStringArray")
            suggestionTableView.reloadData()
        }
    }
    
    func setup(){
        registerCells()
        suggestionTableView.reloadData()
    }
    
    func updateView(suggestion: String){
        if let parent = self.parent as? SearchViewController {
            parent.setCurrentSuggestion(suggestion: suggestion)
        }
        
    }
    
}

extension SuggestionsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let suggestionArray = UserDefaults.standard.stringArray(forKey: "SavedStringArray") ?? [String]()
        return suggestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell",for: indexPath) as? SuggestionsTableViewCell
        let defaults = UserDefaults.standard
        let suggestionArray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        
        
        let suggestion = suggestionArray[indexPath.row]
        cell?.setupCell(suggestion: suggestion)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestionArray = UserDefaults.standard.stringArray(forKey: "SavedStringArray") ?? [String]()
        print(suggestionArray[indexPath.row])
        presenter?.didTapSuggestionItem(suggestion:suggestionArray[indexPath.row] )
    }
    
    
}
