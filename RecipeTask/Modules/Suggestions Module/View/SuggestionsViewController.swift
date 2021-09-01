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
    private var suggestionsArray = [String]()
    
    private var presenter : SuggestionOutput?
    private var  currentSuggestion : String?{
        didSet{
            presenter?.disSetCurrentSuggestion(suggestion: currentSuggestion ?? "")
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
        self.suggestionTableView.register(UINib(nibName: NibName.SUGGESTIONS_TABLE_VIEW_CELL.rawValue, bundle: nil), forCellReuseIdentifier: Identifiers.SUGGESTION_CELL.rawValue)
        
    }
    
    func setSuggestionItem(suggestion: String){
        currentSuggestion = suggestion
    }
    
    
}
extension SuggestionsViewController: SuggestionInput{
    func initSuggestionsArray(suggestion: String) {
        if(UserDefaults.standard.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue)?.count ?? 0 < 10 ){
            handleSuggestionsBeforeLimit(suggestion: suggestion)
        }
        else
        {
            handleSuggestionsAtLimit(suggestion: suggestion)
        }
    }
    
    private func handleSuggestionsBeforeLimit(suggestion: String){
        if let array = UserDefaults.standard.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue){
            suggestionsArray.append(contentsOf: array)
        }
        suggestionsArray.append(suggestion)
        UserDefaults.standard.set(suggestionsArray, forKey: Key.SAVED_STRING_ARRAY.rawValue)
        
    }
    private func handleSuggestionsAtLimit(suggestion: String){
        if let array = UserDefaults.standard.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue){
            suggestionsArray.append(contentsOf: array)
        }
        suggestionsArray.removeFirst()
        suggestionsArray.append(suggestion)
        UserDefaults.standard.set(suggestionsArray, forKey: Key.SAVED_STRING_ARRAY.rawValue)    }
    
    
    func reloadData(){
        suggestionTableView.reloadData()
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
        let suggestionArray = UserDefaults.standard.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue) ?? [String]()
        return suggestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.SUGGESTION_CELL.rawValue,for: indexPath) as? SuggestionsTableViewCell
        let defaults = UserDefaults.standard
        let suggestionArray = defaults.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue) ?? [String]()
        
        
        let suggestion = suggestionArray[indexPath.row]
        cell?.setupCell(suggestion: suggestion)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestionArray = UserDefaults.standard.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue) ?? [String]()
        print(suggestionArray[indexPath.row])
        presenter?.didTapSuggestionItem(suggestion:suggestionArray[indexPath.row] )
    }
    
    
}
