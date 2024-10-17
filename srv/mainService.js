import cds from "@sap/cds";
const students = cds.entities("sap.cap.school");

export const mainService = (srv) => {
  srv.on("READ", "getStudents", async (req) => {
    try {
      let filterData = req.data;

      let data = await SELECT.from("sap_cap_school_students").where(filterData); // .limit(5);

      return data;
    } catch (error) {
      console.error("ERROR" + error);
      throw error;
    }
  });

  // srv.after("READ", "getStudents", data => {
  //     console.log("Run!")
  //     return data.map(d => { console.log(d) })
  // });

  srv.on("CREATE", "updateStudents", async (req, res) => {
    let firstName = req.data.first_name;
    let email = req.data.email;

    let result = await cds
      .transaction(req)
      .run(
        UPDATE("sap_cap_school_students")
          .set({ first_name: firstName })
          .where({ email: email })
      )
      .then((resolve, reject) => {
        if (typeof resolve !== "undefined" && resolve >= 1) {
          return req.data;
        }

        console.log("Not found!");
        return null;
      })
      .catch((err) => {
        console.log("Error" + err);
        return err;
      });

      console.log(result);
      return result;
  });
};
