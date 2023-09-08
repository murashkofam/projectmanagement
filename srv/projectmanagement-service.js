const cds = require('@sap/cds');

class ProjectManagementService extends cds.ApplicationService {
    init() {

        const { Projects, Tasks } = this.entities

        this.on('complete', async ({params:[project]})=> {

            await UPDATE(Projects)
            .where({
                ID: project.ID
            }).with({
                status_code: 'COMPLETED'
            });
            return UPDATE(Tasks)
                .where({
                    project_ID: project.ID
                }).with({
                    status_code: 'COMPLETED' 
                })

        })

        this.before('CREATE', Projects, req => {
            const project = req.data;
            if (project.status_code === 'COMPLETED') {
                req.reject(403, 'Creating project in status Completed is not allowed!');
            }
        })

        super.init()
    }
}
module.exports = ProjectManagementService