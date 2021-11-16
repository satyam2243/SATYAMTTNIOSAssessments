//
//  ViewController.swift
//  assignment-20
//
//  Created by Satyam Dixit on 31/10/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    let locationArray = [
        ["title": "Neelkanth Mandir, Etawah", "latitude": 26.7653, "longitude": 79.0213],
        ["title": "Bus Stand, Etawah", "latitude": 26.7804, "longitude": 79.0287],
        ["title": "Railway Station, Etawah", "latitude": 26.7868, "longitude": 79.0214],
        ["title": "pakka bagh, Etawah", "latitude": 26.7657, "longitude": 79.0415],
        ["title": "Friends Colony, Etawah", "latitude": 26.7893, "longitude": 79.0232]
    ]

    let etawahCoordinate = CLLocationCoordinate2D(latitude: 26.7829, longitude: 79.0277)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMap.delegate = self
        myMap.showsTraffic = true
        myMap.showsUserLocation = true
        myMap.isZoomEnabled = true
        myMap.showsScale = true
        myMap.setRegion(MKCoordinateRegion(center: etawahCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: false)
        
        createAnnotations(locations: locationArray)
        drawLineBetweenTwoAnnotations()
        createOverlays()
    }
    
    func createAnnotations(locations: [[String : Any]]) {
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            myMap.addAnnotation(annotation)
        }
        
    }
    
    func drawLineBetweenTwoAnnotations() {
        let sourceC = CLLocationCoordinate2D(latitude: 26.7804, longitude: 79.0287)
        let destC = CLLocationCoordinate2D(latitude: 26.7868, longitude: 79.0214)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceC)
        let destPlacemark = MKPlacemark(coordinate: destC)
        
        let requestForDirection = MKDirections.Request()
        requestForDirection.source =  MKMapItem(placemark: sourcePlacemark)
        requestForDirection.destination = MKMapItem(placemark: destPlacemark)
        requestForDirection.transportType = .automobile
        
        let directions = MKDirections(request: requestForDirection)
        directions.calculate { ( response, error) in
            guard let directionResponse = response else {
                if let error = error {
                    print("We have an issue in response. (\(error.localizedDescription))")
                }
                 return
            }
//            print(directionResponse.routes)
            let route = directionResponse.routes[0]
            self.myMap.addOverlay(route.polyline, level: .aboveRoads)
            
            
//            let rect = route.polyline.boundingMapRect
//            self.myMap.setRegion(MKCoordinateRegion(rect), animated: true)
            
        }
    }
    
    func createOverlays() {
        let sourceC = CLLocationCoordinate2D(latitude: 30.3285, longitude: 78.0260)
        let destC = CLLocationCoordinate2D(latitude: 30.3325, longitude: 78.0536)
        let overlay1 = MKCircle(center: sourceC, radius: 10)
        let overlay2 = MKCircle(center: destC, radius: 10)
        myMap.addOverlay(overlay1)
        myMap.addOverlay(overlay2)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay.isKind(of: MKCircle.self) {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = .systemTeal
            circleRenderer.strokeColor = .systemTeal
            circleRenderer.lineWidth = 7
            return circleRenderer
        }
//        return MKCircleRenderer(overlay: overlay)
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0

        return renderer
    }

}

extension MapViewController {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn

        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        let myVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as? DetailViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
}
