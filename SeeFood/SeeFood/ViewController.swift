//
//  ViewController.swift
//  SeeFood
//
//  Created by Rachel Arruda Lima on 16/11/22.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
    //nesse parametro info, é um dicionario, vou especificar a chave que produzirá a imagem que eles escolherem, e a chave se chama UIImagePickerControllerOriginalImage. E esta é a imagem original nao editada selecionada pelo usuario
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("nao foi possivel converter para CIImage")
            }
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
            
    }
        
    func detect(image: CIImage){
        //criamos um objeto chamado model usando o conteiner VNCOreMLModel
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            //print(results)
            if let firstResult = results.first{
                if firstResult.identifier.contains("hotdog"){
                    self.navigationItem.title = "Hotdog!"
                } else {
                    self.navigationItem.title = "Not Hotdog!"
                }
            }
        
        }
        
        //esse manipulador de imagens para executar a solicitacao da classificacao da imagem
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch{
            print(error)
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
    
        present(imagePicker, animated: true, completion: nil)
        
        }
    
    }

