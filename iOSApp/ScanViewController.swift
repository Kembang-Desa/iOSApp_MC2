//
//  ViewController.swift
//  TextRecognition
//
//  Created by Ditha Nurcahya Avianty on 24/06/22.
//

import UIKit
import Vision
import VisionKit

class ScanViewController: UIViewController {
    
//    private var scanButton = ScanButton(frame: .zero)
//    private var scanImageView = ScanImageView(frame: .zero)
//    private var ocrTextView = OcrTextView(frame: .zero, textContainer: nil)
    private var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureOCR()
    }
    
    
    private func configure() {
//        view.addSubview(scanImageView)
//        view.addSubview(ocrTextView)
//        view.addSubview(scanButton)
//
//        let padding: CGFloat = 16
//        NSLayoutConstraint.activate([
//            scanButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
//            scanButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
//            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
//            scanButton.heightAnchor.constraint(equalToConstant: 50),
//
//            ocrTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
//            ocrTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
//            ocrTextView.bottomAnchor.constraint(equalTo: scanButton.topAnchor, constant: -padding),
//            ocrTextView.heightAnchor.constraint(equalToConstant: 200),
//
//            scanImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
//            scanImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
//            scanImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
//            scanImageView.bottomAnchor.constraint(equalTo: ocrTextView.topAnchor, constant: -padding)
//        ])
        
//        scanButton.addTarget(self, action: #selector(scanDocument), for: .touchUpInside)
        scanDocument()
    }
    
    
    @objc private func scanDocument() {
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        present(scanVC, animated: true)
    }
    
    
    private func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
//        ocrTextView.text = ""
//        scanButton.isEnabled = false
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try requestHandler.perform([self.ocrRequest])
        } catch {
            print(error)
        }
    }
    //
    //    func recognizeTextHandler(request: VNRequest, error: Error?) {
    //        guard let observations =
    //                request.results as? [VNRecognizedTextObservation] else {
    //            return
    //        }
    //        let recognizedStrings = observations.compactMap { observation in
    //            // Return the string of the top VNRecognizedText instance.
    //            return observation.topCandidates(1).first?.string
    //        }
    //
    //        // Process the recognized strings.
    //        processResults(recognizedStrings)
    //    }
    
    func checkData(ocr: String) -> [String]{
        //ada total di array sblmnya
        let pricePattern = #"TOTAL:"#
        do {
            let regex = try NSRegularExpression(pattern: pricePattern)
            let results = regex.matches(in: ocr,
                                        range: NSRange(ocr.startIndex..., in: ocr))
            return results.map {
                String(ocr[Range($0.range, in: ocr)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    
    func configureOCR() {
        ocrRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var ocrText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                
                if topCandidate.string == "TOTAL" {
                    ocrText += topCandidate.string + ":"
                }else if ocrText.isEmpty{
                    continue
                }else{
                    ocrText += topCandidate.string + "\n"
                    break
                }
            }
            print(ocrText)
            let a = self.checkData(ocr: ocrText)
            print(a)
//            if
            let fullNameArr = ocrText.components(separatedBy: ":")
            print(fullNameArr[1])
            
            
            
//            DispatchQueue.main.async {
//                self.ocrTextView.text = ocrText
//                self.scanButton.isEnabled = true
//            }
        }
        
        ocrRequest.recognitionLevel = .accurate
        ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
        ocrRequest.usesLanguageCorrection = true
    }
}


extension ScanViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
//        scanImageView.image = scan.imageOfPage(at: (scan.pageCount-1))
        processImage(scan.imageOfPage(at: (scan.pageCount-1)))
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        //Handle properly error
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}
