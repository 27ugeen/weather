//
//  ViewController.swift
//  Weather
//
//  Created by GiN Eugene on 12/4/2022.
//

import UIKit

class CarouselViewController: UIViewController {
    //MARK: - Props
    
    private let emptyCellID = CarouselEmptyCollectionViewCell.cellId
    private let cityCellId = CarouselCityCollectionViewCell.cellId
    
    private var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    //MARK: - Subviews
    
    private lazy var carouselCollectionView: UICollectionView = {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
//        carouselLayout.itemSize = .init(width: 300, height: 400)
//        carouselLayout.sectionInset = .zero
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: carouselLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        
        
        
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
//        pageControl.backgroundStyle = .automatic
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")

        return pageControl
    }()
    //MARK: - loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "burger") , style: .done, target: self, action: nil)
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "location"), style: .plain, target: self, action: nil)
        
        
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
        
        setupViews()
        
//        self.title = "View"
        self.view.backgroundColor = UIColor(rgb: 0xE5E5E5)
    }


}
//MARK: - setup Views

extension CarouselViewController {
    func setupViews() {
        
        carouselCollectionView.register(CarouselEmptyCollectionViewCell.self, forCellWithReuseIdentifier: emptyCellID)
        carouselCollectionView.register(CarouselCityCollectionViewCell.self, forCellWithReuseIdentifier: cityCellId)
        
        view.addSubview(carouselCollectionView)
        view.addSubview(pageControl)
        
        let constraints = [
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            carouselCollectionView.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            carouselCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            carouselCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
// MARK: - Helpers
private extension CarouselViewController {
    func getCurrentPage() -> Int {
        
        let visibleRect = CGRect(origin: carouselCollectionView.contentOffset, size: carouselCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        return currentPage
    }
}
//MARK: - UICollectionViewDataSource

extension CarouselViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        pageControl.numberOfPages = carouselData.count
        pageControl.numberOfPages = 2
//        return carouselData.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityCellId, for: indexPath) as? CarouselCityCollectionViewCell else { return UICollectionViewCell() }
        
//        let image = carouselData[indexPath.row].image
//        let text = carouselData[indexPath.row].text
//
//        cell.configure(image: image, text: text)
        
        return cell
    }
}
//MARK: - UICollectionViewDelegate

extension CarouselViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
}
//MARK: - UICollectionViewDelegateFlowLayout

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let cellPadding = (collectionView.frame.width - 300) / 2
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.width
    }
}
