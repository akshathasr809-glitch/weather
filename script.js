const apiKey = " 13a63b07154968c2b4229ef59e397196";

async function getWeather() {
    const city = document.getElementById("city").value;
    const result = document.getElementById("weatherResult");

    if (city === "") {
        result.innerHTML = "<p>Please enter a city name.</p>";
        return;
    }

    const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

    try {
        const response = await fetch(url);
        const data = await response.json();

        if (data.cod !== 200) {
            result.innerHTML = "<p>City not found.</p>";
            return;
        }

        result.innerHTML = `
            <h2>${data.name}</h2>
            <p>🌡️ Temperature: ${data.main.temp} °C</p>
            <p>💧 Humidity: ${data.main.humidity}%</p>
            <p>☁️ Condition: ${data.weather[0].description}</p>
        `;

    } catch (error) {
        result.innerHTML = "<p>Something went wrong.</p>";
    }
}
