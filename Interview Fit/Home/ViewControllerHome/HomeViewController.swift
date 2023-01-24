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
    var authModel = AuthModel()
    
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
        self.initModel(data: [ModelHome.init(name: "iOS", image: CentralStrings.imgCollect1), ModelHome.init(name: "Android", image: CentralStrings.imgCollect2), ModelHome.init(name: "Java", image: CentralStrings.imgCollect3), ModelHome.init(name: "Backend", image: CentralStrings.imgCollect4)])
        profileImage.downloaded(from: authModel.imageUrl!)
        nameLb.text = authModel.fullName
        seniorityLb.text = authModel.emailAddress
    }
    
    
    //MARK: RedirectionView
    
    func viewStoryboardDetail(index: IndexPath){
        let storyBoard: UIStoryboard = UIStoryboard(name: CentralStrings.storyboardHm, bundle: nil)
        let popOverAlert = storyBoard.instantiateViewController(withIdentifier: "idAlert") as! AlertHomeViewController
        //if want to pass data for reference let name = self.dataSource[index.row].name!
        //  popOverAlert.name = name
        self.addChild(popOverAlert)
        self.view.addSubview(popOverAlert.view)
        popOverAlert.didMove(toParent: self)
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
        cell.imgIcon.image = UIImage(named: self.dataSource[indexPath.row].image ?? CentralStrings.imgToolDefault)?.withRoundedCorners()
        cell.containerViewCell.dropShadow()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Information \(indexPath.row)")
        self.viewStoryboardDetail(index: indexPath)
    }
}
