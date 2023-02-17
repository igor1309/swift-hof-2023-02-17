private func bind(_ selector: OptionSelectorView.ViewModel?) {
    
    selector?.action
        .compactMap { $0 as? OptionSelectorAction.OptionDidSelected }
        .map(\.optionId)
        .compactMap(ProductType.init(rawValue:))
        .compactMap { [unowned self] productType in
            
            self.groups.first(where: { $0.productType == productType })
        }
        .map(\.id)
        .receive(on: DispatchQueue.main)
        .sink { [unowned self] id in
            
            self.action.send(CarouselScrollToGroup(groupId: id))
        }
        .store(in: &bindings)
}
