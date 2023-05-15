import React from "react";

export default function Filter({ filter, onFilterChange }) {
  return (
    <div className="card shadow rounded p-3">
      <input
        className="form-control"
        type="text"
        placeholder="Поиск..."
        value={filter}
        onChange={onFilterChange}
      />
    </div>
  );
}
