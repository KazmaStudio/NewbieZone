//
//  ViewControllerDanjon.swift
//  newbiezone
//
//  Created by zhaochenjun on 15/12/22.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ViewControllerDanjon: UIViewController {

    @IBOutlet weak var viewCapture: UIView!
    var session = AVCaptureSession()
    var videoInput = AVCaptureDeviceInput()
    var stillImageOutput = AVCaptureStillImageOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    var assetCollection: PHAssetCollection!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        initAVCaptureSession()
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        session.stopRunning()
    }
    
    func initAVCaptureSession() {
        
        if let assetCollection = fetchAssetCollectionForAlbum() {
            
            self.assetCollection = assetCollection
            
        }else{
            
            if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.Authorized {
                PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in
                    status
                })
            }
            
            if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.Authorized {
                self.createAlbum()
            } else {
                PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
            }
            
        }


        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        do{
        
            try device.lockForConfiguration()
            
        }
        catch{
            
        }
        device.flashMode = .Off
        device.unlockForConfiguration()
        
        do{
           try videoInput = AVCaptureDeviceInput.init(device: device)
        }
        catch{
            
        }
        
        stillImageOutput.outputSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
        
        session.sessionPreset = AVCaptureSessionPresetHigh
        
        if session.canAddInput(videoInput){
            session.addInput(videoInput)
        }
        
        if session.canAddOutput(stillImageOutput){
            session.addOutput(stillImageOutput)
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        previewLayer.frame = frame(0, y: 0, w: viewCapture.frame.size.width, h: viewCapture.frame.size.height)
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        
        viewCapture.layer.addSublayer(previewLayer)
            
        session.startRunning()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonTakePhotoTap(sender: AnyObject) {
        
        let stillImageConnection = stillImageOutput.connectionWithMediaType(AVMediaTypeVideo)
        
        stillImageOutput.captureStillImageAsynchronouslyFromConnection(stillImageConnection) { (buffer, error) in
            
            if let soundURL = NSBundle.mainBundle().URLForResource("blank", withExtension: "wav") {
                
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(soundURL, &mySound)
                AudioServicesPlaySystemSound(mySound);
                
            }

            let jpegData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer)
            
            let image = UIImage.init(data: jpegData)
            
            self.saveImage(image!)
            
        }
        
    }
    
    func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.Authorized {
            // ideally this ensures the creation of the photo album even if authorization wasn't prompted till after init was done
            print("trying again to create the album")
            self.createAlbum()
        } else {
            print("should really prompt the user to let them know it's failed")
        }
    }
    
    func createAlbum() {
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle("shoot")   // create an asset collection with the album name
        }) { success, error in
            if success {
                self.assetCollection = self.fetchAssetCollectionForAlbum()
            } else {
                print("error \(error)")
            }
        }
    }
    
    func fetchAssetCollectionForAlbum() -> PHAssetCollection! {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", "shoot")
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: fetchOptions)
        
        if let _: AnyObject = collection.firstObject {
            return collection.firstObject as! PHAssetCollection
        }
        return nil
    }
    
    func saveImage(image: UIImage) {
        if assetCollection == nil {
            return                          // if there was an error upstream, skip the save
        }
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
            let assetPlaceHolder = assetChangeRequest.placeholderForCreatedAsset
            let albumChangeRequest = PHAssetCollectionChangeRequest(forAssetCollection: self.assetCollection)
            albumChangeRequest!.addAssets([assetPlaceHolder!])
            }, completionHandler: nil)
    }

}
