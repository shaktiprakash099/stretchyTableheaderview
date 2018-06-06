//
//  DetailsTableViewController.swift
//  Photos-DucTran
//
//  Created by GLB-312-PC on 05/06/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    var image : UIImage?
    let comments = Comment.allComments()
    var category: String?
    
    
    
    private let tableHeaderViewHeight :  CGFloat = 500 //UIScreen.main.bounds.size.height * (3/4)
    private let tableHeaderViewCutAway: CGFloat = 40.0
    var headerview: DetailsheaderView!
    var headerMasklayer: CAShapeLayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = category
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerview = tableView.tableHeaderView as! DetailsheaderView
        headerview.image = image
        
        tableView.tableHeaderView = nil
        tableView.addSubview(headerview)
        tableView.contentInset = UIEdgeInsetsMake(tableHeaderViewHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y:  -tableHeaderViewHeight + 64 )
        
        headerMasklayer = CAShapeLayer()
        headerMasklayer.fillColor = UIColor.black.cgColor
        headerview.layer.mask = headerMasklayer
        
        let effectiveheight = tableHeaderViewHeight - tableHeaderViewCutAway/2
        tableView.contentInset = UIEdgeInsetsMake(effectiveheight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y:  -effectiveheight )
        updateHedarView()
        
        
    }

    func updateHedarView()  {
      let effectiveheight = tableHeaderViewHeight - tableHeaderViewCutAway/2
        var headerRect =  CGRect(x: 0, y: -effectiveheight, width: tableView.bounds.width,height: tableHeaderViewHeight)
        
        if tableView.contentOffset.y < -effectiveheight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + tableHeaderViewCutAway / 2
        }
        
        headerview.frame = headerRect
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
      path.addLine(to: CGPoint(x: 0, y: headerRect.height - tableHeaderViewCutAway))
        headerMasklayer?.path = path.cgPath
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        cell.comment = comments[indexPath.row]
        return cell
    }
    

}

extension DetailsTableViewController{
  override  func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHedarView()
    }
}
