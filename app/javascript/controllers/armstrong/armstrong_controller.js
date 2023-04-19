import { Controller } from "@hotwired/stimulus"
import React from "react"
import { createRoot } from 'react-dom/client'
import ArmsTable from "../../Components/Table/ArmsTable";

export default class extends Controller {
  connect() {
    const app = document.getElementById("app");
    const root = createRoot(app)
    root.render(<ArmsTable />)
  }
}
