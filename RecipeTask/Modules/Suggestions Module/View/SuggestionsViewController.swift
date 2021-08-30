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
    var presenter : SuggestionOutput?
    
     var suggestionsArray = [String]()
     var  currentSuggestion : String?{
        didSet{
         //  viewDidLoad()
            presenter?.viewSuggestion(suggestion: currentSuggestion ?? "")
            }
            
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        initPresenter()
        presenter?.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    
    private func initPresenter(){
        presenter = SuggestionsPresenter(view: self,interactor:SuggestionsInteractor(), router: SuggestionsRouter())
    }
    
    private func registerCells(){
        self.suggestionTableView.register(UINib(nibName: "SuggestionsTableViewCell", bundle: nil), forCellReuseIdentifier: "SuggestionCell")
        
    }
    
    func setSuggestionItem(suggestion: String){
        currentSuggestion = suggestion
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
extension SuggestionsViewController: SuggestionInput{
    func initSuggestionsArray(suggestion: String) {
        if(suggestionsArray.count==10){
            suggestionsArray.removeFirst()
        }
        suggestionsArray.append(suggestion)
        suggestionTableView.reloadData()
        let defaults = UserDefaults.standard
        defaults.set(suggestionsArray, forKey: "SavedStringArray")
        
    }
    
    func setup(){
        registerCells()
    }
    
}

extension SuggestionsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell",for: indexPath) as! SuggestionsTableViewCell
        let defaults = UserDefaults.standard
        let suggestionArray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        
        
          let suggestion = suggestionArray[indexPath.row]
          cell.setupCell(suggestion: suggestion)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(suggestionsArray[indexPath.row])
    }
    
    
}
