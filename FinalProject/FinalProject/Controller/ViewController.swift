//
//  ViewController.swift
//  FinalProject
//
//  Created by 18267440 on 13.07.2021.
//

import UIKit

final class ViewController: BaseViewController {
    
    private let networkService: GiphyNetworkServiceProtocol
    
    init(networkService: GiphyNetworkServiceProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var url: String?
    lazy var info: Label={
        let view = Label(text: "На случай важных переговоров")
        return view
    }()
    
    lazy var img: GifCell={
        let view = GifCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
    func myButton(){
        let button = UIButton(frame: CGRect(x: view.frame.size.width/2 - 80, y:
                                                view.frame.size.height/1.5, width: 160, height: 50))
        view.addSubview(button)
        button.setTitle("Начать!", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    private var dataSource = [Url]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadData()
        }
    
    deinit {
        print("ViewController deinit")
    }
    
    
    private func configureUI() {
        view.backgroundColor = .white
        myButton()
        view.addSubview(img)
        view.addSubview(info)
    }

    private func loadData() {
        isLoading = true
        networkService.getData{ self.process($0) }
        }

    private func process(_ response: GetRandomGifAPIResponse) {
        DispatchQueue.main.async {
            switch response {
            case .success(let data):
                self.url = data.data.images.fixedHeightSmall.url
            case .failure(let error):
                self.showAlert(for: error)
            }
            self.isLoading = false
        }
    }
    
    private func showAlert(for error: NetworkServiceError) {
            let alert = UIAlertController(title: "Опаньки, что-то пошло не так",
                                          message: message(for: error),
                                          preferredStyle: .alert)
            present(alert, animated: true)
        }

        private func message(for error: NetworkServiceError) -> String {
            switch error {
            case .network:
                return "Упал запрос"
            case .decodable:
                return "Не смогли распарсить"
            case .unknown:
                return "Хз, что произошло, но обязательно разберемся"

            }
        }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        info.center = view.center
        info.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-UIScreen.main.bounds.height/2)
        img.frame = .init(x: view.frame.size.width/2 - 75, y: view.frame.size.height/3, width: 150, height: 150)
    }

}

extension ViewController {
    @objc func buttonTapped() {
        let secondScreen = SecondScreen()
        navigationController?.present(secondScreen, animated: false)
    }
}
