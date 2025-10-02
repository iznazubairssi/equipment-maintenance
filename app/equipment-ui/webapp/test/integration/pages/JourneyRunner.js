sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"d4iot/equipmentui/test/integration/pages/EquipmentsList",
	"d4iot/equipmentui/test/integration/pages/EquipmentsObjectPage"
], function (JourneyRunner, EquipmentsList, EquipmentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('d4iot/equipmentui') + '/test/flp.html#app-preview',
        pages: {
			onTheEquipmentsList: EquipmentsList,
			onTheEquipmentsObjectPage: EquipmentsObjectPage
        },
        async: true
    });

    return runner;
});

