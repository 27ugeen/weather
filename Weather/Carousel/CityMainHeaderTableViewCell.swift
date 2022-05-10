//
//  CityMainHeaderTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 9/5/2022.
//

import UIKit

class CityMainHeaderTableViewCell: UITableViewCell {
//MARK: - props
    
    static let cellId = "CityMainHeaderTableViewCell"
//MARK: - subviews
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    private let dailyTempLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "7°/13°"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let presentTempLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(36)
        label.text = "13°"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let weatherDescriptLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "It is raining today"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let cloudinessLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "0"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let windSpeedLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "3 m/s"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let humidityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "75%"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let currentDateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "\(Date())"
        label.textColor = UIColor(rgb: 0xF6DD01)
        return label
    }()
    
    private let sunriseLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(14)
        label.text = "5:41"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let sunsetLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(14)
        label.text = "19:31"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let sunriseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sunrise")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xF6DD01)
        return imageView
    }()
    
    private let sunsetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sunset")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xF6DD01)
        return imageView
    }()
    
    private let cloudinessImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudiness")
        return imageView
    }()
    
    private let windSpeedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "windSpeed")
        return imageView
    }()
    
    private let humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "humidity")
        return imageView
    }()
    
//    private let circleLayer: CAShapeLayer = {
//       let circle = CAShapeLayer()
//        circle.path = UIBezierPath(arcCenter: CGPoint(x: 172, y: 70), radius: 125, startAngle: 33, endAngle: 311, clockwise: true).cgPath
//        circle.strokeColor = UIColor(rgb: 0xF6DD01).cgColor
////        circle.fillColor = UIColor(rgb: 0xF6DD01).cgColor
//        return circle
//    }()
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let startPoint = CGPoint(x: 33, y: 70)
        
        let semicircle = UIBezierPath()
        semicircle.move(to: startPoint)
        semicircle.addCurve(to: CGPoint(x: 311, y: 33), controlPoint1: CGPoint(x: 172, y: 195), controlPoint2: CGPoint(x: 311, y: 33))
        
        UIColor(rgb: 0xF6DD01).setStroke()
        
        semicircle.lineWidth = 4
        semicircle.stroke()
    }
}
//MARK: - setupViews

extension CityMainHeaderTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(headerView)
        
        headerView.addSubview(dailyTempLabel)
        headerView.addSubview(presentTempLabel)
        headerView.addSubview(weatherDescriptLabel)
        headerView.addSubview(cloudinessLabel)
        headerView.addSubview(cloudinessImageView)
        headerView.addSubview(windSpeedLabel)
        headerView.addSubview(windSpeedImageView)
        headerView.addSubview(humidityLabel)
        headerView.addSubview(humidityImageView)
        headerView.addSubview(sunriseLabel)
        headerView.addSubview(sunriseImageView)
        headerView.addSubview(sunsetLabel)
        headerView.addSubview(sunsetImageView)
        headerView.addSubview(currentDateLabel)
//        headerView.layer.addSublayer(circleLayer)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            headerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 212),
            
            dailyTempLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 33),
            dailyTempLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            dailyTempLabel.heightAnchor.constraint(equalToConstant: 20),
            
            presentTempLabel.topAnchor.constraint(equalTo: dailyTempLabel.bottomAnchor, constant: 5),
            presentTempLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            presentTempLabel.heightAnchor.constraint(equalToConstant: 40),
            
            weatherDescriptLabel.topAnchor.constraint(equalTo: presentTempLabel.bottomAnchor, constant: 5),
            weatherDescriptLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            weatherDescriptLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currentDateLabel.topAnchor.constraint(equalTo: weatherDescriptLabel.bottomAnchor,constant: 48),
            currentDateLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            sunriseLabel.topAnchor.constraint(equalTo: weatherDescriptLabel.bottomAnchor, constant: 44),
            sunriseLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            sunriseLabel.heightAnchor.constraint(equalToConstant: 19),
            
            sunsetLabel.topAnchor.constraint(equalTo: weatherDescriptLabel.bottomAnchor, constant: 44),
            sunsetLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            sunsetLabel.heightAnchor.constraint(equalToConstant: 19),
            
            sunriseImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 25),
            sunriseImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor,constant: -5),
            sunriseImageView.heightAnchor.constraint(equalToConstant: 17),
            sunriseImageView.widthAnchor.constraint(equalToConstant: 17),
            
            sunsetImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -25),
            sunsetImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor,constant: -5),
            sunsetImageView.heightAnchor.constraint(equalToConstant: 17),
            sunsetImageView.widthAnchor.constraint(equalToConstant: 17),
            
            cloudinessImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 77),
            cloudinessImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            cloudinessImageView.heightAnchor.constraint(equalToConstant: 18),
            cloudinessImageView.widthAnchor.constraint(equalToConstant: 21),
            
            cloudinessLabel.leadingAnchor.constraint(equalTo: cloudinessImageView.trailingAnchor, constant: 5),
            cloudinessLabel.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            cloudinessLabel.heightAnchor.constraint(equalToConstant: 18),
            
            windSpeedLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 5),
            windSpeedLabel.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: 18),
            
            windSpeedImageView.trailingAnchor.constraint(equalTo: windSpeedLabel.leadingAnchor, constant: -5),
            windSpeedImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            windSpeedImageView.heightAnchor.constraint(equalToConstant: 18),
            windSpeedImageView.widthAnchor.constraint(equalToConstant: 25),
            
            humidityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -83),
            humidityLabel.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            humidityLabel.heightAnchor.constraint(equalToConstant: 18),
            
            humidityImageView.trailingAnchor.constraint(equalTo: humidityLabel.leadingAnchor, constant: -5),
            humidityImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            humidityImageView.heightAnchor.constraint(equalToConstant: 18),
            humidityImageView.widthAnchor.constraint(equalToConstant: 13)
            
            
            
        ])
    }
}






class ArcsView: UIView {
    
    struct Arc {
        var color: UIColor
        var angle: CGFloat
    }

    override func draw(_ rect: CGRect) {
        
        let arcsCount = 5
        let arcsWidth: CGFloat = 40.0
        let spaceWidth: CGFloat = 10.0
        
        let innerArcRadius = rect.width / 2.0 - arcsWidth
        let outerArcRadius = rect.width / 2.0
        
        // определяем расстояния (углы) между секторами по формуле треугольника, зная длины всех сторон
        
        let innerSpaceAngle = acos((pow(innerArcRadius, 2) + pow(innerArcRadius, 2) - pow(spaceWidth, 2)) / (2 * innerArcRadius * innerArcRadius))
        let outerSpaceAngle = acos((pow(outerArcRadius, 2) + pow(outerArcRadius, 2) - pow(spaceWidth, 2)) / (2 * outerArcRadius * outerArcRadius))
        let arcsAngle = CGFloat.pi * 2 / CGFloat(arcsCount)
        
        // заполняем массив для примера
        
        let arcs = [
            Arc(color: .red, angle: arcsAngle),
            Arc(color: .orange, angle: arcsAngle),
            Arc(color: .yellow, angle: arcsAngle),
            Arc(color: .green, angle: arcsAngle),
            Arc(color: .blue, angle: arcsAngle)
        ]
        
        // поворачиваем сектора для симметрии
        
        var angle: CGFloat = -arcsAngle / 4
        
        arcs.forEach {
            
            // добавляем дуги, которые сами соединяются линией и затем замыкаем контур
            
            let path = UIBezierPath()
            path.lineWidth = 2

            path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY),
                        radius: innerArcRadius,
                        startAngle: angle + innerSpaceAngle / 2,
                        endAngle: angle + $0.angle - innerSpaceAngle / 2,
                        clockwise: true)

            path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY),
                        radius: outerArcRadius,
                        startAngle: angle + $0.angle - outerSpaceAngle / 2,
                        endAngle: angle + outerSpaceAngle / 2,
                        clockwise: false)

            path.close()

            $0.color.setFill()
            path.fill()

            angle += $0.angle
        }
    
    }

}
