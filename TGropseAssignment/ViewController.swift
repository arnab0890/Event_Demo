//
//  ViewController.swift
//  TGropseAssignment
//
//  Created by Arnab  maity on 03/07/20.
//  Copyright © 2020 Arnab  maity. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    
    
    //MARK:- OUTLETS
    
  
    @IBOutlet weak var eventMainImage: UIImageView! // We Can Use Collection View for more than one image
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var eventDetailTableView: UITableView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewSponserHeight: NSLayoutConstraint!
    @IBOutlet weak var viewPerformersHeight: NSLayoutConstraint!
    @IBOutlet weak var viewPlansHeight: NSLayoutConstraint!
//    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var testLabel: UILabel!
    
    
   
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var viewOrganiserCollectionView: UICollectionView!
    
    
    //MARK:- VARIABLES
    
    var eventData : DataClass?
    var eventImageArray = [EvImage]()
    var eventOrganiserArray = [EventOrganizer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupApi()
        let font = UIFont.systemFont(ofSize: 12)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                                for: .normal)
        segmentControl.addUnderlineForSelectedSegment()
        
       
        viewHeight.constant = 180
        viewSponserHeight.constant = 180
        viewPerformersHeight.constant = 180
        viewPlansHeight.constant = 180
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // if viewHeight.constant == 50 && viewSponserHeight.constant == 50 && viewPerformersHeight.constant == 50 && viewPlansHeight.constant == 50 {
           // tableViewHeight.constant = 851
        //}
    }
    
    //MARK:- Action
    
    @IBAction func segmentController(_ sender: UISegmentedControl) {
        sender.changeUnderlinePosition()
    }
    
    
    
    @IBAction func pluseBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            viewHeight.constant = 50
        } else {
            viewHeight.constant = 180
        }
    }
    @IBAction func pluseSponserBtnTapped(_ sender: UIButton) {
           sender.isSelected = !sender.isSelected
           if sender.isSelected {
               viewSponserHeight.constant = 50
           } else {
               viewSponserHeight.constant = 180
           }
       }
    @IBAction func pluseperformersBtnTapped(_ sender: UIButton) {
           sender.isSelected = !sender.isSelected
           if sender.isSelected {
               viewPerformersHeight.constant = 50
           } else {
               viewPerformersHeight.constant = 180
           }
       }
    @IBAction func pluseplansBtnTapped(_ sender: UIButton) {
             sender.isSelected = !sender.isSelected
             if sender.isSelected {
                 viewPlansHeight.constant = 50
             } else {
                 viewPlansHeight.constant = 180
             }
         }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else if section == 1{
            return 1
        }
        else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventDetailViewCell", for: indexPath) as! EventDetailViewCell
  
            cell.eventDetailLbl.text = Helper.changeDateFormat(fromDate: eventData?.evStartDate ?? "" ) + " " + "-" + " " + Helper.changeDateFormat(fromDate: eventData?.evEndDate ?? "")
            cell.eventTimeLbl.text = "\(eventData?.evStartTime ?? "")" + " " + "-" + " " + "\(eventData?.evEndTime ?? "")"
            cell.eventLanguageLbl.text = "Abaric & Urdu" // The Language key value is : 0
            cell.eventGenderLbl.text = "Man & Woman" // The Gender key value is : 0
            cell.eventAgeLbl.text = "\(eventData?.evAgeID ?? "") years"
            return cell
        }
        else if indexPath.section == 1{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "EvenetLocationViewCell", for: indexPath) as! EvenetLocationViewCell
            cell1.eventHeadingLbl.text = "Event Location"
            cell1.eventLocationLbl.text = "\(eventData?.evCountry ?? "")"
            cell1.eventMarkerLbl.text = "\(eventData?.evRegion ?? "")"
            cell1.eventPinLbl.text = "\(eventData?.evCity ?? "")"
            
            return cell1
        }
          else if indexPath.section == 2{
                    let cell2 = tableView.dequeueReusableCell(withIdentifier: "BriefDiscussionCell", for: indexPath) as! BriefDiscussionCell
                    cell2.briefDiscussionLbl.text = "Brief Discussion"
                    cell2.briefLbl.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                        return cell2
                }
                return UITableViewCell()
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        else if indexPath.section == 1{
            return 200
        }else if indexPath.section == 2{
            return UITableView.automaticDimension
        }else{
            return UITableView.automaticDimension
        }
    }
}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventOrganiserArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrgainserViewCell", for: indexPath) as! OrgainserViewCell
        cell.organiserNameLbl.text = eventOrganiserArray[indexPath.item].oName ?? ""
        let imgURi = self.eventOrganiserArray[indexPath.row].oLogo
        cell.organiserImg.sd_setImage(with: URL(string: imgURi ?? ""), completed: nil)
        return cell
    }
    
}


extension ViewController{

    func setupApi(){
        let url = "http://saudicalendar.com/api/user/getEventDetail"
        let paramStr = "user_id=0&event_id=12&longitude=78.1245&latitude=28.1245"
        
        Server.postRequestWithURL(url, paramString: paramStr) { (response) in
             let responseDict = response as Dictionary<String, Any>
          
        
                
            
            DispatchQueue.main.async {
                _ = responseDict["data"] as? [String:Any]
                let prodouctContentModel = try? EventDetailsModel ((response.json))
                self.eventData = prodouctContentModel?.data
                
                for evntOrganiser in prodouctContentModel?.data?.eventOrganizer ?? []{
                    self.eventOrganiserArray.append(evntOrganiser)
                    print(evntOrganiser)
                }
                
                for eventImages in prodouctContentModel?.data?.evImage ?? []{
                    self.eventImageArray.append(eventImages)
                    print(eventImages)
                }
                
                print(self.eventData!)
                self.eventDetailTableView.reloadData()
                self.viewOrganiserCollectionView.reloadData()
              
                self.eventImage.sd_setImage(with: URL(string: "http://saudicalendar.com/api/uploads/event/344112611i9ie40e10e91560395686.jpeg"), completed: nil)
            }
           
            
        }
    }
    
}
