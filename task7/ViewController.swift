//
//  ViewController.swift
//  task7
//
//  Created by Gleb Tregubov on 21.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let scrollView = UIScrollView(frame: view.bounds)
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 270 + 300)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        imageView = UIImageView(image: UIImage(named: "image"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 270))
        
        scrollView.addSubview(imageView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let shift = 270 - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: view.bounds.width, height: shift)

        if shift > 0 {
            scrollView.showsVerticalScrollIndicator = true
            let indicatorInset = max(shift, 270) - view.safeAreaInsets.top
            scrollView.verticalScrollIndicatorInsets = .init(top: indicatorInset, left: 0, bottom: 0, right: 0)
        } else {
            scrollView.showsVerticalScrollIndicator = false
        }
    }
}

