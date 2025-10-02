sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'd4iot.equipmentui',
            componentId: 'EquipmentsList',
            contextPath: '/Equipments'
        },
        CustomPageDefinitions
    );
});