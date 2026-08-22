<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Weather App</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #4facfe, #00f2fe);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }

    .weather-app {
      background: white;
      padding: 30px;
      border-radius: 15px;
      text-align: center;
      width: 300px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    input {
      width: 90%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 8px;
      margin-bottom: 10px;
    }

    button {
      padding: 10px 20px;
      border: none;
      border-radius: 8px;
      background: #2196f3;
      color: white;
      cursor: pointer;
    }

    button:hover {
      background: #1976d2;
    }

    #weather {
      margin-top: 20px;
    }

    .temperature {
      font-size: 40px;
      font-weight: bold;
    }
  </style>
</head>

<body>

  <div class="weather-app">
    <h1>Weather App</h1>

    <input
      type="text"
      id="city"
      placeholder="Enter city name"
    >

    <button onclick="getWeather()">Search</button>

    <div id="weather"></div>
  </div>

  <script>
    const API_KEY = "YOUR_API_KEY";

    async function getWeather() {
      const city = document.getElementById("city").value;
      const weatherDiv = document.getElementById("weather");

      if (!city) {
        weatherDiv.innerHTML = "<p>Please enter a city.</p>";
        return;
      }

      try {
        const response = await fetch(
          `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric`
        );

        if (!response.ok) {
          throw new Error("City not found");
        }

        const data = await response.json();

        weatherDiv.innerHTML = `
          <h2>${data.name}, ${data.sys.country}</h2>
          <div class="temperature">${Math.round(data.main.temp)}°C</div>
          <p>${data.weather[0].description}</p>
          <p>Humidity: ${data.main.humidity}%</p>
          <p>Wind: ${data.wind.speed} m/s</p>
        `;

      } catch (error) {
        weatherDiv.innerHTML = `<p>${error.message}</p>`;
      }
    }
  </script>

</body>
</html>
