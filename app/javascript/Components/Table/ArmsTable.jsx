import React, { useMemo, useState, useEffect } from "react";
import ky from "ky";
import Table from "./Table";

export default function ArmsTable() {
  const [data, setData] = useState({});
  async function getAllTodos() {
    let result = await ky
      .get("https://jsonplaceholder.typicode.com/todos/")
      .json();
    setData(result);
  }
  useEffect(() => {
    getAllTodos();
  }, []);

  return <>{data.length > 0 && <Table channels={data} />}</>;
}
