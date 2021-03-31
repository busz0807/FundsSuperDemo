//
//  MoreViewController.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 28/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MoreDisplayLogic: class {
    func displayAnalystReport(viewModel: More.FetchAnalystReportDataStore.ViewModel)
}
    class MoreViewController: UIViewController, MoreDisplayLogic {
   
        
        @IBAction func btnline(_ sender: Any) {
            UIApplication.shared.openURL(NSURL(string: "https://line.me/ti/p/%40phillipcapital#~")! as URL)
        }
        
        @IBAction func btnyoutube(_ sender: Any) {
            UIApplication.shared.openURL(NSURL(string: "https://www.youtube.com/user/phillipthai")! as URL)
        }
        @IBAction func btnfacebook(_ sender: Any) {
//            var fbUrl = NSURL(string: "fb://profile/216521891692080")!
            UIApplication.shared.openURL(NSURL(string: "https://www.facebook.com/PhillipCapitalTH")! as URL)
        }
    @IBOutlet weak var tableViewMore: UITableView!
    @IBOutlet weak var tableViewSetting: UITableView!
    @IBOutlet weak var setView: UIView!
    @IBOutlet weak var btnLogin: UIButton!
        var anlystReportData :[AnalystReportModel]?
        var interactor: MoreBusinessLogic?
        var router: (NSObjectProtocol & MoreRoutingLogic & MoreDataPassing)?
        var dataimage = [UIImage(named: "list"),UIImage(named: "simport"),UIImage(named: "funndanalysis"),UIImage(named: "hourglass"),UIImage(named: "compare"),UIImage(named: "fundbuilderplan"),UIImage(named: "rmf"),UIImage(named: "proposalorder"),UIImage(named: "poems")]
        var data = [["More": "Order Status"],["More": "Sim Port"],["More": "Fund Analyst Report"],["More": "IPO & Rollover"],["More": "Compare Funds"],["More": "Fund Builder Plan"],["More": "Tax Saving Fund"],["More": "Prosal Order"],["More": "POEMS Mobile"]]
        var menu = [["Menu": "2 รายการ"],["Menu": ""],["Menu": ""],["Menu": ""],["Menu": ""],["Menu": "4 รายการ"],["Menu": ""],["Menu": ""],["Menu": ""]]
        var dataSetting = [["Setting": "ข้อมูลผู้ใช้"],["Setting": "ตั้งค่า"],["Setting": "แจ้งเตือน"],["Setting": "โหลดข้อมูลกองทุนใหม่"],["Setting": "ติดต่อเรา"]]
        var dataimageSetting = [UIImage(named: "user"),UIImage(named: "setting"),UIImage(named: "notice"),UIImage(named: "reload"),UIImage(named: "contact")]
  
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
    let interactor = MoreInteractor()
    let presenter = MorePresenter()
    let router = MoreRouter()
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
        
        let origImage = UIImage(named: "exit2")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        btnLogin.setImage(tintedImage, for: .normal)
        btnLogin.tintColor = .green
        btnLogin.setTitleColor(.green, for: .normal)
        
    self.setView.clipsToBounds = true
    self.setView.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setView.layer.shadowRadius = 5
    self.setView.layer.masksToBounds = false
    doSomething()

    }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!

        func doSomething() {
            let request = More.FetchAnalystReportDataStore.Request(nameAnalystReport: "AnalystReport")
            interactor?.doSomething(request: request)
        }
        func displayAnalystReport(viewModel: More.FetchAnalystReportDataStore.ViewModel) {
            self.anlystReportData = viewModel.analystReportData
//            print("anlystReportData", self.anlystReportData)
           
            
        }

}
extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewMore{
            return self.dataimage.count
        }else {
            return self.dataimageSetting.count
    }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewMore {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreViewCell") as! MoreViewCell
    // Set up cell.label
        cell.imgView.image = self.dataimage[indexPath.row]
        cell.data = self.data[indexPath.row]
        cell.menu = self.menu[indexPath.row]
        return cell
        } else {
            let cellSetting = tableView.dequeueReusableCell(withIdentifier: "SettingViewCell") as! SettingViewCell
        // Set up cell.label
            cellSetting.imgView.image = self.dataimageSetting[indexPath.row]
            cellSetting.data = self.dataSetting[indexPath.row]
      
//            cell.menu = self.menu[indexPath.row]
            return cellSetting
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewMore {
//            if indexPath.row == 0 {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle:UIAlertController.Style.alert)
//                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//                self.present(alert, animated: true, completion: nil)
//            }else if indexPath.row == 1 {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle: UIAlertController.Style.alert)
//
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//                self.present(alert, animated: true, completion: nil)
//            }
            if indexPath.row == 2 {
                if let analystReportData = self.anlystReportData {
                    router?.goToFundAnalystReport(analystReportData: analystReportData[0])
                }
            } else if indexPath.row == 3 {
              
                router?.goToIPORollover()
            }
//                else if indexPath.row == 4 {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            } else if indexPath.row == 5 {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            } else if indexPath.row == 6 {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }else if indexPath.row == 7 {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }else {
//                let alert = UIAlertController(title: "เร็วๆ นี้", message: "ฟังก์ชั่นนี่กำลังพัฒนาอยู่", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
        } else {
            print(indexPath.row)
        }
    }
}