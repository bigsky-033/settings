document.addEventListener('DOMContentLoaded', () => {
  const apiDataElement = document.getElementById('api-data');
  const checkApiButton = document.getElementById('check-api');
  
  // Function to fetch data from API
  const fetchApiData = async () => {
    try {
      apiDataElement.textContent = 'Loading...';
      
      const response = await fetch('/api/test');
      
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      
      const data = await response.json();
      
      // Display formatted JSON
      apiDataElement.textContent = JSON.stringify(data, null, 2);
      
    } catch (error) {
      apiDataElement.textContent = `Error: ${error.message}`;
      console.error('API request failed:', error);
    }
  };
  
  // Attach click event to button
  checkApiButton.addEventListener('click', fetchApiData);
  
  // Fetch data on page load
  fetchApiData();
});
