import React, { useState } from "react";

export default function Filter({tableData }) {
  const [filter, setFilter] = useState('');

  const filterItems = (filter) => {
    return filter
      ? tableData.filter(i => i.name.includes(filter))
      : tableData
  }

  const items = filterItems(filter);

  const filterHandler = (event) => {
    setFilter(event.target.value)
  };

  return (
    <div className="card shadow rounded p-3">
      <input
        className="form-control"
        type="text"
        placeholder="Поиск..."
        onChange={filterHandler}
      />
    </div>
  );
}
