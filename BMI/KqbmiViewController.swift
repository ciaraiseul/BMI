import UIKit

class KqbmiViewController: UIViewController {

    var bmiValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        self.view.backgroundColor = UIColor(red: 10/255, green: 13/255, blue: 33/255, alpha: 1.0)
        
        
        setupHeader()
        setupResultView()
        setupRecalculateButton()
    }
    
    func setupHeader() {
            
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerView)
            
           
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50)
        ])
            
            
        let menuButton = UIButton()
        menuButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        menuButton.tintColor = .white
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(menuButton)
        
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            menuButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30)
        ])
            
            
        let titleLabel = UILabel()
        titleLabel.text = "BMI CALCULATOR"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
            
           
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    func setupResultView() {
        let resultTitleLabel = UILabel()
        resultTitleLabel.text = "Your Result"
        resultTitleLabel.textColor = .white
        resultTitleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(resultTitleLabel)
        
        NSLayoutConstraint.activate([
            resultTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            resultTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80)
        ])
        
        let resultView = UIView()
        resultView.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 50/255, alpha: 1.0)
        resultView.layer.cornerRadius = 10
        resultView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(resultView)
        
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            resultView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            resultView.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 20),
            resultView.heightAnchor.constraint(equalToConstant: 475)
        ])
        
        let bmiStatusLabel = UILabel()
        bmiStatusLabel.textColor = UIColor.green
        bmiStatusLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        bmiStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        resultView.addSubview(bmiStatusLabel)
        
        let bmiValueLabel = UILabel()
        bmiValueLabel.textColor = .white
        bmiValueLabel.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        bmiValueLabel.translatesAutoresizingMaskIntoConstraints = false
        resultView.addSubview(bmiValueLabel)
        
        let bmiRangeLabel = UILabel()
        bmiRangeLabel.text = "Normal BMI range:"
        bmiRangeLabel.textColor = .lightGray
        bmiRangeLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        bmiRangeLabel.numberOfLines = 0
        bmiRangeLabel.textAlignment = .center
        bmiRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        resultView.addSubview(bmiRangeLabel)
        
        let bmiRangeLabel2 = UILabel()
        bmiRangeLabel2.text = "18,5 - 25 kg/m2"
        bmiRangeLabel2.textColor = .white
        bmiRangeLabel2.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        bmiRangeLabel2.numberOfLines = 0
        bmiRangeLabel2.textAlignment = .center
        bmiRangeLabel2.translatesAutoresizingMaskIntoConstraints = false
        resultView.addSubview(bmiRangeLabel2)
        
        let bmiDescriptionLabel = UILabel()
        bmiDescriptionLabel.textColor = .white
        bmiDescriptionLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        bmiDescriptionLabel.numberOfLines = 0
        bmiDescriptionLabel.textAlignment = .center
        bmiDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        resultView.addSubview(bmiDescriptionLabel)
        
        NSLayoutConstraint.activate([
            bmiStatusLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            bmiStatusLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 20),
            
            bmiValueLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            bmiValueLabel.topAnchor.constraint(equalTo: bmiStatusLabel.bottomAnchor, constant: 10),
            
            bmiRangeLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            bmiRangeLabel.topAnchor.constraint(equalTo: bmiValueLabel.bottomAnchor, constant: 10),
            
            bmiRangeLabel2.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            bmiRangeLabel2.topAnchor.constraint(equalTo: bmiRangeLabel.bottomAnchor, constant: 10),
            
            bmiDescriptionLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            bmiDescriptionLabel.topAnchor.constraint(equalTo: bmiRangeLabel.bottomAnchor, constant: 10),
            bmiDescriptionLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 10),
            bmiDescriptionLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -20),
            bmiDescriptionLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -60)
        ])
        
        
        let saveButton = UIButton()
        saveButton.setTitle("SAVE RESULT", for: .normal)
        saveButton.backgroundColor = UIColor(red: 24/255, green: 26/255, blue: 45/255, alpha: 1.0)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 10
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        resultView.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -50),
            saveButton.widthAnchor.constraint(equalToConstant: 225),
            saveButton.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        if let bmiValue = bmiValue {
            bmiValueLabel.text = String(format: "%.1f", bmiValue)
            
            switch bmiValue {
            case ..<18.5:
                bmiStatusLabel.text = "UNDERWEIGHT"
                bmiDescriptionLabel.text = "You have a lower than normal body weight. Try to eat more."
            case 18.5..<25:
                bmiStatusLabel.text = "NORMAL"
                bmiDescriptionLabel.text = "You have a normal body weight. Good job!"
            case 25..<30:
                bmiStatusLabel.text = "OVERWEIGHT"
                bmiDescriptionLabel.text = "You have a higher than normal body weight. Try to exercise more."
            default:
                bmiStatusLabel.text = "OBESE"
                bmiDescriptionLabel.text = "You have a higher than normal body weight. Consult with your doctor."
            }
        }
    }
    
    func setupRecalculateButton() {
        let recalculateButton = UIButton()
        recalculateButton.setTitle("RE-CALCULATE YOUR BMI", for: .normal)
        recalculateButton.backgroundColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1.0)
        recalculateButton.setTitleColor(.white, for: .normal)
        recalculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.addTarget(self, action: #selector(recalculateBMI), for: .touchUpInside)
        self.view.addSubview(recalculateButton)
        
        NSLayoutConstraint.activate([
            recalculateButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            recalculateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func recalculateBMI() {
        self.navigationController?.popViewController(animated: true)
    }
}
