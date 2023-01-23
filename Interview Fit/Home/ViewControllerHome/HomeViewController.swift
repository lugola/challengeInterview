//
//  HomeViewController.swift
//  Interview Fit
//
//  Created by Moises Lugo Aguilar on 23/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Declaration variables
    @IBOutlet weak var seniorityLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var containerInformation: UIView!
    @IBOutlet weak var CollectionViewHomeRow: UICollectionView!
    private var dataSource =  [ModelHome]()
    let reuseIdentifier = CentralStrings.tableCel
    
    
    //MARK: LoadingInformation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
    }
    
    private func initModel(data: [ModelHome]){
        for i in data {
            var model = ModelHome()
            model.name = i.name
            model.image = i.image
            dataSource.append(model)
        }
    }
    
    func loadUI(){
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        containerInformation.layer.cornerRadius = 15
        nameLb.setFontLabelAccessibility()
        seniorityLb.setFontLabelAccessibility()
        
        // Fill information cards
        
        CollectionViewHomeRow.showsVerticalScrollIndicator = false
        CollectionViewHomeRow.delegate = self
        CollectionViewHomeRow.dataSource = self
        self.initModel(data: [ModelHome.init(name: "Swift", image: CentralStrings.imgCollect1), ModelHome.init(name: "Android", image: CentralStrings.imgCollect2), ModelHome.init(name: "Java AWS", image: CentralStrings.imgCollect3), ModelHome.init(name: "Backend", image: "imageTool"),  ModelHome.init(name: "Backend", image: "imageTool"),  ModelHome.init(name: "Backend", image: "imageTool"), ModelHome.init(name: "UX/UI", image: CentralStrings.imgToolDefault)])
        profileImage.image = UIImage(named: CentralStrings.imgProfileDefault)
        nameLb.text = CentralStrings.nameUser
        seniorityLb.text = CentralStrings.seniorityUser
    }
    
    
    //MARK: RedirectionView
    
    func viewStoryboardDetail(index: IndexPath){
        let storyBoard: UIStoryboard = UIStoryboard(name: CentralStrings.storyboardHm, bundle: nil)
        // let newViewController = storyBoard.instantiateViewController(withIdentifier: "idNEWDETAIL") as! viewcontrollerDetail
        let name = self.dataSource[index.row].name!
        //   newViewController.titleNav = name
        // self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    
}


//MARK: Extension Protocols

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewHome
        cell.lbName.text = self.dataSource[indexPath.row].name ?? CentralStrings.noInfo
        cell.imgIcon.image = UIImage(named: self.dataSource[indexPath.row].image ?? CentralStrings.imgToolDefault)
        cell.containerViewCell.dropShadow()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Information \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            self.viewStoryboardDetail(index: indexPath)
            
        default:
            print("no information")
        }
    }
    
}
