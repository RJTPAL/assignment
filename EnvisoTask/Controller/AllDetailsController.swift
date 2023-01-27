//
//  AllDetailsController.swift
//  EnvisoTask
//
//  Created by Rajat Pal on 27/01/23.
//

import UIKit

class AllDetailsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var allDetails: [AllDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        getData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "AllDetailCell", bundle: nil), forCellReuseIdentifier: "AllDetailCell")
        
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        tableView.rowHeight = 131
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllDetailCell", for: indexPath) as! AllDetailCell
        cell.setup(with: allDetails[indexPath.row])
        
        return cell
    }
    
    func getData() {
        let session = URLSession.shared
        
        let mainUrl = URL(string: "https://ensivosolutions.com/randomjson.php")
        
        let task = session.dataTask(with: mainUrl!) { data, response, error in
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                if (httpResponse.statusCode == 200) {
                    // parse data
                    guard let model = try? JSONDecoder().decode(AllDetails.self, from: data!) else {return}
                    self.allDetails = model.allDetails
                    DispatchQueue.main.async {
                        self.loader.stopAnimating()
                        self.tableView.reloadData()
                    }
                }
            }
        }
        task.resume()
    }

}
