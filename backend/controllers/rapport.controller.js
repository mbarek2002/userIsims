
const rapportModel = require('../model/Rapport.model');



exports.addRapport = async(req,res,next)=>{
    try {
        console.log(req.body)

        let rapport = new  rapportModel({
            id : req.body.id,
            rapportType:req.body.rapportType,
            rapportContent:req.body.rapportContent,
            seen:req.body.seen,
            rapportStatus:req.body.rapportStatus
        })

        console.log(rapport);

        rapport.save().then(response=>{
            res.json({
                status:true,
                message:"reclamation ajouté avec succée",
        })
        }).catch(err=>{
            res.json({
                status: false,
                message: "An error occurred. No data saved in either table."
            });  
            throw err
        })
       
    }catch(e){
        console.log(e)
    }

},


exports.getRapports = async (req,res,next)=>{
    try{
        console.log(req.body.id);
        let rapportList = await rapportModel.find({id:req.body.id});

        console.log(rapportList);

        res.json({status:true,success:rapportList});

    }catch(err){
        throw err
    }
}