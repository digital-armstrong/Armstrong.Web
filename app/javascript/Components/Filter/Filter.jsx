import React, { useState } from "react";

export default function Filter() {
  const [searchTerm, setSearchTerm] = useState('');

  const handleChange = (e) => {
    setSearchTerm(e.target.value);
  };

  return (
    <div class="accordion mb-3" id="accordionFilter">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingFilter">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFilter" aria-expanded="true" aria-controls="collapseFilter">
            Фильтрация
          </button>
        </h2>
        <div id="collapseFilter" class="accordion-collapse collapse shadow" aria-labelledby="headingFilter" data-bs-parent="#accordionFilter">
        <form className="rounded accordion-body">
          <input type="text"
                 className="form-control my-2"
                 placeholder="Точка контроля..."
                 value={searchTerm}
                 onChange={handleChange} />
          <button type="submit" className="btn btn-primary w-100">Найти</button>
        </form>
        </div>
      </div>
    </div>
  )
}
