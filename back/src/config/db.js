import mongoose from "mongoose";

async function connectDb() {
    try {
        await mongoose.connect('mongodb://localhost:27017/linksy');
        console.log(`Connected to DB`);
        
    } catch (error) {
        console.log(`Error Connecting to the DB : ${e}`);
        
    }
}

async function disconnectDb() {
    try {
        await mongoose.disconnect();
        console.log(`Disconnected from DB`);
    } catch (error) {
        console.log(`Error disconnecting to the DB : ${e}`);
    }
}

export default { connectDb, disconnectDb }