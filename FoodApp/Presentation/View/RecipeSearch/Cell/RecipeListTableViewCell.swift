//
//  RecipeListTableViewCell.swift
//  FoodApp
//
//  Created by Umair Ahmad on 24/12/2022.
//

import UIKit


protocol PlayVideoButtonDelegate {
    func videoPlayerButtonPressed(urlNumber: Int)
}
class RecipeListTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var videoPlayButton: UIButton!
    @IBOutlet weak var recipeName: UILabel!
    var delegate: PlayVideoButtonDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func playVideoButtonPressed(_ sender: UIButton) {
        self.delegate?.videoPlayerButtonPressed(urlNumber: sender.tag)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
