//
//  CompleteReservationViewController.swift
//  RestartBustacall
//
//  Created by JongMinKim on 2/16/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

import UIKit

class CompleteReservationViewController: UIViewController {

    var chackMapView = checkMapViewController()
    let TMAP_APPKEY = "9175cfb8-62e9-3ed9-b58b-e61c7016bc53"
    var startEnd = StartEndPoint()
    
    @IBOutlet weak var mapContainerView: UIView!
    var _mapView = TMapView()
    
    var _lineIDs = NSMutableArray()
    var _circleIDs = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        createMapView()
        rp()
        // Do any additional setup after loading the view.
    }
    
    
    func createMapView() {
        _mapView = TMapView()
        _mapView.frame = mapContainerView.bounds
        _mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        _mapView.setSKPMapApiKey(TMAP_APPKEY)
        mapContainerView.addSubview(_mapView)
    }
    
    func rp(){
    let path = TMapPathData()
    startEnd.startPointLon = 126.9772433
    startEnd.startPointLat = 37.5670652
    startEnd.endPointLon = 129.0794268
    startEnd.endPointLat = 35.2333700
        
    let startPoint = TMapPoint(lon: self.startEnd.startPointLon!, lat: self.startEnd.startPointLat!)
    let endPoint = TMapPoint(lon: self.startEnd.endPointLon!, lat: self.startEnd.endPointLat!)
    
    let polyLine: TMapPolyLine? = path.find(from: startPoint, to: endPoint) // 패쓰 설정
    
    
    if polyLine == nil {
        return;
    }
    
    if polyLine?.getPoint().count == 0 {
        return;
    }
        
        // 출발, 도착 아이콘 설정
        //let start: TMapPoint? = polyLine?.getPoint()?[0] as! TMapPoint?
        //let end: TMapPoint? = polyLine?.getPoint()?.last as! TMapPoint?
        let startMarkerItem = TMapMarkerItem()
        startMarkerItem.setTMapPoint(startPoint)
        startMarkerItem.setIcon(UIImage(named: "tmap_start.png"))
        startMarkerItem.setVisible(true)
        
        
        let endMarkerItem = TMapMarkerItem()
        endMarkerItem.setTMapPoint(endPoint)
        endMarkerItem.setIcon(UIImage(named: "tmap_arrival.png"))
        endMarkerItem.setVisible(true)
        self._mapView.setTMapPathIconStart(startMarkerItem, end: endMarkerItem)
        //*/
        // 라인
        
        let centerCoord = CLLocationCoordinate2D(latitude: (startEnd.startPointLat! + startEnd.endPointLat!) / 2.0, longitude: (startEnd.startPointLon! + startEnd.endPointLon!) / 2.0)
        //self._mapView.zoom(lonSpan: (minLat - maxLat), minLon as? maxLon))
        if startEnd.startPointLat! - startEnd.endPointLat! >= 0{
            if startEnd.startPointLon! - startEnd.endPointLon! >= 0{
                self._mapView.zoom(toLatSpan: startEnd.startPointLat! - startEnd.endPointLat!,
                                       lonSpan: startEnd.startPointLon! - startEnd.endPointLon!)
            }else{
                self._mapView.zoom(toLatSpan: startEnd.startPointLat! - startEnd.endPointLat!,
                                   lonSpan: startEnd.endPointLon! - startEnd.startPointLon!)
            }
            
        }else {
            if startEnd.startPointLon! - startEnd.endPointLon! >= 0{
                self._mapView.zoom(toLatSpan: startEnd.endPointLat! - startEnd.startPointLat!,
                                   lonSpan: startEnd.startPointLon! - startEnd.endPointLon!)
            }else{
                self._mapView.zoom(toLatSpan: startEnd.endPointLat! - startEnd.startPointLat!,
                                   lonSpan: startEnd.endPointLon! - startEnd.startPointLon!)
            }
        }
        
        self._mapView.setCenter(centerCoord)
        if polyLine != nil {
            self._mapView.addTMapPath(polyLine)
        }
    
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self._mapView.frame = self.mapContainerView.bounds
        self._mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
