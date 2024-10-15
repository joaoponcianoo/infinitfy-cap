import cds from "@sap/cds";

export const mainService = (srv) => {
    
    srv.on("READ", "Students", async req => {
        try {
            // const students = cds.entities("sap.cap.school");
            let filterData = req.data;

            let data = await SELECT.from("sap_cap_school_students").where(filterData).limit(5)

            return data;
            
        } catch(error) {
            console.error("ERROR" + error);
            throw error;
        };
    }); 
};