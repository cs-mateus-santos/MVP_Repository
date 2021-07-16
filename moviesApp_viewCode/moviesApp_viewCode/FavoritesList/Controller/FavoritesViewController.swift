//
//  FavoritesViewController.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 16/07/21.
//

import UIKit

class FavoritesViewController: ViewControllerBase {
    
    weak var coordinator: MainCoordinator?
    
    let viewBase = ListMovieViewBase()
    
    var presenter: FavoritesPresenterInputProtocol
    
    init(presenter: FavoritesPresenterInputProtocol) {
        self.presenter = presenter
        super.init()
        presenter.view = self
    }

    internal required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func loadView() {
        super.loadView()
        viewBase.delegateCell = self
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        viewBase.movieToFavoritesButton.isHidden = true
        presenter.fetchMovies()
        addTrigerrs()
    }
}

extension FavoritesViewController: delegateMovieCollectionViewCell {
    
    func hearthIsTouched(_ movie: MovieParse) {
        presenter.desFavorite(movie)
    }
    
}

extension FavoritesViewController: FavoritesViewProtocol {
    
    func fetchMoviesResponse(_ movieData: MovieView) {
        viewBase.delegate.updateDelegate(delegateAction: self)
        viewBase.collectionView.delegate = viewBase.delegate
        viewBase.dataSource.updateData(movieModel: movieData)
        viewBase.collectionView.dataSource = viewBase.dataSource
        viewBase.collectionView.reloadData()
    }

}

//MARK: Triggers
extension FavoritesViewController {
    
    func addTrigerrs(){

    }

}

extension FavoritesViewController: DelegateAction {
    func didSelected() {
        
    }
}
