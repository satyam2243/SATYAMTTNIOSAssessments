//
//  ViewController.swift
//  iOSAssessment-20
//
//  Created by satyam dixit on 08/11/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

    var locationManager: CLLocationManager?

      var currentLocation: MKUserLocation? {
          didSet {
              button.isHidden = (currentLocation == nil)
          }
      }

    lazy var formatter: DateFormatter = {

        let formatter = DateFormatter()
        formatter.timeStyle = DateFormatter.Style.short
        formatter.dateStyle = DateFormatter.Style.short
          return formatter
      }()

      @IBOutlet var button: UIButton!
      @IBOutlet var mapView: MKMapView!

      override func viewDidLoad() {

          super.viewDidLoad()
          
          //Deadlock Example --->>

//          DispatchQueue.main.sync {
//              DispatchQueue.main.sync {
//                  //
//              }
//          }

          if CLLocationManager.locationServicesEnabled() {

              locationManager = CLLocationManager()
              locationManager?.delegate = self
              locationManager?.desiredAccuracy = kCLLocationAccuracyBest

              switch CLLocationManager.authorizationStatus() {

              case .authorizedAlways, .authorizedWhenInUse:
                  locationManager?.startUpdatingLocation()
                  mapView.showsUserLocation = true

              default:
                  locationManager?.requestWhenInUseAuthorization()
              }
          }
      }

    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {

          switch status {

          case .authorizedAlways, .authorizedWhenInUse:
              locationManager?.startUpdatingLocation()
              mapView.showsUserLocation = true

          case .denied, .restricted:
              locationManager?.startUpdatingLocation()
              mapView.showsUserLocation = false
              currentLocation = nil

          default:
              currentLocation = nil
          }
      }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

          currentLocation = userLocation
      }

      @IBAction func addButtonTapped(sender: AnyObject) {

          guard let coordinate = currentLocation?.coordinate else {
              return
          }

          let reportTime = Date()
          let formattedTime = formatter.string(from: reportTime)

          let annotation = MKPointAnnotation()
          annotation.title = "Annotation Created"
          annotation.subtitle = formattedTime
          annotation.coordinate = coordinate

          mapView.addAnnotation(annotation)
      }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

          guard !annotation.isKind(of: MKUserLocation.self) else {

              return nil
          }

          let annotationIdentifier = "AnnotationIdentifier"

          var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)

          if annotationView == nil {
              annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
              annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
              annotationView!.canShowCallout = true
          }
          else {
              annotationView!.annotation = annotation
          }

          annotationView!.image = UIImage(named: "smile")

          return annotationView

      }
    
//    let coords = [  CLLocation(latitude: 28.7041, longitude: 77.1025),
//       CLLocation(latitude: 27.1767, longitude:  78.0081),
//       CLLocation(latitude: 27.4757, longitude: 77.6937)
//        ];
//
//
//    func addAnnotations(coords: [CLLocation]){
//            for coord in coords{
//                let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
//                                                          longitude: coord.coordinate.longitude);
//                let anno = MKPointAnnotation();
//                anno.coordinate = CLLCoordType;
//                mapView.addAnnotation(anno);
//            }
//
//        }
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation{
//            return nil;
//        }else{
//            let pinIdent = "Pin";
//            var pinView: MKPinAnnotationView;
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
//                dequeuedView.annotation = annotation;
//                pinView = dequeuedView;
//            }else{
//                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
//
//            }
//            return pinView;
//        }
//    }

  }

