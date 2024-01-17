import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import { Modal } from 'react-bootstrap';
import ChartComponent from '../Chart/ChartComponent';
import ApiHelper from '../../../Services/ApiHelper';

export default function ModalComponent({ selectedId, show, pointName, handleClose }) {
  const [chartData, setChartData] = useState([]);

  useEffect(() => {
    ApiHelper(`http://0.0.0.0/api/v1/histories/${selectedId}`).then((result) => {
      setChartData(result);
    });
  }, [selectedId]);

  return (
    <Modal show={show} onHide={handleClose} size="xl">
      <Modal.Header closeButton>
        <Modal.Title>График за сутки для {pointName}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <ChartComponent chartData={chartData} pointName={pointName} />
      </Modal.Body>
    </Modal>
  );
}

ModalComponent.propTypes = {
  selectedId: PropTypes.string.isRequired,
  show: PropTypes.bool.isRequired,
  pointName: PropTypes.string.isRequired,
  handleClose: PropTypes.func.isRequired,
};
