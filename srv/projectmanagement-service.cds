using { my.projectmanagement as db } from '../db/data-model';

service ProjectManagementService {

    entity Projects as projection on db.Projects {
        *, (select count(*) as tasksCount from db.Tasks as t where t.project.ID = Projects.ID) as tasksCount: Integer
    } actions {
        @(
        cds.odata.bindingparameter.name : '_it',
        Common.SideEffects              : {
            TargetProperties : ['_it/status', '_it/criticality']
        }
    )
        action complete();
    };

    entity Tasks as projection on db.Tasks;
    entity Users as projection on db.Users;


}