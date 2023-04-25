import React, { useMemo, useState, useEffect } from "react";
import ky from "ky";
import Table from "./Table";

export default function ArmsTable() {
  const [data, setData] = useState({});

  async function getAllTodos() {
    let result = await ky
      .get("/api/v1/armstrong")
      .json();
    setData(result);
  }

  useEffect(() => {
    const interval = setInterval(() => {
      getAllTodos();
    }, 10000);
    return () => clearInterval(interval);
  }, []);

  return <>{data.length > 0 && <Table channels={data} />}</>;
}
