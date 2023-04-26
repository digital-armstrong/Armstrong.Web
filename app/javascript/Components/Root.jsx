import React from "react";
import Table from "./Table/Table";
import Filter from "./Filter/Filter";

export default function Root() {

  return (
    <>
      <div className="row">
        <div className="col-2">
          <Filter />
        </div>
        <div className="col-10 shadow rounded">
          <Table />
        </div>
      </div>
    </>
  );
}
