//  Converted with Swiftify v1.0.6242 - https://objectivec2swift.com/
//
//  ViewController.swift
//  TMap-OP_libSample
//
//  Created by heungguk on 2015. 10. 19..
//  Copyright © 2015년 SKP. All rights reserved.
//
// 앱등록 및 키발급 -> https://developers.skplanetx.com/develop/


class CheckMapViewController:UIViewController {
    
    @IBOutlet var mapContainerView: UIView!
    @IBOutlet var menuView: UIView!
    var mapView: TMapView!
    var lineIDs = [String]()
    var circleIDs = [Any]()
    let TMAP_APPKEY = "9175cfb8-62e9-3ed9-b58b-e61c7016bc53"
    var poiResult:Poi?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createMapView()
        //self.createMenuView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mapView.frame = self.mapContainerView.bounds
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    deinit {
    }
    
    func createMapView() {
        self.mapView = TMapView(frame: self.mapContainerView.bounds)
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.mapView.delegate = self as! TMapViewDelegate
        self.mapView.gpsManagersDelegate = self as! TMapGpsManagerDelegate
        self.mapView.setSKPMapApiKey(TMAP_APPKEY)
        // 발급 받은 apiKey 설정
        self.mapContainerView.addSubview(self.mapView)
    }
    // MARK: - Menu View
    
//    func createMenuView() {
//        x = 10, y = 10
//        self.menuView.backgroundColor = UIColor.white
//        self.menuView.layer.borderColor = UIColor.black.cgColor
//        self.menuView.layer.borderWidth = 3
//        self.addStaticButton(withTitle: "+", target: self.menuView, action: #selector(self.zoomIn))
//        self.addStaticButton(withTitle: "-", target: self.menuView, action: #selector(self.zoomOut))
//        self.addStaticButton(withTitle: "10", target: self.menuView, action: #selector(self.zoomLevel10))
//        var scrollView = UIScrollView(frame: CGRect(x: CGFloat(0), y: CGFloat(35), width: CGFloat(self.view.frame.size.width), height: CGFloat(self.menuView.frame.size.height - 35)))
//        self.mapView.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
//        scrollView.layer.borderColor = UIColor.black.cgColor
//        scrollView.layer.borderWidth = 2
//        scrollView.contentSize = CGSize(width: CGFloat(self.view.frame.size.width), height: CGFloat(500))
//        self.menuView.addSubview(scrollView)
//        self.addButton(withTitle: "TMapAppInfo", target: scrollView, action: #selector(self.TMapAppInfo))
//        // TMap App Launch APIs
//        self.addButton(withTitle: "경로", target: scrollView, action: #selector(self.route))
//        self.addButton(withTitle: "경로 상세", target: scrollView, action: #selector(self.route2))
//        self.addButton(withTitle: "지도보기", target: scrollView, action: #selector(self.mapview))
//        self.addButton(withTitle: "통합검색", target: scrollView, action: #selector(self.search))
//        self.addButton(withTitle: "집으로", target: scrollView, action: #selector(self.home))
//        self.addButton(withTitle: "회사로", target: scrollView, action: #selector(self.company))
//        self.addButton(withTitle: "풍선뷰 마커", target: scrollView, action: #selector(self.addCallOutMarker))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "Logo Pos", target: scrollView, action: #selector(self.logoPos))
//        self.addButton(withTitle: "ZoomToSpan", target: scrollView, action: #selector(self.ZoomToSpan))
//        self.addButton(withTitle: "ZoomToTMapPoint", target: scrollView, action: #selector(self.ZoomToTMapPoint))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "구름위성", target: scrollView, action: #selector(self.showWeatherOverlay))
//        self.addButton(withTitle: "구름 변경", target: scrollView, action: #selector(self.changeImage))
//        self.addButton(withTitle: "구름 삭제", target: scrollView, action: #selector(self.removeWeatherOverlay))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "capture", target: scrollView, action: #selector(self.capture))
//        self.addButton(withTitle: "currentZoom", target: scrollView, action: #selector(self.getZoomLevel))
//        self.addButton(withTitle: "clear", target: scrollView, action: #selector(self.clearObjects))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "SD", target: scrollView, action: #selector(self.tileSourceSD))
//        self.addButton(withTitle: "SD+EX", target: scrollView, action: #selector(self.tileSourceEX))
//        self.addButton(withTitle: "HD", target: scrollView, action: #selector(self.tileSourceHD))
//        // trafficMode
//        self.addButton(withTitle: "trafficInfo", target: scrollView, action: #selector(self.trafficInfo))
//        self.addButton(withTitle: "bicycleMode", target: scrollView, action: #selector(self.bicycleMode))
//        self.addButton(withTitle: "bicycleFacilityMode", target: scrollView, action: #selector(self.bicycleFacilityMode))
//        self.addButton(withTitle: "removeMap", target: scrollView, action: #selector(self.removeMapView))
//        self.addButton(withTitle: "reloadMap", target: scrollView, action: #selector(self.reloadMapView))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "category", target: scrollView, action: #selector(self.category))
//        // RP
//        self.addButton(withTitle: "rp", target: scrollView, action: #selector(self.rp))
//        self.addButton(withTitle: "rpPedestrian", target: scrollView, action: #selector(self.rpPedestrian))
//        self.addButton(withTitle: "rpMulti", target: scrollView, action: #selector(self.rpMulti))
//        self.addButton(withTitle: "rpBike", target: scrollView, action: #selector(self.rpBike))
//        self.addButton(withTitle: "pathDataAll", target: scrollView, action: #selector(self.pathDataAll))
//        self.addButton(withTitle: "findPathDataWithType", target: scrollView, action: #selector(self.findPathDataWithType))
//        self.addButton(withTitle: "findMultiPath", target: scrollView, action: #selector(self.findMultiPath))
//        //
//        self.addButton(withTitle: "fullPath", target: scrollView, action: #selector(self.fullPath))
//        self.addButton(withTitle: "timeMachine", target: scrollView, action: #selector(self.timeMachine))
//        self.addButton(withTitle: "timeMachine2", target: scrollView, action: #selector(self.timeMachine2))
//        self.addButton(withTitle: "poi", target: scrollView, action: #selector(self.poiTest))
//        // poiCode
//        self.addButton(withTitle: "poiCode(주유)", target: scrollView, action: #selector(self.poiCode))
//        // reversegeocoding
//        self.addButton(withTitle: "revGeo", target: scrollView, action: #selector(self.revGeoTest))
//        //
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "circle", target: scrollView, action: #selector(self.addCircle))
//        self.addButton(withTitle: "rmvCircle", target: scrollView, action: #selector(self.rmvCircle))
//        self.addButton(withTitle: "PolyLine", target: scrollView, action: #selector(self.addPolyLine))
//        self.addButton(withTitle: "removeLine", target: scrollView, action: #selector(self.removePolyLine))
//        self.addButton(withTitle: "LineDash", target: scrollView, action: #selector(self.addPolyLineDash))
//        self.addButton(withTitle: "LineRedraw", target: scrollView, action: #selector(self.addPolyLineRedraw))
//        self.addButton(withTitle: "Polygon", target: scrollView, action: #selector(self.addPolygon))
//        self.addButton(withTitle: "marker", target: scrollView, action: #selector(self.addMarker))
//        self.addButton(withTitle: "marker2", target: scrollView, action: #selector(self.addMarker2))
//        self.addButton(withTitle: "changeIcon", target: scrollView, action: #selector(self.changeIcon))
//        self.addButton(withTitle: "showCallOutView", target: scrollView, action: #selector(self.showCallOutView))
//        self.addButton(withTitle: "backMacker", target: scrollView, action: #selector(self.backMacker))
//        self.addButton(withTitle: "frontMarker", target: scrollView, action: #selector(self.frontMarker))
//        self.addButton(withTitle: "remove marker", target: scrollView, action: #selector(self.removeMarker))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        // tracking
//        self.addButton(withTitle: "tracking", target: scrollView, action: #selector(self.trackingTest))
//        // compassMode
//        self.addButton(withTitle: "compassMode", target: scrollView, action: #selector(self.compassMode))
//        // sightMode
//        self.addButton(withTitle: "sightMode", target: scrollView, action: #selector(self.sightMode))
//        // default or navi position
//        self.addButton(withTitle: "position", target: scrollView, action: #selector(self.mapPositionTypeTest))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "setIcon", target: scrollView, action: #selector(self.setIconTest))
//        self.addButton(withTitle: "iconVisible", target: scrollView, action: #selector(self.iconVisibleTest))
//        self.addButton(withTitle: "isvalid", target: scrollView, action: #selector(self.isValidCoord))
//        self.addButton(withTitle: "poiCode", target: scrollView, action: #selector(self.poiCode))
//        self.separateButtonArea("--------------------------------------------------------------------------------")
//        self.addButton(withTitle: "GPS_ON", target: scrollView, action: #selector(self.GPS_ON))
//        self.addButton(withTitle: "GPS_OFF", target: scrollView, action: #selector(self.GPS_OFF))
//    }
    static var x: CGFloat = 10
    static var y: CGFloat = 10
    let leftMarzine: CGFloat = 10
    let buttonWidth: CGFloat = 95
    let buttonHeight: CGFloat = 30
    let gap: CGFloat = 3
    static var FLAG: Bool = false
    
    func separateButtonArea(_ temp: String) {
        if CheckMapViewController.x != leftMarzine {
            CheckMapViewController.y = CheckMapViewController.y + buttonHeight + gap * 2
            CheckMapViewController.x = leftMarzine
        }
        else {
            CheckMapViewController.y = CheckMapViewController.y + gap
        }
        CheckMapViewController.FLAG = !CheckMapViewController.FLAG
    }
    
    func buttonForTest() -> UIButton {
        var button: UIButton? = nil
        if CheckMapViewController.FLAG {
            button = UIButton(type: .roundedRect)
            button?.setTitleColor(UIColor.black, for: .normal)
            //[button setBackgroundColor:[UIColor redColor]];
        }
        else {
            button = UIButton(type: .roundedRect)
            //[button setBackgroundColor:[UIColor blueColor]];
        }
        return button!
    }
    
    func addButton(withTitle title: String, target view: UIView, action selector: Selector) {
        let button: UIButton? = self.buttonForTest()
        button?.frame = CGRect(x: CheckMapViewController.x, y: CheckMapViewController.y, width: buttonWidth, height: buttonHeight)
        button?.setTitle(title, for: .normal)
        button?.addTarget(self, action: selector, for: .touchUpInside)
        view.addSubview(button!)
        // calc next position
        CheckMapViewController.x = CheckMapViewController.x + buttonWidth + gap
        if CheckMapViewController.x + buttonWidth + gap > view.frame.size.width {
            CheckMapViewController.x = leftMarzine
            CheckMapViewController.y = CheckMapViewController.y + buttonHeight + gap
        }
        let scrollView: UIScrollView? = (view as? UIScrollView)
        scrollView?.contentSize = CGSize(width: CGFloat((scrollView?.frame.size.width)!), height: CGFloat(CheckMapViewController.y + buttonHeight + gap))
    }
    
    func addStaticButton(withTitle title: String, target view: UIView, action selector: Selector) {
        var x: CGFloat = 10
        if x > 120 {
            x = 10
        }
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: x, y: CGFloat(5), width: CGFloat(30), height: CGFloat(30))
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        view.addSubview(button)
        x = x + 40
    }
    // MARK: - TMapViewDelegate (TMapApiKey)
    // setSKPMapApiKey: 성공시 발생하는 callback
    
    func skpMapApikeySucceed() {
        print("SKPMapApikeySucceed")
    }
    // setSKPMapApiKey: 실패시 발생하는 callback
    
    func skpMapApikeyFailed(_ error: Error?) {
        print("SKPMapApikeyFailed : \(error?.localizedDescription)")
    }
    // MARK: - TMapViewDelegate
    
    func onClick(_ TMP: TMapPoint) {
        print("onClick: \(TMP)")
    }
    
    func onLongClick(_ TMP: TMapPoint) {
        print("onLongClick: \(TMP)")
    }
    
    func onCustomObjectClick(_ obj: TMapObject) {
        if type(of: obj) === TMapMarkerItem.self {
            print("TMapMarkerItem clicked:\(obj)")
        }
    }
    
    func onCustomObjectLongClick(_ obj: TMapObject) {
        if type(of: obj) === TMapMarkerItem.self {
            print("TMapMarkerItem clicked:\(obj)")
        }
    }
    
    func onCustomObjectClick(_ obj: TMapObject, screenPoint point: CGPoint) {
        if type(of: obj) === TMapMarkerItem.self {
            print("onCustomObjectClick :\(obj) screenPoint:{\(point.x), \(point.y)}")
        }
    }
    
    func onCustomObjectLongClick(_ obj: TMapObject, screenPoint point: CGPoint) {
        if type(of: obj) === TMapMarkerItem.self {
            print("onCustomObjectLongClick :\(obj) screenPoint:{\(point.x), \(point.y)}")
        }
    }
    
    func onDidScroll(withZoomLevel zoomLevel: Int, center mapPoint: TMapPoint) {
        //NSLog(@"zoomLevel: %d point: %@", zoomLevel, mapPoint);
    }
    
    func onDidEndScroll(withZoomLevel zoomLevel: Int, center mapPoint: TMapPoint) {
        print("zoomLevel: \(Int(zoomLevel)) point: \(mapPoint)")
        //    NSLog(@"trackingMode %d", [_mapView getIsTracking]);
    }
    
    func onCalloutRightbuttonClick(_ markerItem: TMapMarkerItem) {
        print("markerItem: \(markerItem.getID())")
    }
    
    func onClusteringMarkerClick(_ markerItems: [Any], screenPoint point: CGPoint) {
        print("markerItems : \(markerItems) {\(point.x), \(point.y)}")
    }
    
    func mapView(_ mapView: TMapView, viewForCalloutView markerItem: TMapMarkerItem2) -> UIView? {
        let view = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(100), height: CGFloat(100)))
        view.backgroundColor = UIColor.red
        return view
    }
    // MARK: - TMapGpsManagerDelegate
    
    func locationChanged(_ newTmp: TMapPoint) {
    }
    
    func headingChanged(_ heading: Double) {
    }
    // MARK: -
    let ARC4RANDOM_MAX = 0x100000000
    
    func randomCoordinate() -> CLLocationCoordinate2D {
        var latitude = (Double(arc4random()) / (Double(ARC4RANDOM_MAX))) * (37.575113 - 37.483086) + 37.483086
        var longitude = (Double(arc4random()) / (Double(ARC4RANDOM_MAX))) * (127.027359 - 126.878357) + 126.878357
        latitude = min(37.575113, latitude)
        latitude = max(37.483086, latitude)
        longitude = min(127.027359, longitude)
        longitude = max(126.878357, longitude)
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    func randomTMapPoint() -> TMapPoint {
        return TMapPoint(coordinate: self.randomCoordinate())
    }
    // MARK: - Menu Actions
    
//    func pathDataAll() {
//        var pathData = TMapPathData()
//        // 37.507105, 126.903076
//        // 37.403609, 126.916286
//        // https://developers.skplanetx.com/apidoc/kor/t-map/course-guide/geojson/
//        var dic: [AnyHashable: Any] = pathData.findAll(withStartPoint: TMapPoint(coordinate: CLLocationCoordinate2DMake(37.403609, 126.916286)), endPoint: TMapPoint(coordinate: CLLocationCoordinate2DMake(37.507105, 126.903076)))
//        print("\(dic)")
//        var documentdir: String? = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
//        var filePath: String = documentdir! + "/rp.plist"
//        dic.write(toFile: filePath, atomically: true)
//        dic.
//        
//    }
    
    func zoomIn() {
        self.mapView.zoomIn()
    }
    
    func zoomOut() {
        self.mapView.zoomOut()
    }
    
    func zoomLevel10() {
        self.mapView.zoomLevel = 10
    }
    
    func getZoomLevel() {
        
        let alert = UIAlertController(title: nil, message: "zoomLevel: \(Int(self.mapView.getZoomLevel()))"
            , preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    func addCircle() {
       
        let circle = TMapCircle()
        let point1 = self.randomTMapPoint()
        circle.setCenter(point1)
        circle.setCircleRadius(200)
        circle.setCircleLineColor(UIColor.red.cgColor)
        circle.setCircleLineWidth(5)
        let areaColor: CGColor = UIColor.blue.cgColor.copy(alpha: 0.2)!
        circle.setCircleAreaColor(areaColor)
        //CGColorRelease(areaColor)
        // 반지름 표시
        var radiusHidden: Bool = true
        circle.setRadiusVisible(radiusHidden)
        radiusHidden = !radiusHidden
        var objIdx: Int = 0
        let circleID: String = "circle\(objIdx += 1)"
        self.circleIDs.append(circleID)
        self.mapView.addCustomObject(circle, id: circleID)
    }
    
    func rmvCircle() {
        let circleID: String? = self.circleIDs.last as! String?
        if circleID != nil {
            self.mapView.removeTMapCircleID(circleID)
        }
        self.circleIDs.removeLast()
    }
    
    func addPolyLine() {
        
        var index: Int = 0
        let ID: String = "line\(index)"
        self.lineIDs.append(ID)
        let polyLine = TMapPolyLine()
        polyLine.setLineColor(UIColor.blue.cgColor)
        polyLine.setLineWidth(10.0)
        for _ in 0..<5 {
            let point1 = self.randomTMapPoint()
            polyLine.addPoint(point1)
        }
        self.mapView.addCustomObject(polyLine, id: ID)
        index += 1
    }
    
    func removePolyLine() {
        let objectID: String? = self.lineIDs.last
        if objectID != nil {
            self.mapView.removeTMapPolyLineID(objectID)
            self.lineIDs.removeLast()
        }
    }
    //*
    
    func addPolyLineDash() {
        
        // 안양역 37.401933, 126.922651
        let coordinate1: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.401933, 126.922651)
        // 삼성역 37.508824, 127.063011
        let coordinate2: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.508824, 127.063011)
        // 신도림역 37.508997, 126.891581
        let coordinate3: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.508997, 126.891581)
        // 월드컵경기장 37.568375, 126.897218
        let coordinate4: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.568375, 126.897218)
        var coordinates: [CLLocationCoordinate2D] = [coordinate1, coordinate2, coordinate3, coordinate4]
        let polyLine = TMapPolyLine()
        polyLine.setLineColor(UIColor.blue.cgColor)
        polyLine.setLineWidth(4.0)
        // Dash 설정
        polyLine.setLineDashPattern([Int(10), Int(8)])
        for i in 0..<4 {
            let point = TMapPoint(coordinate: coordinates[i])
            polyLine.addPoint(point)
        }
        var index: Int = 0
        let lineID: String = "polyLine\(index += 1)"
        self.mapView.addTMapPolyLineID(lineID, line: polyLine)
        self.lineIDs.append(lineID)
    }
    
    func addPolyLineRedraw() {
        for lineID: String in self.lineIDs{
            let polyLine: TMapPolyLine? = self.mapView.getPolyLine(fromID: lineID)
            polyLine?.setLineWidth(4.0)
            polyLine?.setLineDashPattern([Int(10), Int(8)])
            polyLine?.setLineColor(UIColor.red.cgColor)
        }
    }
    // static int __markerID = 0;
    var __markerIDs: [Any]? = nil
    
    func addMarker() {
        
        if __markerIDs == nil {
            __markerIDs = [Any]() /* capacity: 10 */
        }
        var images: [UIImage] = [            //[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.sk.co.kr/Image/common/logo.gif"]]],
            UIImage(named: "start.png")!]
        var index: Int = 0
        // 중복아이디 테스트
        //NSString *ID = [NSString stringWithFormat:@"marker%d", 1];
        let ID: String = "marker\(index)"
        __markerIDs?.append(ID)
        let image: UIImage? = images[index % images.count]
        let mapPoint = TMapPoint(coordinate: self.randomCoordinate())
        //TMapPoint* mapPoint = [[[TMapPoint alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.566474, 126.985022)] autorelease];
        let marker1 = TMapMarkerItem()
        marker1.setTMapPoint(mapPoint)
        marker1.setIcon(image, anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
        marker1.canShowCallout = true
        marker1.calloutTitle = "CallOut 타이틀"
        marker1.calloutSubtitle = "CallOut 서브타이틀"
        marker1.calloutLeftImage = UIImage(named: "end.png")
        marker1.calloutRightButtonImage = UIImage(named: "accessory_detail.png")
        marker1.setName("name \(ID)")
        marker1.enableClustering = true
        //    [_mapView addTMapMarkerItemID:ID Marker:marker1];
        // 애니매이션
        self.mapView.addTMapMarkerItemID(ID, marker: marker1, animated: true)
        index += 1
    }
    let MARKER_ANI = "aniMarker"
    
    func addMarker2() {
        var aniImages = [Any]() /* capacity: 8 */
        for i in 0..<8 {
            aniImages.append(UIImage(named: String(format: "bluegem_ani_%02d.png", i + 1))!
            )
        }
        let mapPoint = TMapPoint(coordinate: CLLocationCoordinate2DMake(37.566474, 126.985022))
        let marker = TMapMarkerItem2()
        marker.setTMapPoint(mapPoint)
        marker.setAnimationIcons(aniImages, anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(0.5)))
        marker.canShowCallout = true
        //[marker setAutoCalloutVisible:YES];
        self.mapView.addTMapMarkerItemID(MARKER_ANI, markerItem2: marker)
    }
    
    func changeIcon() {
        let marker: TMapMarkerItem2? = self.mapView.getMarketItem2(fromID: MARKER_ANI)
        var aniImages = [Any]() /* capacity: 8 */
        for i in 0..<8 {
            aniImages.append(UIImage(named: String(format: "redgem_ani_%02d.png", i + 1))!)
        }
        marker?.setAnimationIcons(aniImages, anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(0.5)))
        marker?.startAnimation()
    }
    
    func showCallOutView() {
        // 특정 마커의 CallOutView 함수호출로 나오도록
        self.mapView.showCallOutView(withMarkerItemID: "marker3")
    }
    
    func removeMarker() {
        let markerID: String? = __markerIDs?.last as! String?
        if markerID != nil {
            self.mapView.removeTMapMarkerItemID(markerID)
            __markerIDs?.removeLast()
        }
    }
    
    func backMacker() {
        let item: TMapMarkerItem? = self.mapView.getMarketItem(fromID: "marker2")
        if item != nil {
            self.mapView.sendMarker(toBack: item)
        }
    }
    
    func frontMarker() {
        let item: TMapMarkerItem? = self.mapView.getMarketItem(fromID: "marker2")
        if item != nil {
            self.mapView.bringMarker(toFront: item)
        }
    }
    
    func addPolygon() {
        let polygon = TMapPolygon()
        let areaColor: CGColor = UIColor.red.cgColor.copy(alpha: 0.2)!
        polygon.setPolygonAreaColor(areaColor)
        //CGColorRelease(areaColor)
        for _ in 0..<5 {
            let point1 = self.randomTMapPoint()
            polygon.addPoint(point1)
        }
        var index: Int = 0
        self.mapView.addCustomObject(polygon, id: "polygon\(index += 1)")
    }
    
    func clearObjects() {
        self.mapView.clearCustomObjects()
    }
    
    func tileSourceSD() {
        self.mapView.setTMapTileType(NORMALTILE)
        print("\(self.mapView.tmapTileType)")
    }
    
    func tileSourceEX() {
        self.mapView.setTMapTileType(EXTENSIONTILE)
        print("\(self.mapView.tmapTileType)")
    }
    
    func tileSourceHD() {
        self.mapView.setTMapTileType(HDTILE)
        print("\(self.mapView.tmapTileType)")
    }
    
    func removeMapView() {
        self.mapView.removeFromSuperview()
        self.mapView = nil
    }
    
    func reloadMapView() {
        if self.mapView == nil {
            let width: CGFloat = self.view.bounds.size.width - 10 * 2
            var height: CGFloat = self.view.bounds.size.height * 4 / 7
            height = CGFloat(ceilf(Float(height)))
            self.mapView = TMapView(frame: CGRect(x: CGFloat(10), y: CGFloat(10), width: width, height: height))
            self.mapView.setSKPMapApiKey(TMAP_APPKEY)
            self.mapView.delegate = self as! TMapViewDelegate
            self.mapView.gpsManagersDelegate = self as! TMapGpsManagerDelegate
            self.view.addSubview(self.mapView)
            
        }
    }
    
    func category() {
        let path = TMapPathData()
        path.delegate = self as! TMapPathDelegate
        //업종코드
        let result: [BizCategory] = path.getBizCategory() as! [BizCategory]
        //NSLog(@"result:%@", result);
        var cnt: Int = 0
        for biz: BizCategory in result {
            print("\(cnt += 1):\(biz.toString())")
        }
    }
    // MARK: - 경로탐색
    
    func rp() {
        let path = TMapPathData()
        path.delegate = self as! TMapPathDelegate
        let startPoint: TMapPoint? = self.mapView.getCenterPoint()
        //SKT 타워 37.566411, 126.985173
        let endPoint = TMapPoint(lon: 126.985173, lat: 37.566411)
        let polyLine: TMapPolyLine? = path.find(from: startPoint, to: endPoint)
        if polyLine == nil {
            return
        }
        if polyLine?.getPoint()?.count == 0 {
            return
        }
        //*
        // 출발, 도착 아이콘 설정
        let start: TMapPoint? = polyLine?.getPoint()?[0] as! TMapPoint?
        let end: TMapPoint? = polyLine?.getPoint()?.last as! TMapPoint?
        let startMarkerItem = TMapMarkerItem()
        startMarkerItem.setTMapPoint(start)
        startMarkerItem.setIcon(UIImage(named: "start.png"), anchorPoint: CGPoint(x: CGFloat(0.4), y: CGFloat(1.0)))
        let endMarkerItem = TMapMarkerItem()
        endMarkerItem.setTMapPoint(end)
        endMarkerItem.setIcon(UIImage(named: "end.png"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
        self.mapView.setTMapPathIconStart(startMarkerItem, end: endMarkerItem)
        //*/
        // 라인
        if polyLine != nil {
            self.mapView.addTMapPath(polyLine)
        }
    }
    
    func rpPedestrian() {
        let path = TMapPathData()
        let startPoint: TMapPoint? = self.mapView.getCenterPoint()
        //SKT 타워 37.566411, 126.985173
        let endPoint = TMapPoint(lon: 126.985173, lat: 37.566411)
        let polyLine: TMapPolyLine? = path.find(with: PEDESTRIAN_PATH, start: startPoint, end: endPoint)
        if polyLine == nil {
            return
        }
        if polyLine?.getPoint()?.count == 0 {
            return
        }
        
        
        //*
        // 출발, 도착 아이콘 설정
        let start: TMapPoint? = polyLine?.getPoint()?[0] as! TMapPoint?
        let end: TMapPoint? = polyLine?.getPoint()?.last as! TMapPoint?
        let startMarkerItem = TMapMarkerItem()
        startMarkerItem.setTMapPoint(start)
        startMarkerItem.setIcon(UIImage(named: "start.png"), anchorPoint: CGPoint(x: CGFloat(0.4), y: CGFloat(1.0)))
        let endMarkerItem = TMapMarkerItem()
        endMarkerItem.setTMapPoint(end)
        endMarkerItem.setIcon(UIImage(named: "end.png"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
        self.mapView.setTMapPathIconStart(startMarkerItem, end: endMarkerItem)
        //*/
        // 라인
        if polyLine != nil {
            self.mapView.addTMapPath(polyLine)
        }
    }
    
    func rpMulti() {
        let path = TMapPathData()
        let startPoint = TMapPoint(lon: 127.010493, lat: 37.552689)
        //[_mapView getCenterPoint];
        let endPoint = TMapPoint(lon: 127.034663, lat: 37.516535)
        let passPoints: [Any] = [TMapPoint(coordinate: CLLocationCoordinate2DMake(37.484781, 126.934061)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.509568, 126.964102)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.477719, 126.977491)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.474078, 126.893023))]
        let polyLine: TMapPolyLine? = path.findMultiPathData(withStart: startPoint, end: endPoint, passPoints: passPoints, searchOption: 0)
        //*/
        // 라인
        if polyLine != nil {
            let start = TMapMarkerItem()
            let arrival = TMapMarkerItem()
            let pass = TMapMarkerItem()
            start.setIcon(UIImage(named: "tmap_start"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            arrival.setIcon(UIImage(named: "tmap_arrival"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            pass.setIcon(UIImage(named: "tmap_pass"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            self.mapView.setTMapPathIconStart(start, end: arrival, pass: pass)
            self.mapView.addTMapPath(polyLine)
            self.mapView.showAllPolyLine([polyLine!])
        }
    }
    
    func rpBike() {
        let path = TMapPathData()
        let startPoint: TMapPoint? = self.mapView.getCenterPoint()
        //SKT 타워 37.566411, 126.985173
        let endPoint = TMapPoint(lon: 126.985173, lat: 37.566411)
        let polyLine: TMapPolyLine? = path.find(with: BICYCLE_PATH, start: startPoint, end: endPoint)
        if polyLine == nil {
            return
        }
        if polyLine?.getPoint()?.count == 0 {
            return
        }
        //*
        // 출발, 도착 아이콘 설정
        let start: TMapPoint? = polyLine?.getPoint()?[0] as! TMapPoint?
        let end: TMapPoint? = polyLine?.getPoint()?.last as! TMapPoint?
        let startMarkerItem = TMapMarkerItem()
        startMarkerItem.setTMapPoint(start)
        startMarkerItem.setIcon(UIImage(named: "start.png"), anchorPoint: CGPoint(x: CGFloat(0.4), y: CGFloat(1.0)))
        let endMarkerItem = TMapMarkerItem()
        endMarkerItem.setTMapPoint(end)
        endMarkerItem.setIcon(UIImage(named: "end.png"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
        self.mapView.setTMapPathIconStart(startMarkerItem, end: endMarkerItem)
        //*/
        // 라인
        if polyLine != nil {
            self.mapView.addTMapPath(polyLine)
        }
    }
    
    func findPathDataWithType() {
        let path = TMapPathData()
        let startPoint = TMapPoint(lon: 126.891832, lat: 37.508888)
        //[_mapView getCenterPoint];
        let endPoint = TMapPoint(lon: 126.998434, lat: 37.481512)
        let passPoints: [Any] = [TMapPoint(coordinate: CLLocationCoordinate2DMake(37.484781, 126.934061)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.509568, 126.964102)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.477719, 126.977491)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.474078, 126.893023))]
        // 01. 경로 라인
        let polyLine: TMapPolyLine? = path.find(with: CAR_PATH, start: startPoint, end: endPoint, passPoints: passPoints, searchOption: 0)
        if polyLine != nil {
            // 02. 출발, 도착, 경유 Marker Set
            let start = TMapMarkerItem()
            let arrival = TMapMarkerItem()
            let pass = TMapMarkerItem()
            start.setIcon(UIImage(named: "tmap_start"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            arrival.setIcon(UIImage(named: "tmap_arrival"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            pass.setIcon(UIImage(named: "tmap_pass"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            self.mapView.setTMapPathIconStart(start, end: arrival, pass: pass)
            // 03. 경로 및 아이콘 Draw
            self.mapView.addTMapPath(polyLine)
            // 04. 경로전체가 보이는 zoom, Center 설정
            self.mapView.showAllPolyLine([polyLine!])
        }
        
        
    }
    
    func findMultiPath() {
        let path = TMapPathData()
        let startPoint = TMapPoint(lon: 126.891832, lat: 37.508888)
        //[_mapView getCenterPoint];
        let endPoint = TMapPoint(lon: 126.998434, lat: 37.481512)
        let passPoints: [Any] = [TMapPoint(coordinate: CLLocationCoordinate2DMake(37.484781, 126.934061)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.509568, 126.964102)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.477719, 126.977491)), TMapPoint(coordinate: CLLocationCoordinate2DMake(37.474078, 126.893023))]
        // 01. 경로 라인
        let polyLine: TMapPolyLine? = path.findMultiPathData(withStart: startPoint, end: endPoint, passPoints: passPoints, searchOption: 0)
        if polyLine != nil {
            // 02. 출발, 도착, 경유 Marker Set
            let start = TMapMarkerItem()
            let arrival = TMapMarkerItem()
            let pass = TMapMarkerItem()
            start.setIcon(UIImage(named: "tmap_start"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            arrival.setIcon(UIImage(named: "tmap_arrival"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            pass.setIcon(UIImage(named: "tmap_pass"), anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
            self.mapView.setTMapPathIconStart(start, end: arrival, pass: pass)
            // 03. 경로 및 아이콘 Draw
            self.mapView.addTMapPath(polyLine)
            // 04. 경로전체가 보이는 zoom, Center 설정
            self.mapView.showAllPolyLine([polyLine!])
        }
    }
    // MARK: -
    
//    func poiTest() {
//        var path = TMapPathData()
//        //통합검색
//        var result: [TMapPOIItem] = path.requestFindAllPOI("신도림역") as! [TMapPOIItem]
//        var cnt: Int = 0
//        var idx: Int = 0
//        for poi: TMapPOIItem in result {
//            if cnt += 1 == 0{
//                self.mapView.center = poi.getPOIPoint() as! CGPoint
//            }
//            self.mapView.addCustomObject(poi, id: "poi\(idx += 1)")
//            print("poi:\(poi)")
//        }
//    }
    
    func trafficInfo() {
        self.mapView.trafficMode = !self.mapView.isTrafficInfo()
    }
    
    func bicycleMode() {
        self.mapView.bicycleMode = !self.mapView.isBicycleInfo()
    }
    
    func bicycleFacilityMode() {
        self.mapView.bicycleFacilityMode = !self.mapView.isBicycleFacilityInfo()
    }
    
    func trackingTest() {
        print("before trackingMode \(self.mapView.getIsTracking())")
        self.mapView.setTrackingMode(!self.mapView.getIsTracking())
        print("after trackingMode \(self.mapView.getIsTracking())")
    }
    
    func compassMode() {
        self.mapView.setCompassMode(!self.mapView.getIsCompass())
    }
    
    func sightMode() {
        self.mapView.setSightVisible(self.mapView.getSightVisible())
    }
    
    func mapPositionTypeTest() {
        self.mapView.setMapPositionType(self.mapView.getMapPositionType())
        
    }
    
    func sightVisibleTest() {
        self.mapView.setSightVisible(!self.mapView.getSightVisible())
    }
    
    func revGeoTest() {
        let path = TMapPathData()
        path.delegate = self as! TMapPathDelegate
        //_: String = path.convertGpsToAddress(at: self.mapView.getCenterPoint())
        //Alert(address)
    }
    
    func fullPath() {
        // 신길동 37.506386, 126.904018/,
        let endPoint = TMapPoint(lon: 126.903613, lat: 37.506287)
        let path = TMapPathData()
        let polyLine: TMapPolyLine? = path.find(from: self.mapView.getCenterPoint(), to: endPoint)
        if polyLine != nil {
            //        TMapMarkerItem* startMarker = [[[TMapMarkerItem alloc] initWithTMapPoint:[[polyLine getLinePoint] objectAtIndex:0]] autorelease];
            //        [startMarker setIcon:[UIImage imageNamed:@"start.png"]];
            //
            //        TMapMarkerItem* endMarker = [[[TMapMarkerItem alloc] initWithTMapPoint:[[polyLine getLinePoint] objectAtIndex:[polyLine getLinePoint].count-1]] autorelease];
            //        [endMarker setIcon:[UIImage imageNamed:@"end.png"]];
            //        NSArray* array = [[[NSArray alloc] initWithObjects:startMarker, endMarker, polyLine, endPoint, nil] autorelease];
            //        [_mapView showFullPath:array];
            self.mapView.showFullPath([polyLine!])
        }
    }
    
    func timeMachine() {
        let endPoint = TMapPoint(lon: 126.903613, lat: 37.506287)
        //, , ,
        let path = TMapPathData()
        path.delegate = self as! TMapPathDelegate
        let wayPoints: [Any] = [TMapPoint(lon: 126.949768, lat: 37.487322), TMapPoint(lon: 127.00882, lat: 37.535253)]
        var info: [AnyHashable: Any] = path.findTimeMachineCarPath(withStart: self.mapView.getCenterPoint(), end: endPoint, isStartTime: true, time: Date(), wayPoints: wayPoints)
        if (info["error"] as? String) != nil {
            print("error")
            //print("timeMachine Error( code: \(info["error"]["code"]) message: \(info["error"]["message"])")
        }
        else {
            print("timeMAchine Info :\(info)")
        }
    }
    
    func timeMachine2() {
        let endPoint = TMapPoint(lon: 126.903613, lat: 37.506287)
        //, , ,
        let path = TMapPathData()
        path.delegate = self as! TMapPathDelegate
        let wayPoints: [Any] = [TMapPoint(lon: 126.949768, lat: 37.487322), TMapPoint(lon: 127.00882, lat: 37.535253)]
        var info: [AnyHashable: Any] = path.findTimeMachineCarPath(withStart: self.mapView.getCenterPoint(), end: endPoint, isStartTime: true, time: Date().addingTimeInterval(24 * 60 * 60), wayPoints: wayPoints, searchOption: "02")
        if (info["error"] as? String) != nil {
            print("err")
            //print("timeMachine Error( code: \(info["error"]["code"]) message: \(info["error"]["message"])")
        }
        else {
            print("timeMAchine Info :\(info)")
        }
    }
    
    func setLocationTest() {
        
        self.mapView.setLocationPoint(TMapPoint(coordinate: CLLocationCoordinate2DMake(37.401933, 126.922651)))
    
    }
    
//    func setIconTest() {
//        var images: [Any] = [UIImage(data: Data(contentsOf: URL(string: "http://www.sk.co.kr/Image/common/logo.gif")!))!, UIImage(named: "start.png")!, UIImage(named: "end.png")!]
//        var index: Int = 0
//        var image: UIImage? = images[index += 1 % images.count]
//        self.mapView.setIcon(image)
//        
//    }
    
    func iconVisibleTest() {
        var visible: Bool = false
        self.mapView.setIconVisibility(visible)
        visible = !visible
    }
    
    func isValidCoord() {
        // 35.480354, 121.970215 대만
        var valid: Bool = false
        valid = self.mapView.isValidTMapPoint(TMapPoint(coordinate: CLLocationCoordinate2DMake(35.480354, 121.970215)))
        print("valid : \(valid ? "YES" : "NO") ")
        //36.651674, 126.606445 충남
        valid = self.mapView.isValidTMapPoint(TMapPoint(coordinate: CLLocationCoordinate2DMake(36.651674, 126.606445)))
        print("valid : \(valid ? "YES" : "NO") ")
        // 33.489011, 126.498302 제주
        valid = self.mapView.isValidTMapPoint(TMapPoint(coordinate: CLLocationCoordinate2DMake(33.489011, 126.498302)))
        print("valid : \(valid ? "YES" : "NO") ")
    }
    
    func poiCode() {
        let path = TMapPathData()
        path.delegate = self as! TMapPathDelegate
        //업종코드 (주유소)
        let result: [TMapPOIItem] = path.requestFindGeoPOI(self.mapView.getCenterPoint(), lCode: "04", mCode: "03") as! [TMapPOIItem]
        // 주유소 마커 표시
        if __markerIDs == nil {
            __markerIDs = [Any]() /* capacity: 10 */
        }
        var i: Int = 0
        for item: TMapPOIItem in result {
            //
            let ID: String = "marker\(i += 1)"
            __markerIDs?.append(ID)
            let image = UIImage(named: "dot.png")
            let mapPoint: TMapPoint? = item.getPOIPoint()
            let marker1 = TMapMarkerItem()
            marker1.setTMapPoint(mapPoint)
            marker1.setIcon(image)
            marker1.setName(item.getPOIName())
            self.mapView.addTMapMarkerItemID(ID, marker: marker1)
            print("name: \(item.getPOIName())")
        }
    }
    
    
    func capture() {
        let image: UIImage? = self.mapView.getCaptureImage()
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
//    func revGeoRevInfos(_ mapPoint: TMapPoint) {
//        var types: [Any] = ["A00", "A01", "A02", "A03", "A04"]
//        var tyepStrings: [Any] = ["행정동, 법정동", "행정동", "법정동", "도로명주소 길", "도로명주소 건물번호"]
//        var i: Int = 0
//        for type: String in types{
//            var path = TMapPathData()
//            path.delegate = self
//            var info: [AnyHashable: Any] = path.reverseGeocoding(mapPoint, addressType: type)
//            var keys: [Any] = info.keys
//            print("----------[\(type)]\(tyepStrings[i]) -------------")
//            for key: String in keys {
//                print("\(key): \(info[key] as? String)")
//            }
//            i += 1
//        }
//    }
    // MARK: - TMap 연동
    
    func route() {
        TMapTapi.invokeRoute("신도림역", coordinate: self.mapView.centerCoordinate())
    }
    
    func route2() {
        let routeInfo: [AnyHashable: Any] = [
            "rGoName" : "강남역",
            "rGoX" :             // 목적지명칭(필수)
                Int(127.027621),
            "rGoY" :             // 목적지경도(필수)
                Int(37.497942),
            "rStName" :             // 목적지위도(필수)
            "서울역",
            "rStX" :             // 출발지명칭
                Int(126.972646),
            "rStY" :             // 출발지경도
                Int(37.553017),
            "rV1Name" :             // 출발지위도
            "용산역",
            "rV1X" :             // 경유지1명칭
                Int(126.964775),
            "rV1Y" :             // 경유지1 경도
                Int(37.52989),
            "rV2Name" :             // 경유지1 위도
            "사당역",
            "rV2X" :             // 경유지2명칭
                Int(126.981633),
            "rV2Y" :             // 경유지2경도
                Int(37.476559)
        ]
        
        // 경유지2위도
        TMapTapi.invokeRoute(routeInfo)
    }
    
    func mapview() {
        TMapTapi.invokeSetLocation("신도림역", coordinate: self.mapView.centerCoordinate())
    }
    
    func search() {
        TMapTapi.invokeSearchPortal("신도림역")
    }
    
    func home() {
        TMapTapi.invokeGoHome()
    }
    
    func company() {
        TMapTapi.invokeGoCompany()
        
    }
    
    func tMapAppInfo() {
        // TMap 설치 여부
        let installed: Bool = TMapTapi.isTmapApplicationInstalled()
        // TMap 앱스토어 URL
        let appstoreURL: String = TMapTapi.getTMapDownUrl()
        print("installed: \(installed ? "Y" : "N") URL: \(appstoreURL)")
    }
    // MARK: -
    
    func scrollEnable() {
        var enable: Bool = false
        self.mapView.setUserScrollZoomEnable(enable)
        
        enable = !enable
    }
    // MARK: - CallOutMarker
    
    func addCallOutMarker() {
        let image = UIImage(named: "start.png")
        let mapPoint = TMapPoint(coordinate: self.mapView.centerCoordinate())
        let marker1 = TMapMarkerItem()
        marker1.setTMapPoint(mapPoint)
        marker1.setIcon(image, anchorPoint: CGPoint(x: CGFloat(0.5), y: CGFloat(1.0)))
        marker1.canShowCallout = true
        marker1.calloutTitle = "CallOut 타이틀"
        marker1.calloutSubtitle = "CallOut 서브타이틀"
        marker1.calloutLeftImage = UIImage(named: "end.png")
        marker1.calloutRightButtonImage = UIImage(named: "accessory_detail.png")
        marker1.autoCalloutVisible = true
        // 풍선뷰 보이기
        var i: Int = 0
        let markerID: String = "marker_\(i)"
        self.mapView.addTMapMarkerItemID(markerID, marker: marker1)
        i += 1
    }
    // MARK: - Overlay
    
    func showWeatherOverlay() {
        let leftTop = TMapPoint(coordinate: CLLocationCoordinate2DMake(45.640171, 114.9652948))
        let rightBottom = TMapPoint(coordinate: CLLocationCoordinate2DMake(29.2267177, 138.7206798))
        let overlay = TMapOverlayItem()
        overlay.image = UIImage(named: "weather.png")
        overlay.leftTopPoint = leftTop
        overlay.rightBottomPoint = rightBottom
        self.mapView.addTMapOverlayID("weather_Overlay", overlayItem: overlay)
    }
    
    func changeImage() {
        let item: TMapOverlayItem? = self.mapView.getOverlayItem(fromID: "weather_Overlay")
        item?.image = UIImage(named: "weather_01.png")
    }
    
    func removeWeatherOverlay() {
        self.mapView.removeTMapOverlayID("weather_Overlay")
    }
    // MARK: - change logo pos
    
//    func logoPos() {
//        var pos: TMapLogoPositon = POSITION_BOTTOMLEFT
//        self.mapView.setTMapLogoPosition(pos)
//        if pos += 1 == POSITION_BOTTOMRIGHT {
//            pos = POSITION_BOTTOMLEFT
//        }
//    }
    // MARK: - ZoomToSpan
    
//    func zoomToSpan() {
//        var minLat: Double = 37.42852
//        var maxLat: Double = 37.714784
//        var minLon: Double = 126.750897
//        var maxLon: Double = 127.196529
//        var centerCoord: CLLocationCoordinate2D = [(minLat + maxLat) / 2, (minLon + maxLon) / 2]
//        self.mapView.zoom(toLatSpan: (-(lonSpan as? minLat) as? maxLat), (-(minLon) as? maxLon))
//        //self.mapView.centerCoordinate = centerCoord
//        self.mapView.setCenter(centerCoord)
//        
//    }
    
    func zoomToTMapPoint() {
        let leftTop = TMapPoint(coordinate: CLLocationCoordinate2DMake(37.448697, 126.705322))
        let rightBottom = TMapPoint(coordinate: CLLocationCoordinate2DMake(35.527756, 129.320068))
        self.mapView.zoom(toTMapPointLeftTop: leftTop, rightBottom: rightBottom)
    }
    static var __gps: TMapGpsManager? = nil
    
    func gps_ON() {
        if CheckMapViewController.__gps == nil {
            CheckMapViewController.__gps = TMapGpsManager()
        }
        // 백그라운드 위치정보 얻기
        //[__gps setAlwaysAuthorization:YES];
        CheckMapViewController.__gps?.delegate = self as! TMapGpsManagerDelegate
        CheckMapViewController.__gps?.openGps()
    }
    
    func gps_OFF() {
        CheckMapViewController.__gps?.closeGps()
        CheckMapViewController.__gps = nil
    }
    
    func onResponseCodeCallback(withApiName apiName: String, resCode: Int, url: String) {
        print("apiName: \(apiName) , resCode: \(resCode) , url: \(url)")
    }
}
