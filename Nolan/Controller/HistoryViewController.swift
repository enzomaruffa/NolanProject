//
//  HistoryViewController.swift
//  Nolan
//
//  Created by Enzo Maruffa Moreira on 07/11/19.
//  Copyright © 2019 Mateus Nunes. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var poseInfoView: UIView!
    
    var date: Date?
    
    let dateFormatter = DateFormatter()
    let searchFormatter = DateFormatter()
    
    var feedbacks: [RKFeedbackSession] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchFormatter.dateFormat = "YYYY-MM-dd"
        
        historyTableView.delegate = self
        historyTableView.dataSource = self

        poseInfoView.cornerRadius = 20
        addLightShadow(view: poseInfoView)
    
        // Do any additional setup after loading the view.
    }
    
    func addLightShadow(view: UIView) {
         view.layer.shadowOffset = CGSize(width: 0, height: 2)
         view.layer.shadowRadius = 4
         view.layer.shadowColor = UIColor.lightGray.cgColor
         view.layer.shadowOpacity = 0.25
     }
    
    override func viewWillAppear(_ animated: Bool) {
        // TODO: Puxar do model
        if let date = self.date {
            let dateString = searchFormatter.string(from: date)
            feedbacks = Singleton.shared.feedbacks.filter( { searchFormatter.string(from: $0.date) == dateString } )
            historyTableView.reloadData()
            
            dateFormatter.dateFormat = "MMM dd, yyyy"
            dateLabel.text = dateFormatter.string(from: date)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTableViewCell
        
        cell.setup(feedbackSession: feedbacks[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "viewHistoryEntry", sender: Singleton.shared.feedbacks[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewHistoryEntry" {
            if let destination = segue.destination as? HistoryEntryViewController, let feedbackSession = sender as? RKFeedbackSession {
                
                destination.feedbackSession = feedbackSession
                
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
