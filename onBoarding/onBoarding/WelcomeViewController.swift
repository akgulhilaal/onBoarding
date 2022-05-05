//
//  WelcomeViewController.swift
//  onBoarding
//
//  Created by Hilal Akgül on 13.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides : [OnboardingSlide] = []
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextButton.setTitle("Get Started", for: .normal)
            }
            else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [OnboardingSlide(title: "MORNING", description: "Morning is the period from sunrise to noon. ", image:  #imageLiteral(resourceName: "welcome_0")),
                  OnboardingSlide(title: "AFTERNOON", description: "Afternoon is the time after solar noon. It is the time when the sun is descending from its peak in the sky to somewhat before its terminus at the horizon in the west.", image:  #imageLiteral(resourceName: "welcome_1")),
                  OnboardingSlide(title: "NIGHT", description: "Night is the period of ambient darkness from sunset to sunrise during each 24-hour day, when the Sun is below the horizon. ", image:  #imageLiteral(resourceName: "welcome_2"))]
        collectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderCell")
        
    }
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            //animation
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
        
    }
}
extension WelcomeViewController : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCollectionViewCell
        cell.configure(model : slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
    
    
}
