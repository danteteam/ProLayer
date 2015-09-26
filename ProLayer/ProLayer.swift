//
//  Builder.swift
//  GuessPointApp
//
//  Created by Ivan Brazhnikov on 19.08.15.
//  Copyright (c) 2015 Ivan Brazhnikov. All rights reserved.
//

import UIKit


public func Layer(layer: CALayer) -> ProLayer {
    return ProLayer(layer)
}

public func Layer(view: UIView) -> ProLayer {
    return ProLayer(view.layer)
}

public class ProLayer {
    let layer: CALayer
    
    init(_ layer: CALayer) {
        self.layer = layer
    }
    
    public func radius(value: CGFloat) -> Self {
        layer.cornerRadius = value
        return self
    }
    
    
    public func shadow() -> Shadow {
        return Shadow(buider: self)
    }
    
    public func border() -> Border {
        return Border(buider: self)
    } 
    
    
    public class Border {
        private let parent: ProLayer
        private var layer: CALayer { return parent.layer }
        
        init(buider: ProLayer) {
            self.parent = buider
        }
        
        public func color(value: UIColor) -> Self {
            layer.borderColor = value.CGColor
            return self
        }
        
        public func width(value: CGFloat) -> Self {
            layer.borderWidth = value
            return self
        }
        
       public func done() -> ProLayer {
            return parent
        }
    }
    
    public class Shadow {
        private let parent: ProLayer
        private var layer: CALayer { return parent.layer }
        init(buider: ProLayer) {
            self.parent = buider
        }
        
        public func color(value: UIColor) -> Self {
            layer.shadowColor = value.CGColor
            return self
        }
        public func radius(value: CGFloat) -> Self {
            layer.shadowRadius = value
            return self
        }
        public func opacity(value: Float) -> Self {
            layer.shadowOpacity = value
            return self
        }
        public func offset(value: CGSize) -> Self {
            layer.shadowOffset = value
            return self
        }
      public func path(value: CGPath) -> Self {
            layer.shadowPath = value
            return self
        }
        
        public func done() -> ProLayer {
            return parent
        }
        
        
    }
    
    
}