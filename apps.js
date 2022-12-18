async function fetchApps() {
  // Fetch the list of apps from the Cloud Foundry API
  const response = await fetch('/v2/apps');
  const apps = await response.json();

  // Add a row to the table for each app
  const tableBody = document.getElementById('apps-table-body');
  for (const app of apps.resources) {
    const row = document.createElement('tr');
    const nameCell = document.createElement('td');
    nameCell.textContent = app.entity.name;
    row.appendChild(nameCell);
    const statusCell = document.createElement('td');
    statusCell.textContent = app.entity.state;
    row.appendChild(statusCell);
    tableBody.appendChild(row);
  }
}

fetchApps();
