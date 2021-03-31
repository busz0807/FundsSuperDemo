//
//  SecondSearchViewController.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 19/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import IQKeyboardManagerSwift


protocol SecondSearchDisplayLogic: class {
  func displaySomething(viewModel: SecondSearch.Something.ViewModel)
}

class SecondSearchViewController: UIViewController, SecondSearchDisplayLogic {
  var interactor: SecondSearchBusinessLogic?
    var searchFunds: ReealmFundsListMobile?
  var router: (NSObjectProtocol & SecondSearchRoutingLogic & SecondSearchDataPassing)?

    @IBAction func btnconfirm(_ sender: Any)  {
//        print("textFeild", txtFieldnumber.text ?? "")
        let txt = txtFieldnumber.text ?? ""
        let min = self.searchFunds?.min1stInv ?? 0
        let minString = String(min)
        let minCurrency = minString.currency
        print("minCurrency",minCurrency)
        print("txt",txt)
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        let minInt = numberformatter.number(from: minCurrency)?.intValue ?? 0
        let txtInt = numberformatter.number(from: txt)?.intValue ?? 0
        print("minInt", minInt )
        print("txtInt", txtInt )
        
        if txt == "" {
            let alert = UIAlertController(title: "ขออภัย", message: "โปรดระบุจำนวนเงิน", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        } else if txt == "0" {
            let alert = UIAlertController(title: "ขออภัย", message: "โปรดระบุจำนวนเงิน", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        } else if txtInt > 9_999_999_999 {
            let alert = UIAlertController(title: "ขออภัย", message: "โปรดระบุจำนวนเงินน้อยกว่า 9,999,999,999", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }else if txtInt < minInt  {
            let alert = UIAlertController(title: "ขออภัย", message: "ลงทุนขั้นต่ำครั้งแรกเริ่มต้นที่ \(minCurrency)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }else {
        sendclick()
        router?.sendPicegoToBuyPreview()
        }
    }

    @IBOutlet weak var lbminInv: UILabel!
    @IBOutlet weak var lbmin1stInv: UILabel!
    @IBOutlet weak var txtFieldnumber: UITextField!
    @IBOutlet weak var lbFundsTH: UILabel!
    @IBOutlet weak var lbFundsEN: UILabel!
    @IBOutlet weak var btnrisk: UIButton!
   
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var navtitle: UINavigationItem!
    @IBAction func btnRisksecond(_ sender: Any) {
        router?.sendDatagoToRiskPreview(risk: self.searchFunds?.risk)
    }
   
    @IBAction func btnback(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var setviewBtn: UIView!
    // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = SecondSearchInteractor()
    let presenter = SecondSearchPresenter()
    let router = SecondSearchRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    doSomething()
    let min = self.searchFunds?.min1stInv ?? 0
    let minString = String(min)
    let minCurrency = minString.currency
    self.lbmin1stInv.text = "\(minCurrency) ลงทุนครั้งแรก"
    let minInv = self.searchFunds?.minInv ?? 0
    let minInvString = String(minInv)
    let minInvCurrency = minInvString.currency
    self.lbminInv.text = minInvCurrency
    self.navtitle?.title = self.searchFunds?.assetCompany
    self.navbar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    self.navbar.barTintColor = UIColor.systemBlue;
    self.setviewBtn.clipsToBounds = true
    self.setviewBtn.layer.cornerRadius = 15
    self.setviewBtn.layer.shadowColor = UIColor.systemGray.cgColor
    self.setviewBtn.layer.shadowOpacity = 0.5
    self.setviewBtn.layer.shadowRadius = 10
    self.setviewBtn.layer.masksToBounds = false
    
//    print(self.searchFunds?.assetCompany)
    self.lbFundsEN.text = self.searchFunds?.enName
    self.lbFundsTH.text = self.searchFunds?.thName
    if self.searchFunds?.risk == 1 {
        self.btnrisk.setImage(UIImage(named: "111"), for: .normal)
    } else if self.searchFunds?.risk == 2 {
        self.btnrisk.setImage(UIImage(named: "222"), for: .normal)
    } else if self.searchFunds?.risk == 3 {
        self.btnrisk.setImage(UIImage(named: "333"), for: .normal)
    } else if self.searchFunds?.risk == 4 {
        self.btnrisk.setImage(UIImage(named: "444"), for: .normal)
    } else if self.searchFunds?.risk == 5 {
        self.btnrisk.setImage(UIImage(named: "555"), for: .normal)
    } else if self.searchFunds?.risk == 6 {
        self.btnrisk.setImage(UIImage(named: "666"), for: .normal)
    } else if self.searchFunds?.risk == 7 {
        self.btnrisk.setImage(UIImage(named: "777"), for: .normal)
    } else  {
        self.btnrisk.setImage(UIImage(named: "888"), for: .normal)
    }
  }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
  // MARK: Do something
    
  func doSomething() {
    let request = SecondSearch.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SecondSearch.Something.ViewModel) {
//    print("DAta", viewModel.searchfunds)
    self.searchFunds = viewModel.searchfunds
  }
    func sendclick() {
        var data = [String: String]()
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/yyyy"
        let formattedDate = dataFormatter.string(from: Date())
        
        data["picefunds"] = txtFieldnumber.text ?? ""
        data["enName"] = self.searchFunds?.enName ?? ""
        data["thName"] = self.searchFunds?.thName ?? ""
        data["risk"] = String(self.searchFunds?.risk ?? 0)
        data["date"] = formattedDate
        data["payment"] = "โปรดระบุ"

        NotificationCenter.default.post(name: NSNotification.Name(NotificationCenterSearch.Clicked.rawValue), object: nil, userInfo: data)
        NotificationCenter.default.post(name: NSNotification.Name(NotificationCenterTradeSearch.Clicked.rawValue), object: nil, userInfo: data)
    }
}
extension SecondSearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text: NSString = (textField.text ?? "") as NSString
        let finalString = text.replacingCharacters(in: range, with: string)
            // 'currency' is a String extension that doews all the number styling
        txtFieldnumber.text = finalString.currency

        return false


    }
}
extension String {
    var currency: String {
        // removing all characters from string before formatting
        let stringWithoutSymbol = self.replacingOccurrences(of: "", with: "")
        let stringWithoutComma = stringWithoutSymbol.replacingOccurrences(of: ",", with: "")

        let styler = NumberFormatter()
        styler.minimumFractionDigits = 0
        styler.maximumFractionDigits = 0
        styler.currencySymbol = ""
        styler.numberStyle = .currency

        if let result = NumberFormatter().number(from: stringWithoutComma) {
            return styler.string(from: result)!
            
        }

        return self
    }
}


