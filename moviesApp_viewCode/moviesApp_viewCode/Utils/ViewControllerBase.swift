//
//  ViewControllerBase.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 15/07/21.
//

import UIKit

class ViewControllerBase: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    internal init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Movies"
        navigationController?.navigationBar.isTranslucent = false

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .yellow
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

           navigationController?.navigationBar.tintColor = .black
           navigationController?.navigationBar.standardAppearance = appearance
           navigationController?.navigationBar.compactAppearance = appearance
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func addBackButtonNavBar() {
        let back = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: #selector(backToRoot))

        navigationItem.leftBarButtonItems = [back]
    }
    
    @objc func backToRoot() {
        
    }
    
    
}
