const { $where } = require('../model/user.model');
const UserService = require('../services/user.services');
const EtudiantService = require('../services/etudiant.service');


exports.login = async(req,res,next)=>{
    try{
        console.log(req.body);
        let {matricule,motDePasse}=req.body
        // matricule="qwerty11@gmail.com";
        // motDePasse="qwerty11"

        let user = await UserService.checkUser(matricule);
        
        if(!user){
            res.send("User don't match")
            throw new Error("User don't match")
        }
        console.log('///////////////////Q')
        console.log(user);
        return;
        const isMatch = await user.comparePassword(motDePasse);
        if(isMatch == false){
            throw new Error('mot de passe invalide')
        }

        let etudiant = await EtudiantService.getEtudiantData(matricule);  

        console.log(etudiant);
        
        let tokenData = {
            _id:user._id,
            matricule:matricule
        }
        
        const token = await UserService.generateToken(tokenData,"secretKey","1h")
        res.status(200).json({status:true,token:token,message:"connecter avec succée",data:etudiant})

    }catch(err){
        throw err
    }
}