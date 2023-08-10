//
//  MenuVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 16/06/2023.
//

import UIKit

class MenuVC: UIViewController , MenumainTVCDelegate {
    func editButtonTapped() {
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .EdititemsVC) as! EdititemsVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var tblview : UITableView!
    @IBOutlet weak var sizetblview : UITableView!
    @IBOutlet weak var ingredientstblview : UITableView!
    @IBOutlet weak var cookingtblview : UITableView!
    @IBOutlet weak var colview : UICollectionView!
    @IBOutlet weak var menuView : UIView!
    @IBOutlet weak var addonsView : UIView!
    @IBOutlet weak var cookingView : UIView!
    @IBOutlet weak var sizeView : UIView!
    @IBOutlet weak var ingredientsView : UIView!
    //    @IBOutlet weak var colview : UICollectionView!
    //    @IBOutlet weak var colview : UICollectionView!
    var selectedIndexPath: IndexPath?
    var ordersLbl = ["Menu Items","Addons","Size","Ingredients","Cooking Reference"]
    var selectionCell = 0
    var categorycell = 0
    var categorymodel = [CategoryModel]()
    var ingredientsmodel = [IngredientsModel]()
    var sizemodel = [sizeModelMAin]()
    var cookingmodel = [cookingModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
        sizefetch()
        ingredientsFetch()
        cookingFetch()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func fetchdata()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            Utility.shared.showSpinner()
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/categories")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("o2s-chl=a794d41f632d178fac70a921becad1c9", forHTTPHeaderField: "Cookie")
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    Utility.shared.hideSpinner()
                    return
                }
                
                do {
                    Utility.shared.hideSpinner()
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataArray = jsonObject["data"] as? [[String: Any]] {
                        
                        for jsonItem in dataArray {
                            self.categorymodel.append(CategoryModel(fromDictionary: jsonItem))
                            
                        }
                        DispatchQueue.main.async {
                            
                            self.tblview.reloadData()
                        }
                        
                        // Perform UI updates or any other processing with the appended data here
                    } else {
                        print("Error: Unable to parse JSON data.")
                    }
                } catch {
                    Utility.shared.hideSpinner()
                    print("Error decoding response data: \(error)")
                }
                
                
                
            }
            
            task.resume()
        }
    }
    func sizefetch()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/sizes")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                do {
                    Utility.shared.hideSpinner()
                    
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataArray = jsonObject["data"] as? [[String: Any]] {
                        
                        for jsonItem in dataArray {
                            self.sizemodel.append(sizeModelMAin(fromDictionary: jsonItem))
                            
                        }
                        DispatchQueue.main.async {
                            
                            self.sizetblview.reloadData()
                        }
                        
                        // Perform UI updates or any other processing with the appended data here
                    } else {
                        print("Error: Unable to parse JSON data.")
                    }
                } catch {
                    Utility.shared.hideSpinner()
                    print("Error decoding response data: \(error)")
                }
            }
            
            task.resume()
        }
    }
    func ingredientsFetch()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
        var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/ingredients")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                Utility.shared.hideSpinner()
                
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let dataArray = jsonObject["data"] as? [[String: Any]] {
                    
                    for jsonItem in dataArray {
                        self.ingredientsmodel.append(IngredientsModel(fromDictionary: jsonItem))
                        
                    }
                    DispatchQueue.main.async {
                        
                        self.ingredientstblview.reloadData()
                    }
                    
                    
                } else {
                    print("Error: Unable to parse JSON data.")
                }
            } catch {
                Utility.shared.hideSpinner()
                print("Error decoding response data: \(error)")
            }

        }
        
        task.resume()
    }
    }
    func cookingFetch()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/cooking_ref")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                do {
                    Utility.shared.hideSpinner()
                    
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataArray = jsonObject["data"] as? [[String: Any]] {
                        
                        for jsonItem in dataArray {
                            self.cookingmodel.append(cookingModel(fromDictionary: jsonItem))
                            
                        }
                        DispatchQueue.main.async {
                            
                            self.cookingtblview.reloadData()
                        }
                        
                        
                    } else {
                        print("Error: Unable to parse JSON data.")
                    }
                } catch {
                    Utility.shared.hideSpinner()
                    print("Error decoding response data: \(error)")
                }
            }
            
            task.resume()
            
        }
    }
}
extension MenuVC: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ordersLbl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OrdersCVC
        cell.lbl.text = ordersLbl[indexPath.row]
        if selectionCell == indexPath.row {
            if indexPath.row == 0
            {
                menuView.isHidden = false
                addonsView.isHidden = true
                sizeView.isHidden = true
                ingredientsView.isHidden = true
                cookingView.isHidden = true
            }
            else if indexPath.row == 1
            {
                
                menuView.isHidden = true
                addonsView.isHidden = false
                cookingView.isHidden = true
                sizeView.isHidden = true
                ingredientsView.isHidden = true
            }
            
            else if indexPath.row == 2
            {
                
                menuView.isHidden = true
                addonsView.isHidden = true
                cookingView.isHidden = true
                sizeView.isHidden = false
                ingredientsView.isHidden = true
            }
            else if indexPath.row == 3
            {
                
                menuView.isHidden = true
                addonsView.isHidden = true
                sizeView.isHidden = true
                cookingView.isHidden = true
                ingredientsView.isHidden = false
            }
            else if indexPath.row == 4
            {
                
                menuView.isHidden = true
                addonsView.isHidden = true
                sizeView.isHidden = true
                cookingView.isHidden = false
                ingredientsView.isHidden = true
            }
            cell.backgroundview.backgroundColor = UIColor(hexString: "009FE7") // Set the background color for index 0
        } else {
            cell.backgroundview.backgroundColor =  UIColor(hexString: "F2F2F7") // Set the default background color for other cells
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let item = // Get the item data at indexPath
        let labelText = ordersLbl[indexPath.row]
        
        let labelWidth = calculateLabelWidth(for: labelText)
        
        let cellHeight: CGFloat = 40 // Set the desired height of the cell
        
        return CGSize(width: labelWidth, height: cellHeight)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectionCell = indexPath.row
        self.colview.reloadData()
        
        
    }
    func calculateLabelWidth(for text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 14) // Customize the font as needed
        let label = UILabel()
        label.font = font
        label.text = text
        label.sizeToFit()
        let labelWidth = label.frame.width
        return labelWidth
    }
    
}
extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sizetblview
        {
            return sizemodel.count
        }
        else if tableView == ingredientstblview
        {
            return ingredientsmodel.count
        }
        else if tableView == cookingtblview
        {
            return cookingmodel.count
        }
        else
        {
            return categorymodel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == sizetblview
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuSizeTVC
            cell.mainheader.text = sizemodel[indexPath.row].sizeName
            cell.datelbl.text = sizemodel[indexPath.row].dateModified
            return cell
        }
        else if tableView == ingredientstblview
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IngredientsTVC
            cell.mainheader.text = ingredientsmodel[indexPath.row].ingredientsName
            cell.datelbl.text = ingredientsmodel[indexPath.row].dateModified
            return cell
        }
        else if tableView == cookingtblview
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CookingTVC
            cell.mainheader.text = cookingmodel[indexPath.row].cookingName
            cell.datelbl.text = cookingmodel[indexPath.row].dateModified
            return cell
        }
        
        
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenumainTVC
            // cell.count = categorymodel[indexPath.row].itemsCount
            
            cell.secondTableView.reloadData()
            cell.headerlbl.text = categorymodel[indexPath.row].categoryName
            cell.totalitems.text = String(categorymodel[indexPath.row].itemsCount) + " Items"
            var path = categorymodel[indexPath.row].path!
            var imag = categorymodel[indexPath.row].photo!
            let urll = "http://adopteunelivraison.bruncheat.fr/"
            var fullImageUrl = urll + path + "/" + imag
            
            if let url = URL(string: fullImageUrl)
            {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data: data) {
                            print(indexPath.row)
                            print(self.categorymodel[indexPath.row].path)
                            if self.categorymodel[indexPath.row].path != ""
                            {
                                cell.img.image = image
                                path = ""
                                imag = ""
                                fullImageUrl = ""
                            }
                        } else {
                            
                        }
                    }
                }
                task.resume()
            } else {
                
            }
            
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sizetblview {
            
        } else if tableView == tblview {
            tableView.deselectRow(at: indexPath, animated: true)
            
            if let cell = tableView.cellForRow(at: indexPath) as? MenumainTVC {
                let categorycell = self.categorymodel[indexPath.row].catId
                
                if let selectedIndexPath = selectedIndexPath, selectedIndexPath == indexPath {
                    // The row is already selected, deselect it
                    self.selectedIndexPath = nil
                } else {
                    // A different row is selected, update the selectedIndexPath
                    self.selectedIndexPath = indexPath
                }
                
                cell.categoryid = categorycell!
                cell.datafetch {
                    DispatchQueue.main.async {
                        tableView.reloadRows(at: [indexPath], with: .automatic)
                        
                        if let selectedIndexPath = self.selectedIndexPath, selectedIndexPath == indexPath {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                // Reload the secondTableView data here
                                cell.secondTableView.reloadData()
                                tableView.reloadRows(at: [indexPath], with: .automatic)
                                
                            }                        }
                    }
                }
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == sizetblview
        {
            return 100
        }
        
        else if  tableView == tblview
        {
            if let selectedIndexPath = selectedIndexPath, indexPath == selectedIndexPath {
                
                if categorymodel[indexPath.row].itemsCount == 1
                {
                    return 280
                    
                }
                
                else if categorymodel[indexPath.row].itemsCount == 2
                {
                    return 408
                }
                else if categorymodel[indexPath.row].itemsCount == 3
                {
                    return 640
                }
                else if categorymodel[indexPath.row].itemsCount > 3
                {
                    return 815
                }
                
            }
            
            else {
                return 100
            }
        }
        return 100
    }
}

