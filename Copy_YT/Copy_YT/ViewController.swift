//
//  ViewController.swift
//  Copy_YT
//
//  Created by ROOSTERLIN on 2017/3/6.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UICollectionViewCell.self(), forCellWithReuseIdentifier: "homeCellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: IndexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
}

