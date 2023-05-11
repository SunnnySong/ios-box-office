//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    
    private let presentationProvider = PresentationProvider()
    private var dataSource: UICollectionViewDataSource?

    private lazy var collectionView = BoxOfficeCollectionView(frame: view.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Date.yesterday.formatData(type: .title)
        configureHierarchy()
        configureDataSource()
        configureRefreshControl()
    }
    
    private func configureHierarchy() {
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        
        presentationProvider.delegate = self
        presentationProvider.loadBoxOffices(date: Date.yesterday.formatData(type: .network))
    }
}

extension BoxOfficeViewController: PresentationDelegate {
    
    func call() {
        let boxOfficeDataSource = BoxOfficeDataSource()
        boxOfficeDataSource.boxOffices = self.presentationProvider.getBoxOffices()
        dataSource = boxOfficeDataSource
        
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
        }
    }
}

extension BoxOfficeViewController {

    func configureRefreshControl() {
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }

    @objc func handleRefreshControl() {
        // 네트워크로 데이터 불러오는 작업 수행
        collectionView.reloadData()

        DispatchQueue.main.async {
           self.collectionView.refreshControl?.endRefreshing()
        }
    }
}
