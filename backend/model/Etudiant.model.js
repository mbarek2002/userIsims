const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const bcrypt = require('bcrypt');

const etudiantSchema = new Schema({
    name:{
        type:String,
        unique:true

    },
    email:{
        type:String,
        unique:true
    },
    password:{
        type:String,

    },
    phone:{
        type:String,
        
    },
},{timestamps:true});

etudiantSchema.pre('save',async function(){
    try {
        var etudiant = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpass  =  await bcrypt.hash(etudiant.password,salt);
        etudiant.password=hashpass;
       
    } catch (error) {
        throw error;
    }
});




const Etudiant = mongoose.model('Etudiant',etudiantSchema);

module.exports = Etudiant;