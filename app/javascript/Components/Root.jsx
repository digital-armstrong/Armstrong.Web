import React from "react";
import ArmsTable from "./Table/ArmsTable";

export default function Root() {

  return (
    <>
      <div className="row">
        <div className="col-2">

        </div>
        <div className="col-10">
          <ArmsTable />
        </div>
      </div>
    </>
  );
}
