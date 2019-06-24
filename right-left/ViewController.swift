//
//  ViewController.swift
//  right-left
//
//  Created by Omid Tavanaei on 6/17/19.
//  Copyright © 2019 Omid Tavanaei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let cellId = "cellId"
    
    
    let newCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = UIColor.gray
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
       
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCollection.delegate = self
        newCollection.dataSource = self
        newCollection.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(newCollection)
        setupCollection()
        setupButton()
    
    }
    

    func setupButton() {
     view.addSubview(inverseButton)
        inverseButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        
    }
    
    @objc func buttonPressed() {
        
        
        cells.first?.textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cells.first?.textLabel.trailingAnchor.constraint(equalTo: (cells.first?.imageView.leadingAnchor)!).isActive = true
        cells.first?.textLabel.textAlignment = .left
        
        
        cells.first?.imageView.removeFromSuperview()
        cells.first?.addSubview(cells.first!.imageView)
        
        cells.first?.imageView.centerYAnchor.constraint(equalTo: (cells.first?.centerYAnchor)!).isActive = true
        cells.first?.imageView.trailingAnchor.constraint(equalTo: (cells.first?.trailingAnchor)!).isActive = true
        cells.first?.imageView.leadingAnchor.constraint(equalTo: (cells.first?.textLabel.trailingAnchor)!).isActive = true
        cells.first?.imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cells.first?.imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        cells.first?.imageView.image = UIImage(named: "persianBack.png")

view.layoutIfNeeded()
        print("buttonPressed")
    }
    
    
    func setupCollection(){
        newCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newCollection.heightAnchor.constraint(equalToConstant: 200).isActive = true
        newCollection.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true

    }
    
    let inverseButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Inverse"
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x: 60, y: 60, width: 50, height: 50)

        return button
    }()
    
    var cells : [CustomCell] = []
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if true{
            
        }
        let cell = newCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 5
        cell.layer.shadowOpacity = 0
        cell.imageView.image = UIImage(named: "back.png")
        cells.append(cell)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    
}

    class CustomCell: UICollectionViewCell {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 0
        image.backgroundColor = UIColor.white
        
        return image
    }()
    
   let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .black
        label.text = "اسم"

        return label
    }()
    
    
    
        func setupView() {
        addSubview(imageView)
        addSubview(textLabel)
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.textLabel.leadingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
        textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
            
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
