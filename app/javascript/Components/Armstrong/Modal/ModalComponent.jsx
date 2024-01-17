import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import { Modal } from 'react-bootstrap';
import ChartComponent from '../Chart/ChartComponent';
import ApiHelper from '../../../Services/ApiHelper';

export default function ModalComponent({ selectedId, show, handleClose }) {
  const [chartData, setChartData] = useState([]);

  useEffect(() => {
    ApiHelper(`api/v1/armstrong?history_selected_id=${selectedId}`).then((result) => {
      setChartData(result);
    });
  }, [selectedId]);

  return (
    // Заглушка
    <Modal show={show} onHide={handleClose} size="xl">
      <Modal.Header closeButton>
        <Modal.Title>График за сутки</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <p>Заглушка под компонент графика. График пока еще не готов.</p>
      </Modal.Body>
    </Modal>
    // Заглушка

    // <Modal show={show} onHide={handleClose} size="xl">
    //   <Modal.Header closeButton>
    //     <Modal.Title>График за сутки</Modal.Title>
    //   </Modal.Header>
    //   <Modal.Body>
    //     <ChartComponent chartData={chartData} pointName="test" />
    //   </Modal.Body>
    // </Modal>
  );
}

ModalComponent.propTypes = {
  selectedId: PropTypes.string.isRequired,
  show: PropTypes.bool.isRequired,
  handleClose: PropTypes.func.isRequired,
};
