import React from 'react';
import PropTypes from 'prop-types';

export default function TableBody({ columns, data, openModal }) {
  const chartButton = (
    <td>
      <button type="button" onClick={openModal} className="btn btn-light">
        <i className="bi bi-graph-up" />
      </button>
    </td>
  );

  return (
    <tbody>
      {data.map((row) => (
        <tr key={row.id}>
          {columns.map(({ accessor }) => {
            let tData = row[accessor] ? row[accessor] : '——';
            if (accessor === 'chart') {
              tData = chartButton;
            }
            return <td key={accessor}>{tData}</td>;
          })}
        </tr>
      ))}
    </tbody>
  );
}

TableBody.propTypes = {
  columns: PropTypes.arrayOf(
    PropTypes.shape({
      label: PropTypes.string,
      accessor: PropTypes.string,
    }),
  ).isRequired,
  data: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      serverId: PropTypes.number,
      channelId: PropTypes.number,
      name: PropTypes.string,
      deviceModel: PropTypes.string,
      location: PropTypes.string,
      locationDescription: PropTypes.string,
      eventSystemValue: PropTypes.string,
      eventNotSystemValue: PropTypes.string,
      eventDatetime: PropTypes.string,
      eventCount: PropTypes.number,
      eventImpulseValue: PropTypes.string,
    }),
  ).isRequired,
  openModal: PropTypes.func.isRequired,
};
