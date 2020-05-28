//
//  ViewController.swift
//  BtvnScrollView
//
//  Created by User on 5/25/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var pageControllView: UIPageControl!
    @IBOutlet weak var widthScrollView: NSLayoutConstraint!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var views: [ViewCustom] = []
    var images: [UIImage] = []
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        setupScrollView(slides: views)
        pageControllView.currentPage = 0
        pageControllView.numberOfPages = views.count
        pageControllView.pageIndicatorTintColor = UIColor.gray
        pageControllView.currentPageIndicatorTintColor = UIColor.red
        
        scrollView.delegate = self
        
        
    }
    
    func data() {
//        images = [UIImage(named: "anh10"),
//                  UIImage(named: "anh9"),
//                  UIImage(named: "anh8"),
//                  UIImage(named: "anh7"),
//                  UIImage(named: "anh6")] as! [UIImage]
//        names = ["anh10", "anh9", "anh8", "anh7", "anh6"]
        let item1: ViewCustom = Bundle.main.loadNibNamed("ViewCustom", owner: self, options: nil)?.first as! ViewCustom
        item1.imageView.image = UIImage(named: "anh10")
        item1.textView.text = "anh10"
        
        let item2: ViewCustom = Bundle.main.loadNibNamed("ViewCustom", owner: self, options: nil)?.first as! ViewCustom
        item2.imageView.image = UIImage(named: "anh9")
        item2.textView.text = "anh9"
        
        let item3: ViewCustom = Bundle.main.loadNibNamed("ViewCustom", owner: self, options: nil)?.first as! ViewCustom
        item3.imageView.image = UIImage(named: "anh7")
        item3.textView.text = "anh7"
        
        let item4: ViewCustom = Bundle.main.loadNibNamed("ViewCustom", owner: self, options: nil)?.first as! ViewCustom
        item4.imageView.image = UIImage(named: "anh8")
        item4.textView.text = "anh8"
        
        let item5: ViewCustom = Bundle.main.loadNibNamed("ViewCustom", owner: self, options: nil)?.first as! ViewCustom
        item5.imageView.image = UIImage(named: "anh6")
        item5.textView.text = "anh6"
        
        views.append(contentsOf: [item1, item2, item3, item4, item5])
        
        
    }
    
    func setupScrollView(slides: [ViewCustom]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 100)
        scrollView.contentSize = CGSize(width: screenWidth * CGFloat(slides.count), height: screenHeight - 100)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: screenWidth * CGFloat(i), y: 0, width: screenWidth, height: screenHeight - 100)
            scrollView.addSubview(slides[i])
        }
        
    }
    


}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/screenWidth)
        pageControllView.currentPage = Int(pageIndex)
    }
}
