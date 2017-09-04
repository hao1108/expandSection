//
//  SingleAnalysisViewController.swift
//  TtDpsGSwift
//
//  Created by 黃毓皓 on 28/08/2017.
//  Copyright © 2017 ice elson. All rights reserved.
//

import UIKit


class SingleAnalysisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandableHeaderViewDelegate{

    //取得螢幕尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    
 
    
    
    var tableVIew: UITableView!

    var sections = [
        Section(genre: "🦁 Animation",
                movies: ["The Lion King", "The Incredibles"],
                expanded: false),
        Section(genre: "💥 Superhero",
                movies: ["Guardians of the Galaxy", "The Flash", "The Avengers", "The Dark Knight"],
                expanded: false),
        Section(genre: "👻 Horror",
                movies: ["The Walking Dead", "Insidious", "Conjuring"],
                expanded: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //產生tablevie
        tableVIew = UITableView(frame: CGRect(x: 0, y: 100, width: 250 , height: 450))
        ////這裡register用到自訂cell類別SingleAnalysisViewControllerCell
        tableVIew.register(SingleAnalaysisViewCell.self, forCellReuseIdentifier: "labelCell")
        tableVIew.dataSource = self
        tableVIew.delegate = self
        self.view.addSubview(tableVIew)
        
        tableVIew.separatorStyle = .none
//        
//        //呼叫api
//        GetAndAnalysisApi.getSingleAnalysisData(userID: "60", theDate: "2017-08-30", pId: "799") { (json) in
//            print("getSingleAnalyse:\(json)")
//        }
        
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as! SingleAnalaysisViewCell
        
//       
//        cell.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
//        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        
        tableVIew.beginUpdates()
        for i in 0 ..< sections[section].movies.count {
            tableVIew.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableVIew.endUpdates()
    }
    



    
}
