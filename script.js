function getWeather() {
    const city = document.getElementById("city").value;
    const result = document.getElementById("weatherResult");

    result.innerHTML = `
        <h2>${city}</h2>
        <p>🌡️ Temperature: 25 °C</p>
        <p>💧 Humidity: 60%</p>
        <p>☁️ Condition: Clear Sky</p>
    `;
}
