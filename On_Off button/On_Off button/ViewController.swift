//
//  ViewController.swift
//  On_Off button
//
//  Created by Skroman iOS Developer on 24/02/23.
//

import UIKit

class ViewController: UIViewController{
    
    var clicked_button = false
    var buttons = ["1","1"]
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.isUserInteractionEnabled = true
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress))
        CollectionView.addGestureRecognizer(longPressGesture)
        
        
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.reloadData()
        
        
    }
    
    @objc func longPress() {
        let alert = UIAlertController(title: "Alert", message: "Please press it Again!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped dismiss")
        }))
        present(alert, animated: true)
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.OnLabel.text = buttons[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let click_button = Int(arc4random_uniform(2))
        let change_button = buttons[click_button]
        
        
        if change_button == "1"{
            
            
            
            buttons[indexPath.row] = "0"
            CollectionView.reloadData()
            print("0")
        }
        
        
        else if change_button == "0" {
            buttons[indexPath.row] = "1"
            
            CollectionView.reloadData()
            print("1")
        }
    }
}
