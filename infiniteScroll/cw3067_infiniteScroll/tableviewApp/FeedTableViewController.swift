//
//  FeedTableViewController.swift
//  tableviewApp
//
//  Chaya Malik:
//  Sources Used: Professor Hitti's class code
//                https://www.youtube.com/watch?v=OTHkcf9gSRw
//                https://www.youtube.com/watch?v=Es4Tk0nU1OQ
//

import UIKit

class FeedTableViewController: UITableViewController {

    var sequence : [Int] = [0,1]
    let cellIdentifier = "userPostFeedCell"
    let offset = 100
    var numLoaded = 0;
    var fetchingMore = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(
            UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return sequence.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> FeedTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let myString = String(sequence[indexPath.row])
        cell.textLabel?.text = myString
        cell.textLabel?.textColor = UIColor.brown
        return cell as! FeedTableViewCell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height{
                addNext30()
        }
    
    }
    
    func addNext30 (){ //adds the next 30 fib numbers to the array
        let numPrev = numLoaded;
        numLoaded = numPrev + 30;
        for _ in numPrev...numLoaded - 2 {
            let prev1 = sequence[sequence.count-2]
            let prev2 = sequence.last!
            sequence.append(prev1+prev2)
        }
        self.tableView.reloadData()
        
    }
   

}
