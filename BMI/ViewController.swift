import UIKit

class ViewController: UIViewController {
    
    let maleView = UIView()
    let femaleView = UIView()
    
    let maleIcon = UIImageView(image: UIImage(named: "icons8-male-48"))
    let femaleIcon = UIImageView(image: UIImage(named: "icons8-female-48"))
    
    let maleLabel = UILabel()
    let femaleLabel = UILabel()
    
    let heightValueLabel = UILabel()
    let heightView = UIView()
    
    let weightValueLabel = UILabel()
    let ageValueLabel = UILabel()
    let weightView = UIView()
    let ageView = UIView()
    
    let calculateView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 10/255, green: 13/255, blue: 33/255, alpha: 1.0)
        
        setupHeader()
        setupGenderSelection()
        setupHeightSlider()
        setupWeightAndAgeControls()
        setupCalculateBMIView()
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
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor(red: 8/255, green: 10/255, blue: 26/255, alpha: 1.0)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomLine.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupGenderSelection() {
        maleView.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 50/255, alpha: 1.0)
        femaleView.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 50/255, alpha: 1.0)
        
        maleView.translatesAutoresizingMaskIntoConstraints = false
        femaleView.translatesAutoresizingMaskIntoConstraints = false
        
        maleView.isUserInteractionEnabled = true
        femaleView.isUserInteractionEnabled = true
        
        self.view.addSubview(maleView)
        self.view.addSubview(femaleView)
        
        NSLayoutConstraint.activate([
            maleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            maleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            maleView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            maleView.heightAnchor.constraint(equalToConstant: 150),
            
            femaleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            femaleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            femaleView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            femaleView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        setupIconAndLabel()
        addTapGestures()
    }
    
    func setupIconAndLabel() {
        maleIcon.tintColor = .lightGray
        maleIcon.translatesAutoresizingMaskIntoConstraints = false
        maleView.addSubview(maleIcon)
        
        maleLabel.text = "MALE"
        maleLabel.textColor = .lightGray
        maleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        maleView.addSubview(maleLabel)
        
        NSLayoutConstraint.activate([
            maleIcon.centerXAnchor.constraint(equalTo: maleView.centerXAnchor),
            maleIcon.topAnchor.constraint(equalTo: maleView.topAnchor, constant: 40),
            maleIcon.widthAnchor.constraint(equalToConstant: 48),
            maleIcon.heightAnchor.constraint(equalToConstant: 48),
            
            maleLabel.centerXAnchor.constraint(equalTo: maleView.centerXAnchor),
            maleLabel.topAnchor.constraint(equalTo: maleIcon.bottomAnchor, constant: 8)
        ])
        
        femaleIcon.tintColor = .lightGray
        femaleIcon.translatesAutoresizingMaskIntoConstraints = false
        femaleView.addSubview(femaleIcon)
        
        femaleLabel.text = "FEMALE"
        femaleLabel.textColor = .lightGray
        femaleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        femaleView.addSubview(femaleLabel)
        
        NSLayoutConstraint.activate([
            femaleIcon.centerXAnchor.constraint(equalTo: femaleView.centerXAnchor),
            femaleIcon.topAnchor.constraint(equalTo: femaleView.topAnchor, constant: 40),
            femaleIcon.widthAnchor.constraint(equalToConstant: 48),
            femaleIcon.heightAnchor.constraint(equalToConstant: 48),
            
            femaleLabel.centerXAnchor.constraint(equalTo: femaleView.centerXAnchor),
            femaleLabel.topAnchor.constraint(equalTo: femaleIcon.bottomAnchor, constant: 8)
        ])
    }
    
    func addTapGestures() {
        let maleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMaleTap))
        maleView.addGestureRecognizer(maleTapGesture)
        
        let femaleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFemaleTap))
        femaleView.addGestureRecognizer(femaleTapGesture)
    }
    
    @objc func handleMaleTap() {
        maleIcon.tintColor = .white
        maleLabel.textColor = .white
        femaleIcon.tintColor = .lightGray
        femaleLabel.textColor = .lightGray
    }
    
    @objc func handleFemaleTap() {
        femaleIcon.tintColor = .white
        femaleLabel.textColor = .white
        maleIcon.tintColor = .lightGray
        maleLabel.textColor = .lightGray
    }
    
    func setupHeightSlider() {
        heightView.backgroundColor = UIColor(red: 18/255, green: 20/255, blue: 39/255, alpha: 1.0)
        heightView.layer.cornerRadius = 10
        heightView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(heightView)
        
        NSLayoutConstraint.activate([
            heightView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            heightView.topAnchor.constraint(equalTo: maleView.bottomAnchor, constant: 20),
            heightView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            heightView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let heightLabel = UILabel()
        heightLabel.text = "HEIGHT"
        heightLabel.textColor = .lightGray
        heightLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightView.addSubview(heightLabel)
        
        NSLayoutConstraint.activate([
            heightLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor),
            heightLabel.topAnchor.constraint(equalTo: heightView.topAnchor, constant: 20)
        ])
        
        heightValueLabel.text = "183 cm"
        heightValueLabel.textColor = .white
        heightValueLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightView.addSubview(heightValueLabel)
        
        
        NSLayoutConstraint.activate([
            heightValueLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor),
            heightValueLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10)
        ])
        
        let heightSlider = UISlider()
        heightSlider.minimumValue = 100
        heightSlider.maximumValue = 220
        heightSlider.value = 183
        heightSlider.minimumTrackTintColor = .white
        heightSlider.maximumTrackTintColor = UIColor(white: 1.0, alpha: 0.2)
        heightSlider.thumbTintColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1.0) // Màu đỏ cho nút
        heightSlider.translatesAutoresizingMaskIntoConstraints = false
        heightView.addSubview(heightSlider)
        
        NSLayoutConstraint.activate([
            heightSlider.leadingAnchor.constraint(equalTo: heightView.leadingAnchor, constant: 20),
            heightSlider.trailingAnchor.constraint(equalTo: heightView.trailingAnchor, constant: -20),
            heightSlider.topAnchor.constraint(equalTo: heightValueLabel.bottomAnchor, constant: 20)
        ])
        
        heightSlider.addTarget(self, action: #selector(heightSliderChanged(_:)), for: .valueChanged)
    }
    
    @objc func heightSliderChanged(_ sender: UISlider) {
        let height = Int(sender.value)
        heightValueLabel.text = "\(height) cm"
    }
    
    func setupWeightAndAgeControls() {
        weightView.backgroundColor = UIColor(red: 18/255, green: 20/255, blue: 39/255, alpha: 1.0)
        weightView.layer.cornerRadius = 10
        weightView.translatesAutoresizingMaskIntoConstraints = false
        
        ageView.backgroundColor = UIColor(red: 18/255, green: 20/255, blue: 39/255, alpha: 1.0)
        ageView.layer.cornerRadius = 10
        ageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(weightView)
        self.view.addSubview(ageView)
        
        NSLayoutConstraint.activate([
            weightView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            weightView.topAnchor.constraint(equalTo: heightView.bottomAnchor, constant: 20),
            weightView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            weightView.heightAnchor.constraint(equalToConstant: 200),
            
            ageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            ageView.topAnchor.constraint(equalTo: heightView.bottomAnchor, constant: 20),
            ageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            ageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let weightLabel = UILabel()
        weightLabel.text = "WEIGHT"
        weightLabel.textColor = .lightGray
        weightLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightView.addSubview(weightLabel)
        
        NSLayoutConstraint.activate([
            weightLabel.centerXAnchor.constraint(equalTo: weightView.centerXAnchor),
            weightLabel.topAnchor.constraint(equalTo: weightView.topAnchor, constant: 10)
        ])
        
        weightValueLabel.text = "74"
        weightValueLabel.textColor = .white
        weightValueLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        weightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        weightView.addSubview(weightValueLabel)
        
        NSLayoutConstraint.activate([
            weightValueLabel.centerXAnchor.constraint(equalTo: weightView.centerXAnchor),
            weightValueLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5)
        ])
        
        let decreaseWeightButton = UIButton()
        decreaseWeightButton.setTitle("−", for: .normal)
        decreaseWeightButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        decreaseWeightButton.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 49/255, alpha: 1.0)
        decreaseWeightButton.layer.cornerRadius = 25
        decreaseWeightButton.translatesAutoresizingMaskIntoConstraints = false
        weightView.addSubview(decreaseWeightButton)
        
        let increaseWeightButton = UIButton()
        increaseWeightButton.setTitle("+", for: .normal)
        increaseWeightButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        increaseWeightButton.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 49/255, alpha: 1.0)
        increaseWeightButton.layer.cornerRadius = 25
        increaseWeightButton.translatesAutoresizingMaskIntoConstraints = false
        weightView.addSubview(increaseWeightButton)
        
        NSLayoutConstraint.activate([
            decreaseWeightButton.leadingAnchor.constraint(equalTo: weightView.leadingAnchor, constant: 20),
            decreaseWeightButton.topAnchor.constraint(equalTo: weightValueLabel.bottomAnchor, constant: 15),
            decreaseWeightButton.widthAnchor.constraint(equalToConstant: 60),
            decreaseWeightButton.heightAnchor.constraint(equalToConstant: 60),
            
            increaseWeightButton.trailingAnchor.constraint(equalTo: weightView.trailingAnchor, constant: -20),
            increaseWeightButton.topAnchor.constraint(equalTo: weightValueLabel.bottomAnchor, constant: 15),
            increaseWeightButton.widthAnchor.constraint(equalToConstant: 60),
            increaseWeightButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let ageLabel = UILabel()
        ageLabel.text = "AGE"
        ageLabel.textColor = .lightGray
        ageLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageView.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: ageView.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: ageView.topAnchor, constant: 10)
        ])
        
        ageValueLabel.text = "19"
        ageValueLabel.textColor = .white
        ageValueLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        ageValueLabel.translatesAutoresizingMaskIntoConstraints = false
        ageView.addSubview(ageValueLabel)
        
        NSLayoutConstraint.activate([
            ageValueLabel.centerXAnchor.constraint(equalTo: ageView.centerXAnchor),
            ageValueLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5)
        ])
        
        let decreaseAgeButton = UIButton()
        decreaseAgeButton.setTitle("−", for: .normal)
        decreaseAgeButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        decreaseAgeButton.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 49/255, alpha: 1.0)
        decreaseAgeButton.layer.cornerRadius = 25
        decreaseAgeButton.translatesAutoresizingMaskIntoConstraints = false
        ageView.addSubview(decreaseAgeButton)
        
        let increaseAgeButton = UIButton()
        increaseAgeButton.setTitle("+", for: .normal)
        increaseAgeButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        increaseAgeButton.backgroundColor = UIColor(red: 29/255, green: 31/255, blue: 49/255, alpha: 1.0)
        increaseAgeButton.layer.cornerRadius = 25
        increaseAgeButton.translatesAutoresizingMaskIntoConstraints = false
        ageView.addSubview(increaseAgeButton)
        
        NSLayoutConstraint.activate([
            decreaseAgeButton.leadingAnchor.constraint(equalTo: ageView.leadingAnchor, constant: 20),
            decreaseAgeButton.topAnchor.constraint(equalTo: ageValueLabel.bottomAnchor, constant: 15),
            decreaseAgeButton.widthAnchor.constraint(equalToConstant: 60),
            decreaseAgeButton.heightAnchor.constraint(equalToConstant: 60),
            
            increaseAgeButton.trailingAnchor.constraint(equalTo: ageView.trailingAnchor, constant: -20),
            increaseAgeButton.topAnchor.constraint(equalTo: ageValueLabel.bottomAnchor, constant: 15),
            increaseAgeButton.widthAnchor.constraint(equalToConstant: 60),
            increaseAgeButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        decreaseWeightButton.addTarget(self, action: #selector(decreaseWeight), for: .touchUpInside)
        increaseWeightButton.addTarget(self, action: #selector(increaseWeight), for: .touchUpInside)
        decreaseAgeButton.addTarget(self, action: #selector(decreaseAge), for: .touchUpInside)
        increaseAgeButton.addTarget(self, action: #selector(increaseAge), for: .touchUpInside)
    }
    
    @objc func decreaseWeight() {
        if let weight = Int(weightValueLabel.text!), weight > 0 {
            weightValueLabel.text = "\(weight - 1)"
        }
    }
    
    @objc func increaseWeight() {
        if let weight = Int(weightValueLabel.text!) {
            weightValueLabel.text = "\(weight + 1)"
        }
    }
    
    @objc func decreaseAge() {
        if let age = Int(ageValueLabel.text!), age > 0 {
            ageValueLabel.text = "\(age - 1)"
        }
    }
    
    @objc func increaseAge() {
        if let age = Int(ageValueLabel.text!) {
            ageValueLabel.text = "\(age + 1)"
        }
    }
    func setupCalculateBMIView() {
        calculateView.backgroundColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1.0) // Màu đỏ
        calculateView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(calculateView)
        
        NSLayoutConstraint.activate([
            calculateView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            calculateView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            calculateView.topAnchor.constraint(equalTo: weightView.bottomAnchor, constant: 20),
            calculateView.topAnchor.constraint(equalTo: ageView.bottomAnchor, constant: 20),
            calculateView.heightAnchor.constraint(equalToConstant: 60),
            calculateView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let calculateButton = UIButton()
        calculateButton.setTitle("CALCULATE YOUR BMI", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        calculateView.addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            calculateButton.centerXAnchor.constraint(equalTo: calculateView.centerXAnchor),
            calculateButton.centerYAnchor.constraint(equalTo: calculateView.centerYAnchor)
        ])
        
        calculateButton.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
    }

    @objc func calculateBMI() {
        
        guard let weightText = weightValueLabel.text, let weight = Double(weightText),
              let heightText = heightValueLabel.text?.replacingOccurrences(of: " cm", with: ""),
              let heightCm = Double(heightText) else {
            return
        }
       
        let heightM = heightCm / 100.0
        let bmi = weight / (heightM * heightM)
        let kqbmiVC = KqbmiViewController()
        kqbmiVC.bmiValue = bmi 
        
        self.navigationController?.pushViewController(kqbmiVC, animated: true)
    }
}

