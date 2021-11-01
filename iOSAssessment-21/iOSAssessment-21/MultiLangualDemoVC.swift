//
//  ViewController.swift
//  iOSAssessment-21
//
//  Created by satyam dixit on 27/10/21.
//

import UIKit

class MultiLangualDemoVC: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mynameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var mystateLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var mycountryLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var mydobLbl: UILabel!
    @IBOutlet weak var lotterywonLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var demoSeg: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func segAction(_ sender: UISegmentedControl) {
        
        if demoSeg.selectedSegmentIndex == 0
        {
            self.changingLanguage(lan: "en")
        }
        else if demoSeg.selectedSegmentIndex == 1
        {
            self.changingLanguage(lan: "de")
        }
        else
        {
            self.changingLanguage(lan: "es")
        }
    }

    func changingLanguage(lan : String)
    {
        titleLbl.text = "title".stringLoc(loc: lan)
        nameLbl.text = "namekey".stringLoc(loc: lan)
        mynameLbl.text = "mynamekey".stringLoc(loc: lan)
        stateLbl.text = "statekey".stringLoc(loc: lan)
        mystateLbl.text = "mystatekey".stringLoc(loc: lan)
        countryLbl.text = "countrykey".stringLoc(loc: lan)
        mycountryLbl.text = "mycountrykey".stringLoc(loc: lan)
        dobLbl.text = "dobkey".stringLoc(loc: lan)
        mydobLbl.text = "mydobkey".stringLoc(loc: lan)
        lotterywonLbl.text = "lotterykey".stringLoc(loc: lan)
        amountLbl.text = "amountkey".stringLoc(loc: lan)
        
    }

}

extension String{
    
    func stringLoc(loc : String) -> String
    {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle! , value: "", comment: "")
        
    }
}
