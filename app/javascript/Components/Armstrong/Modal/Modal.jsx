import React, { useState } from 'react';
import PropTypes from 'prop-types';

export default function Modal({ closeModal, onConfirm }) {
  const [firstDateTime, setFirstDateTime] = useState('');
  const [secondDateTime, setSecondDateTime] = useState('');

  const handleChangeFirstDatetime = (event) => {
    setFirstDateTime(event.target.value);
  };

  const handleChangeSecondDatetime = (event) => {
    setSecondDateTime(event.target.value);
  };

  const handleConfirm = () => {
    onConfirm();
  };

  return (
    <div
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        zIndex: 1000,
      }}
    >
      <div
        style={{
          position: 'fixed',
          top: '50%',
          left: '50%',
          transform: 'translate(-50%, -50%)',
          backgroundColor: 'white',
          padding: '1em',
          zIndex: 1000,
        }}
        className="rounded"
      >
        <div className="mx-3">
          <div className="row mb-3">
            <div className="col-2" />
            <div className="col-8 text-center">
              <h3 className="text-lg leading-6 font-medium text-gray-900">Select date interval:</h3>
            </div>
            <div className="col-2 pe-0 d-flex justify-content-end">
              <button type="button" className="btn btn-light rounded" onClick={closeModal}>
                <i className="bi bi-x-square" />
              </button>
            </div>
          </div>
          <div className="row my-4">
            <div className="col ps-0 d-flex justify-content-start">
              <input type="datetime-local" value={firstDateTime} onChange={handleChangeFirstDatetime} />
            </div>
            <div className="col pe-0 d-flex justify-content-end">
              <input type="datetime-local" value={secondDateTime} onChange={handleChangeSecondDatetime} />
            </div>
          </div>
          <div className="row my-4">
            <button type="button" className="btn btn-primary rounded w-100" onClick={handleConfirm}>
              <span className="pe-3">
                <i className="bi bi-graph-up" />
              </span>
              <span>Построить график</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

Modal.propTypes = {
  closeModal: PropTypes.func.isRequired,
  onConfirm: PropTypes.func.isRequired,
};
