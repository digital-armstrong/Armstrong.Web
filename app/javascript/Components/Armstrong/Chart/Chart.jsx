import React from 'react';
import PropTypes from 'prop-types';

export default function Chart({ closeModal, openChart }) {
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
          top: '5%',
          left: '5%',
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
        </div>
      </div>
    </div>
  );
}

Chart.propTypes = {
  closeModal: PropTypes.func.isRequired,
  openChart: PropTypes.func.isRequired,
};
