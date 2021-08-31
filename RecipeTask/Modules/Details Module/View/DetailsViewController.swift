//
//  DetailsViewController.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/28/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit
import SDWebImage
import SafariServices



class DetailsViewController: UIViewController {
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    
    @IBAction func recipeWebsiteAction(_ sender: Any) {
        presenter?.didTapWebsiteButton()
        
    }
    var currentRecipe:RecipeModel?{
        didSet{
            presenter?.didDataReceived()
        }
    }
    
    var presenter : DetailsOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        presenter?.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func initPresenter(){
           presenter = DependencyFactory.sharedDependencyFactory.presenterForDetails(self)
       }
    
    private func setupShareButton(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(named: "share"), style: .plain, target: self, action: #selector(showAvailableSharingOptions))
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
   
  //   MARK: - public method
   public func setRecipeData(recipe:RecipeModel){
        currentRecipe = recipe
    }
    
    @objc func showAvailableSharingOptions() {

           if let link = NSURL(string: currentRecipe?.shareAs ?? "")
           {
               let objectToShare = [link]
               let activityVC = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
               activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
               self.present(activityVC, animated: true, completion: nil)
           }    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: DetailsInput{
    func showRecipeWebsitePage() {
        if let url = URL(string: currentRecipe?.url ?? "") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
        
    }
    func setup() {
        recipeTitleLabel?.text = currentRecipe?.title
        recipeImage.image = UIImage(named: (currentRecipe?.image ?? ""))
        recipeImage.sd_setImage(with: URL(string: currentRecipe?.image ?? ""))
        recipeIngredientsLabel.text = currentRecipe?.ingredientLines?.joined(separator: "\u{0085}")
        setupShareButton()
        
    }
    
}
