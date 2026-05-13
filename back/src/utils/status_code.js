export default class StatusCode {
    checkStatusCode(res, code) {
        let responseMsg;
        switch (code) {
            case 200:
                responseMsg = "Data Fetched Successfully";
                break;
            case 400:
                responseMsg = "Request Not Valid";
                break;
            default:
                responseMsg = "Unknown Status";
                break;
        }
        res.status(code).json({ code: code, message: responseMsg });
    }
}