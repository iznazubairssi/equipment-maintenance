const cds = require('@sap/cds');

async function deploy() {
    try {
        console.log('🚀 Starting deployment...');
        
        // Clean any existing database
        const fs = require('fs');
        if (fs.existsSync('db.sqlite')) {
            fs.unlinkSync('db.sqlite');
            console.log('🗑️  Removed existing database');
        }
        
        // Connect to SQLite
        const db = await cds.connect.to('db');
        console.log('✅ Connected to database');
        
        // Deploy ONLY the schema (no data)
        await cds.deploy('./db/schema').to(db);
        console.log('✅ Database schema deployed successfully');
        
        // Manually insert data without managed timestamps
        const { Equipments, EquipmentTypes } = db.entities('d4iot');
        
        console.log('📥 Inserting EquipmentTypes...');
        await INSERT.into(EquipmentTypes).entries([
            { EQTYPE: 'MA', EQTYPE_DESC: 'MASCHINE', EQTYPE_HIERARCHY_CAPABLE: false, EQTYPE_STATUS_CAPABLE: true },
            { EQTYPE: 'MG', EQTYPE_DESC: 'MASCHINENGRUPPE', EQTYPE_HIERARCHY_CAPABLE: true, EQTYPE_STATUS_CAPABLE: true }
        ]);
        
        console.log('📥 Inserting Equipments...');
        await INSERT.into(Equipments).entries([
            {
                EQUIPMENT: 'BA0001',
                EQNAME: 'FEEDER 01',
                EQDESC: 'Becherzuführung Linie 1',
                EQUNR_SAP: '10000011',
                STATUSMANACTIVE: true,
                STATUSSTRUCTURE: '24IOTTEST',
                PDATAMANACTIVE: false,
                LINK: 'http://example.com',
                LINKTEXT: 'Machine Portal',
                EQTYPE_EQTYPE: 'MA'
            },
            {
                EQUIPMENT: 'B70001',
                EQNAME: 'FILLER 01', 
                EQDESC: 'Behälterfüllung Linie 1',
                EQUNR_SAP: '10000012',
                STATUSMANACTIVE: true,
                STATUSSTRUCTURE: '24IOTTEST',
                PDATAMANACTIVE: false,
                LINK: 'http://example.com',
                LINKTEXT: 'Machine Portal',
                EQTYPE_EQTYPE: 'MA'
            }
        ]);
        
        console.log('✅ All data inserted successfully');
        console.log('🎉 Deployment completed! You can now run: cds watch');
        
    } catch (error) {
        console.error('❌ Deployment failed:', error.message);
    }
}

deploy();
