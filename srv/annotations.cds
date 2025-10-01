using EquipmentService from './service';

// Annotations for the List Report page (the initial search and results screen)
annotate EquipmentService.Equipments with @(
    UI: {
        // Defines the columns in the results table [cite: 392]
        LineItem: [
            { Value: EQUIPMENT, Label: 'Equipment ID' },
            { Value: EQNAME, Label: 'Name' },
            { Value: EQDESC, Label: 'Description' },
            { Value: EQTYPE_EQTYPE, Label: 'Type' },
            { Value: INACTIVE, Label: 'Inactive' }
        ],
        // Defines the search fields on the filter bar [cite: 264]
        SelectionFields: [ EQUIPMENT, EQNAME, EQTYPE_EQTYPE ]
    }
);

// Annotations for the Object Page (the detailed maintenance screen)
annotate EquipmentService.Equipments with @(
    UI: {
        // Defines the header of the page
        HeaderInfo: {
            TypeName: 'Equipment',
            TypeNamePlural: 'Equipments',
            Title: { Value: EQNAME },
            Description: { Value: EQUIPMENT }
        },
        // Defines the sections/tabs on the page [cite: 286-292]
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'General',
                ID: 'General',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'General Data', Target: '@UI.FieldGroup#General' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Status and Network',
                ID: 'StatusNetwork',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Status', Target: '@UI.FieldGroup#Status' },
                    { $Type: 'UI.ReferenceFacet', Label: 'Link', Target: '@UI.FieldGroup#Link' }
                ]
            },
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Admin',
                ID: 'Admin',
                Facets: [
                    { $Type: 'UI.ReferenceFacet', Label: 'Admin Data', Target: '@UI.FieldGroup#Admin' }
                ]
            }
        ],
        // Groups fields together for display in the sections defined above
        FieldGroup#General: {
            Data: [
                { Value: EQUIPMENT },
                { Value: EQNAME },
                { Value: EQDESC },
                { Value: EQTYPE_EQTYPE, Label: 'Equipment Type' },
                { Value: EQUNR_SAP, Label: 'SAP Equipment Number' }
            ]
        },
        FieldGroup#Status: {
            Data: [
                { Value: STATUSMANACTIVE, Label: 'Manual Status Creation Active?' },
                { Value: STATUSSTRUCTURE, Label: 'Status Table' },
                { Value: STATUSLOGIC, Label: 'Status Logic Table' }
            ]
        },
        FieldGroup#Link: {
            Data: [
                { Value: LINKTEXT },
                { Value: LINK }
            ]
        },
        FieldGroup#Admin: {
            Data: [
                { Value: createdBy },
                { Value: createdAt },
                { Value: modifiedBy },
                { Value: modifiedAt }
            ]
        }
    }
);
