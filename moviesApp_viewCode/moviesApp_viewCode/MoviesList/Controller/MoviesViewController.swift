//
//  ViewController.swift
//  mateusRodrigues_moviesApp
//
//  Created by mateus.santos on 05/05/21.
//

import UIKit

class MoviesViewController: ViewControllerBase {
    
    weak var coordinator: MainCoordinator?
    
    let viewBase = ListMovieViewBase()
    
    var presenter:MoviePresenter
    
    init(presenter: MoviePresenter) {
        self.presenter = presenter
        super.init()
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
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
        presenter.fetchMovies()
        addTrigerrs()
    }
}

extension MoviesViewController: delegateMovieCollectionViewCell {
    
    func hearthIsTouched(_ movie: MovieParse) {
        presenter.favorite(movie)
    }
    
}

extension MoviesViewController: MovieViewProtocol {
    
    func fetchMoviesResponse(_ movieData: MovieView) {
        viewBase.delegate.updateDelegate(delegateAction: self)
        viewBase.collectionView.delegate = viewBase.delegate
        viewBase.dataSource.updateData(movieModel: movieData)
        viewBase.collectionView.dataSource = viewBase.dataSource
        viewBase.collectionView.reloadData()
    }

}

//MARK: Triggers
extension MoviesViewController {
    
    func addTrigerrs(){
        viewBase.movieToFavoritesButton.addTarget(self, action: #selector(movieToFavorites), for: .touchUpInside)
    }

    @objc func movieToFavorites() {
        coordinator?.navigateToFavoritesList()
    }
    
}

extension MoviesViewController: DelegateAction {
    func didSelected() {
        
    }
}
