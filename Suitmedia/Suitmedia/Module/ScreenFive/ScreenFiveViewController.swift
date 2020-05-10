//
//  ScreenFiveViewController.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ScreenFiveViewController: BaseViewController, CLLocationManagerDelegate {
    
    var eventData = Event.data
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    var locationManager = CLLocationManager()
    var indexSet : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        for location in eventData {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude:location.Lat, longitude: location.Long)
            mapView.addAnnotation(annotation)
        }
    }

    func setupUI(){
           setupNavigationBar()
           showleftMenu(menu1: "ic_search_white.png", menu2: "ic_map_view.png")
           self.collectionView.register(ScrennFiveCollectionViewCell.nib(), forCellWithReuseIdentifier: "cell")
           self.collectionView.dataSource = self
           self.collectionView.delegate = self
           collectionView.backgroundColor = UIColor.clear
       }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = IndexPath(item: indexSet ?? 0, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    
    func setupNavigationBar(){
        self.title = "EVENTS";
        self.setDefaultToolbar(dismissTabBar: #selector(dismissTabBar))
        
    }
    
    @objc private func dismissTabBar () {
        self.navigationController?.popViewController(animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {

        let location = locations.last! as CLLocation

        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        self.mapView.setRegion(region, animated: true)
    }
   

    func setMap(title: String, Lat: Double, Long : Double )->MKAnnotation{
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = CLLocationCoordinate2D(latitude: Lat, longitude: Long)
        return annotation
        
    }
}

extension ScreenFiveViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "ic_marker_unselected.png")
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.image = UIImage(named: "ic_marker_selected.png")
        guard view.annotation != nil else {
            return
        }
        for (index, item) in eventData.enumerated() {
            if let title = view.annotation?.title {
                if item.name == title! {
                    self.indexSet = index-1
                    break
                }
            }
        }
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = UIImage(named: "ic_marker_unselected.png")
    }
    
}

extension ScreenFiveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ScrennFiveCollectionViewCell
        let data = eventData[indexPath.row]
        cell.titleLbl.text =  data.name
        cell.descLbl.text = data.subTitle
        cell.dateLbl.text = data.Date
        cell.imageView.image = UIImage(named: "\(data.imageEvent)")!
        return cell
    }
    
    
}




extension ScreenFiveViewController :  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
