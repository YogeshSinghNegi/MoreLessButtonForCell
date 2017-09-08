//
//  CustomTableViewClassVC.swift
//  MoreLessButtonForCell
//
//  Created by yogesh singh negi on 25/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

//=============================================================//
//MARK: CustomTableViewClassVC Class
//=============================================================//

class CustomTableViewClassVC: UIViewController {
    
//=============================================================//
//MARK: Stored Properties
//=============================================================//
    
    var myIndexPathRowArray = [Int]()
    // Stores the Title of the MoreORLes Button
    var moreBtnNameTitle = [String]()
    // Array for displaying TableView Content
    let nameArray = [
        """
 1. WhatsApp Messenger is a FREE messaging app available for Android and other smartphones. WhatsApp uses your phone's Internet connection (4G/3G/2G/EDGE or Wi-Fi, as available) to let you message and call friends and family. Switch from SMS to WhatsApp to send and receive messages, calls, photos, videos, documents, and Voice Messages.
 """,
        """
2. Photomath supports arithmetics, integers, fractions, decimal numbers, roots, algebraic expressions, linear equations/inequations, quadratic equations/inequations, absolute equations/inequations, systems of equations, logarithms, trigonometry, exponential and logarithmic functions, derivatives and integrals.
""",
        """
3. Airtel Payments Bank | Fino Payments Bank | Jio Payments Bank - RIL | Equitas Small Finance Bank | Aditya Birla Payments Bank-Idea | Janata Sahakari Bank Ltd. | Pune | Gopinath Patil Parsik Janata Sahakari Bank Ltd. | Apna Sahakari Bank Ltd. | Dombivli Nagari Sahakari Bank Ltd | Punjab & Maharashtra Cooperative Bank Limited | The Kalyan Janata Sahakari Bank Ltd. | Kallappanna Awade Ichalkaranji Janata Sahakari Bank Ltd. | The Mehsana Urban Cooperative Bank Ltd. | Thane Bharat Sahakari Bank Ltd. | Vasai Vikas Sahakari Bank Ltd. | Rajkot Nagarik Sahakari Bank Ltd. | Gujarat State Coop | The Hasti Coop Bank | Dhanalaxmi Bank | Tamilnad Mercantile bank.
""",
        """
4. Join Tiffi and Mr. Toffee on their sweet adventure through the Candy Kingdom. Travel through magical lands, visiting wondrous places and meeting deliciously kooky characters! Switch and match your way through hundreds of fun levels in this delicious puzzle adventure. The sweetest game just keeps getting sweeter!
""",
        """
 5. The Amazon India Shopping App brings to you, over 10 Crore original products and at great prices. Shop on the Amazon App for the latest electronics – Redmi 4, Apple iPhone 7, Samsung J7, OnePlus 3T & many more, accessories & software for your gadgets - memory cards, earphones, chargers, power banks & anti-virus. Don’t just stop there, shop for your home needs and choose from selection across TVs, refrigerators, water purifiers, washing machines, sofa sets, mattresses, bean bags, wall stickers & cookware. Shop from Amazon Fashion for all occasions – Formal attire, vacation wear to casual and daily wear – shirts for men, sarees & gowns for women, watches and jewellery to match and shoes & footwear to boot. Also, the kids range of clothes, footwear, toys - from remote control cars, to bicycles, skateboards and school supplies –bags, bottles & more. Download the Amazon India Shopping App for free, from Google Play Store & enjoy online shopping like never before.
 """,
        """
6. UC Browser is a free web browser for android devices with Fast Download, Data Saving, Ad-Block functionality, and helps you access music, video, cricket information with smooth experience. Customized cricket feature is available on UC Browser. You can visit many cricket sites to support your team, and watch cricket live stream, and check out match scores on UC Browser.
""",
        """
7. VLC media player is a free and open source cross-platform multimedia player that plays most multimedia files as well as discs, devices, and network streaming protocols. VLC media player is a free and open source cross-platform multimedia player that plays most multimedia files as well as discs, devices, and network streaming protocols.
""",
        """
8. Gboard has everything you love about Google Keyboard—speed and reliability, Glide Typing, voice typing, and more—plus Google Search built in. No more app switching; just search and share, right from your keyboard.
""",
        """
9. Get the official YouTube app for Android phones and tablets. See what the world is watching -- from the hottest music videos to what’s trending in gaming, entertainment, news, and more. Subscribe to channels you love, share with friends, and watch on any device.
"""]
    
//=============================================================//
//MARK: Defining IBOutlets
//=============================================================//
    
    @IBOutlet weak var customTableView: UITableView!
   
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Setting Delegate and DataSouce
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        // Setting Title Of Navigation Item
        self.navigationItem.title = "Play Store Apps"
        
        //Setting Default Initial Value for myTndexPathRowArray and moreBtnNameTitle
        for tempIndex in 0...(self.nameArray.count - 1){
            self.myIndexPathRowArray.insert(self.nameArray.count, at: tempIndex)
            self.moreBtnNameTitle.insert("More", at: tempIndex)
        }
    }
    
//=============================================================//
//MARK: Expanding OR Contracting Selected Rows - Using More OR Less Button
//=============================================================//
    
    @IBAction func moreBtnTapped(_ sender: UIButton) {
        // Getting TableCell for the current Selected Row
        guard let tableCell = self.getCell(button: sender) as? CellForRowClass else {fatalError("Cell failed to load on MoreORLess Button")}
        guard let indexPath = self.customTableView.indexPath(for: tableCell) else {fatalError("IndexPath failed to load on MoreORLess Button")}
        if tableCell.moreBtnName.currentTitle! == "More"{
            // Storing the index of the selected row
            self.myIndexPathRowArray[indexPath.row] = indexPath.row
            // Changing the Title of the MoreOrLess Button on clicking it
            self.moreBtnNameTitle[indexPath.row] = "Less"
        }
        else if tableCell.moreBtnName.currentTitle! == "Less"{
            // Storing the dummy value in the current index
            self.myIndexPathRowArray[indexPath.row] = self.nameArray.count
            // Changing the Title of the MoreOrLess Button on clicking it
            self.moreBtnNameTitle[indexPath.row] = "More"
        }
        // Reloading only those rows which are selected
         self.customTableView.reloadRows(at: [indexPath], with: .automatic)
        
    }

}

//=============================================================//
//MARK: CustomTableViewClassVC Class Extension
//=============================================================//

extension CustomTableViewClassVC: UITableViewDelegate,UITableViewDataSource{
    
//=============================================================//
//MARK: Setting Number Of Cells
//=============================================================//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
//=============================================================//
//MARK: Setting the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForRowClass_ID") as? CellForRowClass else { fatalError("Cell Failed to load") }
        
        cell.nameLabel.text = self.nameArray[indexPath.row]
        cell.moreBtnName.setTitle(self.moreBtnNameTitle[indexPath.row], for: .normal)
        
        return cell
    }
    
//=============================================================//
//MARK: Setting Height Of the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == self.myIndexPathRowArray[indexPath.row]{
                // Setting the rows with Automatic Dimension
                return UITableViewAutomaticDimension
            }
        return 100
    }
    
//=============================================================//
//MARK: User Define Method for Getting IndexPath
//=============================================================//
    
    func getCell(button: UIButton) -> UITableViewCell{
        var cell : UIView = button
        while !(cell is CellForRowClass) {
            if let super_view = cell.superview {
                cell = super_view
            }
        }
        guard let tableCell = cell as? CellForRowClass else { fatalError() }
        return tableCell
    }
  
}

//=============================================================//
//MARK: Class for Cell Label
//=============================================================//

class CellForRowClass: UITableViewCell {
    
//=============================================================//
//MARK: TableView IBOutlet
//=============================================================//
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var moreBtnName: UIButton!
    
}

