using { D4iot } from '../db/schema';

service EquipmentService {
    entity Equipments     as projection on D4iot.Equipments;
    entity EquipmentTypes as projection on D4iot.EquipmentTypes;
}
