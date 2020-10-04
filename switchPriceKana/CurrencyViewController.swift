//
//  CurrencyViewController.swift
//  switchPriceKana
//
//  Created by Woohyun Kim on 2020/10/02.
//  Copyright © 2020 Woohyun Kim. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    


    var selectedCurrency = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencyDic.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyCell else {
            return UITableViewCell()
        }
        cell.currencyCountryButton.setTitle(currencyCountry[indexPath.row], for: .normal)
        cell.currencyLabel.text = currencyDic[currencyCountry[indexPath.row]]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let userCurrency = currencyDic[currencyCountry[indexPath.row]]{
            selectedCurrency = userCurrency
        }
        self.performSegue(withIdentifier: "unwindSegue", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let svc = segue.destination as? SwitchViewController{
            svc.currency = selectedCurrency
        }
    }
}

class CurrencyCell: UITableViewCell {
    @IBOutlet var currencyCountryButton: UIButton!
    @IBOutlet var currencyLabel: UILabel!
}
