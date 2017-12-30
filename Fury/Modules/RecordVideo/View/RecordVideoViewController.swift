//
//  RecordVideoRecordVideoViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 25/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import AVFoundation

class RecordVideoViewController: UIViewController, RecordVideoViewInput {
    func setupInitialState() {
        
    }
    

    var output: RecordVideoViewOutput!
//
//    // MARK: Life cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        output.viewIsReady()
//    }
//
//
//    // MARK: RecordVideoViewInput
//    func setupInitialState() {
//        let composition = AVMutableComposition.init()
//
//        let videoComposition = AVMutableVideoComposition()
//        videoComposition.frameDuration = CMTimeMake(1, 30)
//        videoComposition.renderScale  = 1.0
//
//        let compositionCommentaryTrack: AVMutableCompositionTrack? = composition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid)
//
//
//        let compositionVideoTrack: AVMutableCompositionTrack? = composition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: kCMPersistentTrackID_Invalid)
//
//
//        let clipVideoTrack:AVAssetTrack = self.currentAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
//
//        let audioTrack: AVAssetTrack? = self.currentAsset.tracks(withMediaType: AVMediaTypeAudio)[0]
//
//        try? compositionCommentaryTrack?.insertTimeRange(CMTimeRangeMake(kCMTimeZero, self.currentAsset.duration), of: audioTrack!, at: kCMTimeZero)
//
//        try? compositionVideoTrack?.insertTimeRange(CMTimeRangeMake(kCMTimeZero, self.currentAsset.duration), of: clipVideoTrack, at: kCMTimeZero)
//
//        let orientation = VideoModel.videoOrientation(self.currentAsset)
//        var isPortrait = false
//
//        switch orientation {
//        case .landscapeRight:
//            isPortrait = false
//        case .landscapeLeft:
//            isPortrait = false
//        case .portrait:
//            isPortrait = true
//        case .portraitUpsideDown:
//            isPortrait = true
//        }
//
//        var naturalSize = clipVideoTrack.naturalSize
//
//        if isPortrait
//        {
//            naturalSize = CGSize.init(width: naturalSize.height, height: naturalSize.width)
//        }
//
//        videoComposition.renderSize = naturalSize
//
//        let scale = CGFloat(1.0)
//
//        var transform = CGAffineTransform.init(scaleX: CGFloat(scale), y: CGFloat(scale))
//
//        switch orientation {
//        case .landscapeRight: break
//        // isPortrait = false
//        case .landscapeLeft:
//            transform = transform.translatedBy(x: naturalSize.width, y: naturalSize.height)
//            transform = transform.rotated(by: .pi)
//        case .portrait:
//            transform = transform.translatedBy(x: naturalSize.width, y: 0)
//            transform = transform.rotated(by: CGFloat(M_PI_2))
//        case .portraitUpsideDown:break
//        }
//
//        let frontLayerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: compositionVideoTrack!)
//        frontLayerInstruction.setTransform(transform, at: kCMTimeZero)
//
//        let MainInstruction = AVMutableVideoCompositionInstruction()
//        MainInstruction.timeRange = CMTimeRangeMake(kCMTimeZero, composition.duration)
//        MainInstruction.layerInstructions = [frontLayerInstruction]
//        videoComposition.instructions = [MainInstruction]
//
//        let parentLayer = CALayer.init()
//        parentLayer.frame = CGRect.init(x: 0, y: 0, width: naturalSize.width, height: naturalSize.height)
//
//        let videoLayer = CALayer.init()
//        videoLayer.frame = parentLayer.frame
//
//
//        let layer = CATextLayer()
//        layer.string = "HELLO ALL"
//        layer.foregroundColor = UIColor.white.cgColor
//        layer.backgroundColor = UIColor.orange.cgColor
//        layer.fontSize = 32
//        layer.frame = CGRect.init(x: 0, y: 0, width: 300, height: 100)
//
//        var rct = layer.frame;
//
//        let widthScale = self.playerView.frame.size.width/naturalSize.width
//
//        rct.size.width /= widthScale
//        rct.size.height /= widthScale
//        rct.origin.x /= widthScale
//        rct.origin.y /= widthScale
//
//
//
//        parentLayer.addSublayer(videoLayer)
//        parentLayer.addSublayer(layer)
//
//        videoComposition.animationTool = AVVideoCompositionCoreAnimationTool.init(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
//
//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let videoPath = documentsPath+"/cropEditVideo.mov"
//
//        let fileManager = FileManager.default
//
//        if fileManager.fileExists(atPath: videoPath)
//        {
//            try! fileManager.removeItem(atPath: videoPath)
//        }
//
//        print("video path \(videoPath)")
//
//        var exportSession = AVAssetExportSession.init(asset: composition, presetName: AVAssetExportPresetHighestQuality)
//        exportSession?.videoComposition = videoComposition
//        exportSession?.outputFileType = AVFileType.mov
//        exportSession?.outputURL = URL.init(fileURLWithPath: videoPath)
//        exportSession?.videoComposition = videoComposition
//        var exportProgress: Float = 0
//        let queue = DispatchQueue(label: "Export Progress Queue")
//        queue.async(execute: {() -> Void in
//            while exportSession != nil {
//                //                int prevProgress = exportProgress;
//                exportProgress = (exportSession?.progress)!
//                print("current progress == \(exportProgress)")
//                sleep(1)
//            }
//        })
//
//        exportSession?.exportAsynchronously(completionHandler: {
//
//
//            if exportSession?.status == AVAssetExportSessionStatus.failed
//            {
//                print("Failed \(exportSession?.error)")
//            }else if exportSession?.status == AVAssetExportSessionStatus.completed
//            {
//                exportSession = nil
//
//                let asset = AVAsset.init(url: URL.init(fileURLWithPath: videoPath))
//                DispatchQueue.main.async {
//                    let item = AVPlayerItem.init(asset: asset)
//
//
//                    self.player.replaceCurrentItem(with: item)
//
//                    let assetDuration = CMTimeGetSeconds(composition.duration)
//                    self.progressSlider.maximumValue = Float(assetDuration)
//
//                    self.syncLayer.removeFromSuperlayer()
//                    self.lblIntro.isHidden = true
//
//                    self.player.play()
//                    //                    let url =  URL.init(fileURLWithPath: videoPath)
//                    //                    let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: [])
//                    //                    self.present(activityVC, animated: true, completion: nil)
//                }
//
//            }
//        })
//    }
}
