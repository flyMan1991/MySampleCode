//
//  ViewController.swift
//  CXCornerRadius
//
//  Created by mac on 2017/3/13.
//  Copyright © 2017年 CES. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let table  = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.table.delegate = self
        self.table.dataSource = self
        self.view.addSubview(self.table)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "tableviewcell"
        self.table.register(CustomTableViewCell.self, forCellReuseIdentifier: identifier)
        let cell = self.table.dequeueReusableCell(withIdentifier: identifier) as! CustomTableViewCell
        
        cell.selectionStyle = .none
        cell.setupContent(imgName: "640*960.png")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 100
    }
    
    
    
    
    


}

