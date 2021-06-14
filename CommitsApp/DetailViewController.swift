//
//  DetailViewController.swift
//  CommitsApp
//
//  Created by Maxim on 14.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var detailItem: Commit?


    @IBOutlet weak var detailLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detail = self.detailItem {
                detailLable.text = detail.message
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1 / \(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
        }

        // Do any additional setup after loading the view.
    }
    @objc func showAuthorCommits(){
        let ac = UIAlertController(title: "Author commits", message: nil,
    preferredStyle: .actionSheet)
        if let detail = self.detailItem{
            for case let commit as Commit in detail.author.commits{
                ac.addAction(UIAlertAction(title: commit.message,style: .default){
                    [unowned self] _ in
                    detailLable.text = commit.message
                    })
            }
        }
       
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        
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
