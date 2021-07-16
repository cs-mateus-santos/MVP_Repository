//
//  MovieCollectionViewCellTest.swift
//  moviesApp_viewCodeTests
//
//  Created by mateus.santos on 06/05/21.
//

import XCTest
import FBSnapshotTestCase
@testable import moviesApp_viewCode


class MovieCollectionViewCellTest: FBSnapshotTestCase {
    var moviesCell: MovieCollectionViewCell!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        moviesCell = MovieCollectionViewCell()
        moviesCell.frame = CGRect(x: 0, y: 0, width: 400, height: 200)
    }
    
    override func tearDownWithError() throws {
        moviesCell = nil
        try super.tearDownWithError()
    }
    
    func testLaunch() {
        FBSnapshotVerifyView(moviesCell)
    }
}
