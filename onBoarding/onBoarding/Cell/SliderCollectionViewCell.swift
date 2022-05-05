//
//  SliderCollectionViewCell.swift
//  onBoarding
//
//  Created by Hilal Akgül on 13.04.2022.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var sliderTitle: UILabel!
    @IBOutlet weak var sliderDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(model : OnboardingSlide){
        sliderImage.image = model.image
        sliderTitle.text = model.title
        sliderDescription.text = model.description
    }

}
