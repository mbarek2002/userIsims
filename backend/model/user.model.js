const mongoose  = require('mongoose')
const db = require('../config/db')
const bcrypt = require('bcrypt');


const {Schema}  = mongoose;

const userSchema = new Schema({
    matricule:{
        type:String,
        lowercase:true,
        require:true,
        unique:true
    },
    motDePasse:{
        type:String,
        require:true
    },
})

// userSchema.pre('save',async function(){
//     try{
//         var user = this;
//         user.motDePasse = 
//     }catch(err){

//     }
// })

userSchema.methods.comparePassword = async function(motDePasseUser){
    try {
        const isMatch  =  await bcrypt.compare(motDePasseUser,this.motDePasse)
        return isMatch;
    } catch (error) {
        throw error
    }
}

const userModel = db.model('user',userSchema);

module.exports = userModel;