//
//  CategoryViewControllerViewController.swift
//  CatagoryViewController
//
//  Created by R88 on 02/01/17.
//
struct Monitor{
    var id: Int
    var name: String
    var price: Double
    var disCountPrice: Double
}

struct Mobile{
    var id: Int
    var name: String
    var price: Double
    var disCountPrice: Double
}



import UIKit

class CategoryViewController: UIViewController {
    
    
    
    @IBOutlet weak var MonitorItemCollectionView: UICollectionView!
    
    
    var arrMonitorItems: [Monitor] = []
    var arrMobileItems: [Mobile] = []
    var arr = [UIColor.blue.cgColor,UIColor.yellow.cgColor,UIColor.blue.cgColor,UIColor.yellow.cgColor,UIColor.black.cgColor,UIColor.blue.cgColor]
    var numberOfItemInRow: Int = 2
    var interItemSpace: CGFloat = 16
    
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    private func setup(){
        loadMonitors()
        configureMonitorCategoryCollection()
        loadMobiles()
    }
    
    
    private func loadMonitors(){
        
        let dell: Monitor = Monitor(id: 1, name: "dell", price: 32514, disCountPrice: 4000)
        let hp: Monitor = Monitor(id: 2, name: "hp", price: 38814, disCountPrice: 3000)
        let lenovo: Monitor = Monitor(id: 3, name: "lenovo", price: 43227, disCountPrice: 2000)
        let apple: Monitor = Monitor(id: 4, name: "apple", price: 65444, disCountPrice: 4000)
        let logitec: Monitor = Monitor(id: 5, name: "logitec", price: 32514, disCountPrice: 4000)
        let microsoft: Monitor = Monitor(id: 6, name: "microsoft", price: 32514, disCountPrice: 4000)
        let microSd: Monitor = Monitor(id: 7, name: "microSd", price: 32514, disCountPrice: 4000)
        let thinkvision: Monitor = Monitor(id: 8, name: "thinkvision", price: 32514, disCountPrice: 4000)
        let macbookPro: Monitor = Monitor(id: 9, name: "macbookPro", price: 32514, disCountPrice: 4000)
        let asus: Monitor = Monitor(id: 10, name: "asus", price: 32514, disCountPrice: 4000)
        
        arrMonitorItems = [dell,hp,lenovo,apple,logitec,microsoft,microSd,thinkvision,macbookPro,asus,dell,hp,lenovo,apple,logitec,microsoft,microSd,thinkvision,macbookPro,asus,dell,hp,lenovo,apple,logitec,microsoft,microSd,thinkvision,macbookPro,asus,dell,hp,lenovo,apple,logitec,microsoft,microSd,thinkvision,macbookPro,asus,dell,hp,lenovo,apple,logitec,microsoft,microSd,thinkvision,macbookPro,asus]
        
        
    }
    
    private func loadMobiles(){
        
        let samsung: Mobile = Mobile(id: 1, name: "Samsung", price: 32514, disCountPrice: 4000)
        let vivo: Mobile = Mobile(id: 2, name: "Vivo", price: 38814, disCountPrice: 3000)
        let samsung1: Mobile = Mobile(id: 3, name: "Samsung1", price: 43227, disCountPrice: 2000)
        let apple: Mobile = Mobile(id: 4, name: "Apple", price: 65444, disCountPrice: 4000)
        let logitec: Mobile = Mobile(id: 5, name: "Logitec", price: 32514, disCountPrice: 4000)
        let micromex: Mobile = Mobile(id: 6, name: "Micromex", price: 32514, disCountPrice: 4000)
        let oppo: Mobile = Mobile(id: 7, name: "Oppo", price: 32514, disCountPrice: 4000)
        let redmi: Mobile = Mobile(id: 8, name: "Redmi", price: 32514, disCountPrice: 4000)
        let apple14: Mobile = Mobile(id: 9, name: "MacbookPro", price: 32514, disCountPrice: 4000)
        let asus: Mobile = Mobile(id: 10, name: "Asus", price: 32514, disCountPrice: 4000)
        
        arrMobileItems = [samsung,vivo,samsung1,apple,logitec,micromex,oppo,redmi,apple14,asus,samsung,vivo,samsung1,apple,logitec,micromex,oppo,redmi,apple14,asus,samsung,vivo,samsung1,apple,logitec,micromex,oppo,redmi,apple14,asus]
        
        
    }
    
    
    private func configureMonitorCategoryCollection(){
        
        
        let nibFile: UINib = UINib(nibName: "MonitorCollectionViewCell", bundle: nil)
        MonitorItemCollectionView.register(nibFile, forCellWithReuseIdentifier: "MonitorCollectionViewCell")
        
        MonitorItemCollectionView.register(UINib(nibName: "MobileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MobileCollectionViewCell")
    }
}


extension CategoryViewController: UICollectionViewDelegate ,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
        // return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{ // ans: Out of range aave tyare
            return arrMonitorItems.count
        }else{
            return arrMobileItems.count
        }
        
        //return arrMonitorItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell: MonitorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonitorCollectionViewCell", for: indexPath) as! MonitorCollectionViewCell
            
            let monitorItem = arrMonitorItems[indexPath.row]
            cell.nameLabel.text = "\(monitorItem.name) \n$\(monitorItem.disCountPrice)"
            
            cell.layer.backgroundColor = arr.randomElement()
            if indexPath.row == selectedIndex{
                cell.layer.borderColor = UIColor.red.cgColor
            } else {
                cell.layer.borderColor = UIColor.black.cgColor
            }
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        } else{
            let cell: MobileCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MobileCollectionViewCell", for: indexPath) as! MobileCollectionViewCell
            cell.nameLabel.text = arrMobileItems[indexPath.row].name  // fatal error aave tyare (110 mi line ma condition ma 1 htu teni jagya ae 0 mukvu)
            cell.priceLabel.text = "$\(arrMobileItems[indexPath.row].price)"
            //            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }
        
        
        //        for row in 0..<arrMonitorItems.count{
        //            if arrMonitorItems[row].Monitor.cgColor == MobileCollectionViewCell{
        //
        //        }
        //
        //    }
        //
        
        //        let cell: MonitorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonitorCollectionViewCell", for: indexPath) as! MonitorCollectionViewCell
        //
        //
        //
        //        let MonitorItems = arrMonitorItems[indexPath.row]
        //        cell.nameLabel.text = "\(MonitorItems.name) \n $\(MonitorItems.price) \n discount price \(MonitorItems.disCountPrice) "
        //        cell.layer.borderWidth = 1
        //        cell.layer.borderColor = UIColor.blue.cgColor
        //
        //        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            let monitorItem = arrMonitorItems[indexPath.row]
            selectedIndex = indexPath.row
            print(monitorItem.name)
            print(monitorItem.id)
            collectionView.reloadData()
        }
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            let spacing = CGFloat(numberOfItemInRow+1) * interItemSpace
            let avilableWidth = collectionView.frame.width - spacing
            let cellWidth = avilableWidth / CGFloat(numberOfItemInRow)
            return CGSize(width: cellWidth, height: cellWidth)
        } else {
            let spacing = CGFloat(numberOfItemInRow+1) * interItemSpace
            let avilableWidth = collectionView.frame.width - spacing
            let cellWidth = avilableWidth / CGFloat(numberOfItemInRow)
            return CGSize(width: cellWidth, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
