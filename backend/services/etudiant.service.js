const EtudiantModel = require('../model/Etudiant.model')


class EtudiantService{

    static async getEtudiantData(matricule){
        try {
            return await EtudiantModel.findOne({email:matricule});
        } catch (error) {
            throw error;
        }
    }
}

module.exports = EtudiantService;