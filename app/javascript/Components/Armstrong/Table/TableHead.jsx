import React from "react";

export default function TableHead({ columns }) {
  return (
    <thead>
      <tr>
        {columns.map(({ label, accessor }) => {
          return <th key={accessor}>{label}</th>;
        })}
      </tr>
    </thead>
  );
}
