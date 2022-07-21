//
//  UndoneViewController.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 20/07/22.
//

import UIKit

class UndoneViewController: UIViewController {

    
    
    @IBOutlet var undoneTableView: UITableView!
    var undones: [UndoneTransaction] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "UndoneTableViewCell", bundle: nil)
        undoneTableView.register(nib, forCellReuseIdentifier: "undoneCell")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        undoneTableView.delegate = self
        undoneTableView.dataSource = self

        // Do any additional setup after loading the view.
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

extension UndoneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return undones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = undoneTableView.dequeueReusableCell(withIdentifier: "undoneCell") as!TransactionTableViewCell
        
        let undone = undones[indexPath.row]
        cell.titleLabel.text = undone.title
        
//        let play = undone[indexPath]

        return cell
    }
}
