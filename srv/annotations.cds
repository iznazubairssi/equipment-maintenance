using EquipmentService from './service';

annotate EquipmentService.Equipments with @(
    UI: {
        // List Report - Using your exact field names
        LineItem: [
            { Value: EQUIPMENT, Label: 'Equipment ID' },
            { Value: EQNAME, Label: 'Equipment Name' },
            { Value: EQDESC, Label: 'Description' },
            { Value: EQTYPE_EQTYPE, Label: 'Type' },
            { Value: INACTIVE, Label: 'Inactive' },
            { Value: EQUNR_SAP, Label: 'SAP Equipment' }
        ],
        
        SelectionFields: [ 
            EQUIPMENT, 
            EQNAME, 
            EQTYPE_EQTYPE,
            INACTIVE,
            EQUNR_SAP
        ],
        
        // Object Page
        HeaderInfo: {
            TypeName: 'Equipment',
            TypeNamePlural: 'Equipments',
            Title: { Value: EQNAME },
            Description: { Value: EQUIPMENT }
        },
        
        // Tabs
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'General',
                ID: 'General',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Equipment Data', Target: '@UI.FieldGroup#General' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Status and Network',
                ID: 'StatusNetwork',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Status Creation', Target: '@UI.FieldGroup#Status' },
                    { $Type: 'UI.ReferenceFacet', Label: 'Network', Target: '@UI.FieldGroup#Network' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Alarm',
                ID: 'Alarm',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Alarm Creation', Target: '@UI.FieldGroup#Alarm' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Process Data',
                ID: 'ProcessData',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Process Data Creation', Target: '@UI.FieldGroup#ProcessData' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Links',
                ID: 'Links',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'External Links', Target: '@UI.FieldGroup#Links' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Admin',
                ID: 'Admin',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Administrative Data', Target: '@UI.FieldGroup#Admin' }
                ]
            }
        ],

        FieldGroup#General: {
            Data: [
                { Value: EQUIPMENT, Label: 'Equipment ID' },
                { Value: EQNAME, Label: 'Equipment Name' },
                { Value: EQDESC, Label: 'Description' },
                { Value: EQTYPE_EQTYPE, Label: 'Equipment Type' },
                { Value: EQUNR_SAP, Label: 'SAP Equipment Number' },
                { Value: INACTIVE, Label: 'Inactive' }
            ]
        },
        FieldGroup#Status: {
            Data: [
                { Value: STATUSMANACTIVE, Label: 'Manual Status Creation Active?' },
                { Value: STATUSSTRUCTURE, Label: 'Status Table' },
                { Value: STATUSLOGIC, Label: 'Status Logic Table' }
            ]
        },
        FieldGroup#Network: {
            Data: [
                { Value: OTACTIVE, Label: 'Network Active?' },
                { Value: OTTYPE, Label: 'Daemon Type' },
                { Value: OTDAEMON, Label: 'Daemon ID' }
            ]
        },
        FieldGroup#Alarm: {
            Data: [
                { Value: ALARMMANACTIVE, Label: 'Manual Alarm Creation Active?' },
                { Value: ALARM2STATUS, Label: 'Alarm 2 Status Active?' },
                { Value: ALARMSTRUCTURE, Label: 'Alarm Structure Table' }
            ]
        },
        FieldGroup#ProcessData: {
            Data: [
                { Value: PDATAMANACTIVE, Label: 'Manual Process Data Creation Active?' },
                { Value: PDATASTRUCTURE, Label: 'Process Data Structure' }
            ]
        },
        FieldGroup#Links: {
            Data: [
                { Value: LINKTEXT, Label: 'Link Text' },
                { Value: LINK, Label: 'Link URL' }
            ]
        },
        FieldGroup#Admin: {
            Data: [
                { Value: createdBy, Label: 'Created By' },
                { Value: createdAt, Label: 'Created At' },
                { Value: modifiedBy, Label: 'Changed By' },
                { Value: modifiedAt, Label: 'Changed On' }
            ]
        }
    }
);

//EquipmentTypes
annotate EquipmentService.EquipmentTypes with @(
    UI: {
        LineItem: [
            { Value: EQTYPE, Label: 'Equipment Type' },
            { Value: EQTYPE_DESC, Label: 'Description' },
            { Value: EQTYPE_STATUS_CAPABLE, Label: 'Status Capable' }
        ]
    }
);
