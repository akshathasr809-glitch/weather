const apiKey = "22d241b72f730352534fe4ba04b5ffa2";

async function getWeather() {
    const city = document.getElementById("city").value.trim();
    const result = document.getElementById("weatherResult");

    if (city === "") {
        result.innerHTML = "<p>Please enter a city name.</p>";
        return;
    }

    const url = `https://api.openweathermap.org/data/2.5/weather?q=${encodeURIComponent(city)}&appid=${apiKey}&units=metric`;

    try {
        const response = await fetch(url);
        const data = await response.json();

        if (!response.ok) {
            result.innerHTML = "<p>City not found. Please try another city.</p>";
            return;
        }

        result.innerHTML = `
            <h2>${data.name}</h2>
            <p>🌡️ Temperature: ${data.main.temp} °C</p>
            <p>💧 Humidity: ${data.main.humidity}%</p>
            <p>☁️ Condition: ${data.weather[0].description}</p>
        `;

    } catch (error) {
        result.innerHTML = "<p>Unable to fetch weather data.</p>";
    }
}
