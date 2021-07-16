//
//  ListCardDelegate.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 16/03/21.
//

import UIKit

protocol DelegateAction:AnyObject {
    func didSelected()
}

class ListMovieDelegate: NSObject, UICollectionViewDelegate {
    
    weak var delegateAction: DelegateAction?
    
    func updateDelegate(delegateAction: DelegateAction) {
        self.delegateAction = delegateAction
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateAction?.didSelected()
    }
}
