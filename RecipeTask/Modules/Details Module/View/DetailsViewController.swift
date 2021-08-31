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
    
    @IBAction func shareRecipeAction(_ sender: Any) {
        presenter?.didTapShareButton()
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
       // self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
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
           presenter = DetailsPresenter(view:self,interactor:DetailsInteractor(), router: DetailsRouter())
       }
    
    private func setupShareButton(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(named: "1856157"), style: .plain, target: self, action: #selector(showAvailableSharingOptions))
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
   
  //   MARK: - public method
   public func setRecipeData(recipe:RecipeModel){
        currentRecipe = recipe
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

extension DetailsViewController: DetailsInput{
    func showRecipeWebsitePage() {
        if let url = URL(string: currentRecipe?.url ?? "") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
        
    }
    
    @objc func showAvailableSharingOptions() {

        if let link = NSURL(string: currentRecipe?.shareAs ?? "")
        {
            let objectToShare = [link]
            let activityVC = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }    }
    
    func setup() {
        recipeTitleLabel?.text = currentRecipe?.title
        recipeImage.image = UIImage(named: (currentRecipe?.image ?? ""))
        recipeImage.sd_setImage(with: URL(string: currentRecipe?.image ?? ""))
        recipeIngredientsLabel.text = currentRecipe?.ingredientLines?.joined(separator: "\u{0085}")
        setupShareButton()
        
    }
    
}
