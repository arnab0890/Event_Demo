//
//  EvenetLocationViewCell.swift
//  TGropseAssignment
//
//  Created by Arnab  maity on 04/07/20.
//  Copyright © 2020 Arnab  maity. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import CoreLocation

class EvenetLocationViewCell: UITableViewCell{

    @IBOutlet weak var eventHeadingLbl: UILabel!
    
    @IBOutlet weak var eventLocationImg: UIImageView!
    
    @IBOutlet weak var eventLocationLbl: UILabel!
    
    @IBOutlet weak var eventMarkerLbl: UILabel!
    
    @IBOutlet weak var locationView: GMSMapView!
    
    
    @IBOutlet weak var eventPinLbl: UILabel!
    
    
    
    //MARK:- VARIABLES
    
    var fetcher: GMSAutocompleteFetcher?
    let placeClient = GMSPlacesClient()
    var locationManager = CLLocationManager()
    var currentPlacemark: CLPlacemark?
    
    var lat = 0.0
    var long = 0.0
    var searchText = ""
    var city:String = ""
    var state:String = ""
    var country:String = ""
    var location: String = ""
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationView.delegate = self
        mapdelegate()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func mapdelegate() {
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.startUpdatingLocation()
        }
        
        //MARK:- Your map initiation code
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude:  long, zoom: 15)
        self.locationView.camera = camera
        self.locationView.delegate = self
        self.locationView?.isMyLocationEnabled = true
        self.locationView.settings.myLocationButton = false
        self.locationView.settings.compassButton = true
        self.locationView.settings.zoomGestures = true
        self.locationView.settings.scrollGestures = false
        self.locationView.settings.rotateGestures = false
        
        fetcher = GMSAutocompleteFetcher()
        //fetcher?.delegate = self
        
        //searchTextField.isEnabled = true
    }

}

extension EvenetLocationViewCell:CLLocationManagerDelegate, GMSMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location:CLLocation = locations.last! as CLLocation
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15.0)
        self.locationView?.camera = camera
        
        lat = location.coordinate.latitude
        long = location.coordinate.longitude
        showMarker(position: camera.target)
        
        //self.getLocationFromPostalCode(lat: lat, long: long)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    func showMarker(position: CLLocationCoordinate2D){
        self.locationView.clear()
        let marker = GMSMarker()
        marker.isDraggable = true
        marker.position = position
        marker.title = ""
        marker.snippet = ""
        marker.map = locationView
        marker.icon = UIImage(named: "marker")
    }
    
}


