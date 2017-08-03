//
//  MoreViewController.swift
//  RunRRR
//
//  Created by Starla on 2017/3/31.
//  Copyright © 2017年 EEECamp. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, segueViewController {
    @IBOutlet weak var moreTableView: UITableView!
    var prevVC : UIViewController?
    let list = ["Barcode","Die","About","SOS","Logout"]
    let identities = ["Barcode","Die","About","SOS","Logout"]
    let itemsHeight = [500,500,500,500]
    let menuBar : MenuBarBelow = {
        let menubar = MenuBarBelow()
        menubar.currentPage = "More"
        return menubar
    }()
    var preSelectedIndexPath:IndexPath?
    var selectedIndexPath:IndexPath?
    var istoggle:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        prevVC?.dismiss(animated: false, completion: nil)
        menuBar.delegate = self
        menuBar.dataSource = self
        self.view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue:230/255, alpha: 1)
        self.view.addSubview(menuBar)
        self.view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        self.view.addConstraintWithFormat(format: "V:[v0(\(self.view.frame.height/6))]-0-|", views: menuBar)
        moreTableView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue:230/255, alpha: 1)
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(list.count)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let MoreCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "MoreCell")
        let barcodeView = BarcodeView()
        /*
        print(3)
        print(indexPath.row)
        if indexPath.row == 0{
            barcodeView.hideContent(false)
            print("f")
        }else{
            barcodeView.hideContent(true)
            print("t")
        }
        if(indexPath.item == 0){
            barcodeView.frame = MoreCell.bounds
            barcodeView.hideContent(true)
            MoreCell.contentView.clipsToBounds = true
            MoreCell.addSubview(barcodeView)
        }else{
            MoreCell.textLabel?.text = list[indexPath.row]
        }
        */
        return MoreCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndexPath == indexPath{
            return 300
        }
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vcName = identities[indexPath.row]
        selectedIndexPath = indexPath
        
        //let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        
        //self.navigationController?.pushViewController(viewController!, animated: true)
        //self.present(viewController!, animated: false, completion: nil)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    func segueToMissions() {
        let vc = UIStoryboard(name: "Missions", bundle: nil).instantiateViewController(withIdentifier: "MissionsViewController") as! MissionsViewController
        //print(vc.description)
        vc.prevVC = self
        self.present(vc, animated: false, completion: nil)
    }
    func segueToMore() {
        
    }
    func segueToBags() {
        let vc = UIStoryboard(name: "Bag", bundle: nil).instantiateViewController(withIdentifier: "BagCollectionViewController") as! BagCollectionViewController
        //print(vc.description)
        vc.prevVC = self
        self.present(vc, animated: false, completion: nil)
    }
    func segueToMaps() {
        dismiss(animated: false, completion: nil)
    }

}
