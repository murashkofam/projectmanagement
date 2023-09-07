const cds = require('@sap/cds');

class ProjectManagementService extends cds.ApplicationService {
    init() {

        const { Projects, Tasks } = this.entities

        this.on('complete', async ({params:[project]})=> {

            await UPDATE(Projects)
            .where({
                ID: project.ID
            }).with({
                status: 'COMPLETED'
            });
            return UPDATE(Tasks)
                .where({
                    project_ID: project.ID
                }).with({
                    status: 'COMPLETED' 
                })

        })

        this.before('CREATE', Projects, req => {
            const project = req.data;
            if (project.status === 'COMPLETED') {
                req.reject(403, 'Creating project in status Completed is not allowed!');
            }
        })

        this.after('READ', [Projects, Tasks], entities => {
            if (Array.isArray(entities)) {
                entities.forEach(entity => {
                  setCriticality(entity);
                });
              } else {
                setCriticality(entities);
              }
        })

        function setCriticality(entity) {
            switch(entity.status) {
                case 'PLANNED':
                    entity.criticality = 5;
                    break;
                case 'IN_PROGRESS':
                    entity.criticality = 2;
                    break;
                case 'COMPLETED':
                    entity.criticality = 3;
                    break;
                default:
                    entity.criticality = 2;
                    break;
            }
        }



        super.init()
    }
}
module.exports = ProjectManagementService