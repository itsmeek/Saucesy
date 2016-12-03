//
//  HomeDetailVC.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/25/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import UIKit

class HomeDetailVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make the reuseable cell with identifier and connet it to the class
        tableView.register(MyCell.self, forCellReuseIdentifier: "HomeDetailVC")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "HeaderId")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDetailVC", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    //Section Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderId")
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 336.0
    }
}

// Custom header
class Header: UITableViewHeaderFooterView{
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Food Image
    let foodImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foodImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Name Label
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Salsa Verde Chicken Bake"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Calories Label
    let caloriesLabel: UILabel = {
        let label = UILabel()
        let calorie = "360"
        let caloriesText = "CALORIES"
        let caloriesLabel = "\(calorie)  \(caloriesText)"
        label.textColor = UIColor(red:234/255, green:84/255, blue:85/255, alpha:1.0)
        label.font = UIFont(name: "Avenir", size: 13.0)
        label.font = UIFont.systemFont(ofSize: 13.0, weight: UIFontWeightMedium)
        
        //Api request number (changing color)
        let range = (caloriesLabel as NSString).range(of: caloriesText)
        let attributedString = NSMutableAttributedString(string: caloriesLabel)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red:45/255, green:64/255, blue:89/255, alpha:1.0) , range: range)
        
        
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupHeader(){
        
        addSubview(foodImage)
        addSubview(caloriesLabel)
        
        //Horizontal Constraints for Image
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": foodImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(260)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": foodImage]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": caloriesLabel]))
        
        //Calories Stackview
//        let caloriesStackview = UIStackView(arrangedSubviews: [caloriesLabel,caloriesLabelStatic])
//        caloriesStackview.axis = .horizontal
//        caloriesStackview.spacing = 3
//        caloriesStackview.alignment = .fill
//        caloriesStackview.distribution = .fill
//        caloriesStackview.translatesAutoresizingMaskIntoConstraints = false
//        
//        //Servings Stackview
//        let servingsStackview = UIStackView(arrangedSubviews: [servingsLabel,servingsLabelStatic])
//        servingsStackview.axis = .horizontal
//        servingsStackview.spacing = 3
//        servingsStackview.alignment = .fill
//        servingsStackview.distribution = .fill
//        servingsStackview.translatesAutoresizingMaskIntoConstraints = false
//        
//        //Nest Servings and Calories Stackview
//        let foodDetailsStackview = UIStackView(arrangedSubviews: [caloriesStackview, servingsStackview])
//        foodDetailsStackview.spacing = 10
//        foodDetailsStackview.alignment = .fill
//        foodDetailsStackview.distribution = .fill
//        foodDetailsStackview.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(foodDetailsStackview)
//        
//        
//        //Nest Name Label with Nested Servings and Calories Stackview
//        let foodInformationStackview = UIStackView(arrangedSubviews: [nameLabel, foodDetailsStackview])
//        foodInformationStackview.axis = .vertical
//        foodInformationStackview.spacing = 9
//        foodInformationStackview.alignment = .fill
//        foodInformationStackview.distribution = .fill
//        foodInformationStackview.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(foodInformationStackview)
        
        //Horizontal Constraints for Nest Name Label with Nested Servings and Calories Stackview
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": caloriesLabel]))
        
        //Vertical Constraints for Image and Nest Name Label with Nested Servings and Calories Stackview
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(260)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": foodImage]))

    }

}

// Custom cell
class MyCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupviews(){
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
    }
}





















//var detail_recipe: model_Recipe!
//
//@IBOutlet weak var tableview: UITableView!
////    @IBOutlet weak var label: UILabel!
//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    tableview.delegate = self
//    tableview.dataSource = self

//        self.navigationController?.navigationBar.isHidden = true



//        print(detail_recipe.model_recipe_array[0].name)

//        label!.text = detail_recipe.model_recipe_array[0].name

// Do any additional setup after loading the view.
//}



//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//
//        cell.textLabel?.text = "test"
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
