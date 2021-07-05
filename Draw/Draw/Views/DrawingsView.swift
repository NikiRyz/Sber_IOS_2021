//
//  DrawingsView.swift
//  Draw
//
//  Created by 18267440 on 04.07.2021.
//

import UIKit

protocol DrawingsViewProtocol: AnyObject {
    func setupView()
    func setupAdditinalMenu()
}
protocol DrawingsViewDelegate: AnyObject {
    func newDrawing()
    func picturesCount() -> Int
    func picture(at index: IndexPath) -> Pictures
    func firstCellisHidden()
    func firstCellisntHidden()
    func didTap(at index: IndexPath)
    func didTapNewDrawingButton()
    func selected(at index: IndexPath)
}

final class DrawingsView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = CustomLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.id)
        return cv
    }()
    private lazy var additinalMenu: AdditinalMenuView = {
        let view = AdditinalMenuView()
        return view
    }()
    private lazy var statusBarHeight: CGFloat = {
        Const.statusBarHeight
    }()
    private var cellHeight: CGFloat = 0
    weak var delegate: DrawingsViewDelegate!
}

extension DrawingsView: DrawingsViewProtocol {
    func setupAdditinalMenu() {
        let menuHeight = 70
        additinalMenu.frame = CGRect(x: 0, y: -menuHeight - Int(-statusBarHeight), width: Int(collectionView.frame.width), height: menuHeight)
    }
    func setupView() {
        addSubview(collectionView)
        addSubview(additinalMenu)
        additinalMenu.buttonTapped = { [weak self] in
            self?.delegate.didTapNewDrawingButton()
        }
        additinalMenu.set(text: "Всего \(delegate.picturesCount() ) рисунков")
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
extension DrawingsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if cellHeight == 0 { return }
        let offsetY = scrollView.contentOffset.y
        let menuHeight = 70
        
        if offsetY > cellHeight - statusBarHeight {
            additinalMenu.frame = CGRect(x: 0, y: statusBarHeight, width: collectionView.bounds.width, height: CGFloat(menuHeight))
        } else {
            additinalMenu.frame = CGRect(x: 0, y: -menuHeight - Int(-statusBarHeight), width: Int(collectionView.frame.width), height: menuHeight)
        }
    }
}

extension DrawingsView: UICollectionViewDelegate {}

extension DrawingsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.picturesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.id, for: indexPath) as! PictureCell
        
        cell.configView(with: delegate.picture(at: indexPath))
        
        if indexPath.row == 0 {
            cellHeight = cell.bounds.height
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didTap(at: indexPath)
    }
}

extension DrawingsView: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeForViewAtIndexPath indexPath: IndexPath) -> Int {
        if indexPath.row % 13 == 3 || indexPath.row % 13 == 10 {
            return 2
        }
        return 1
    }
    
    func numberOfColumnsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
}


