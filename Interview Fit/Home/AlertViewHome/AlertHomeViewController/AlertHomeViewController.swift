//
//  AlertHomeViewController.swift
//  Interview Fit
//
//  Created by Moises Lugo Aguilar on 24/01/23.
//

import UIKit

class AlertHomeViewController: UIViewController {
    
    @IBOutlet weak var containerAlertView: UIView!
    @IBOutlet weak var tableSeniority: UITableView!
    
    var titleNav = String()
    let cellReuse = "cell"
    var dataSource =  [ModelAlert]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewAlert()
    }
    
    @IBAction func backMenu(_ sender: UIButton) {
        self.removeAnimate()
    }
    
    func loadViewAlert(){
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        self.navigationController?.isNavigationBarHidden = true
        tableSeniority.delegate = self
        tableSeniority.dataSource = self
        self.initModel(data: [ModelAlert.init(name: "Jr", image: nil), ModelAlert.init(name: "Middle JR", image: nil), ModelAlert.init(name: "Sr", image: nil), ModelAlert.init(name: "SSr", image: nil)])
    }
    
    func initModel(data: [ModelAlert] ){
        for i in data {
            var model = ModelAlert()
            model.name = i.name
            model.image = i.image
            dataSource.append(model)
        }
    }
    
    //MARK: Animation
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}



extension AlertHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as! SeniorityTableViewCell
        cell.nameLb.text = self.dataSource[indexPath.row].name
        // si desean agregar imagen cell.imgProfileCell.image 
        cell.containerCell.layer.cornerRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Information \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            print(indexPath.row)
            let vc = UINavigationController(rootViewController: QuestionsFitsViewController())
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("no information")
        }
    }
    
}
