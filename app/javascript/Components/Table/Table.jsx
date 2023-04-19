import React from "react";

export default function Table({ channels }) {
  console.log(channels);
  return (
    <table className="table">
      <thead>
        <tr>
          <th>Id</th>
          <th>Title</th>
        </tr>
      </thead>
      <tbody>
        {channels.map((channel) => (
          <tr key={channel.id}>
            <td>{channel.id}</td>
            <td>{channel.title}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}
