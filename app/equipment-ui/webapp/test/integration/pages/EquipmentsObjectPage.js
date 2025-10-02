sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'd4iot.equipmentui',
            componentId: 'EquipmentsObjectPage',
            contextPath: '/Equipments'
        },
        CustomPageDefinitions
    );
});