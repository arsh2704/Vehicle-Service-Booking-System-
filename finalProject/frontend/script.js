// ===== BASE CONFIG =====
const BASE_URL = "http://localhost:8080"; // change if different

// ===== VEHICLE FUNCTIONS =====

// Fetch all vehicles
async function fetchVehicles() {
    try {
        const response = await fetch(`${BASE_URL}/vehicles`);
        const data = await response.json();
        displayVehicles(data);
    } catch (error) {
        console.error("Error fetching vehicles:", error);
    }
}

// Add a new vehicle
async function addVehicle(model, number) {
    const newVehicle = {
        model: model,
        number: number
    };

    try {
        const response = await fetch(`${BASE_URL}/vehicles`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(newVehicle)
        });

        if (response.ok) {
            alert("Vehicle added successfully!");
            fetchVehicles(); // refresh list
        } else {
            alert("Error adding vehicle.");
        }
    } catch (error) {
        console.error("Error:", error);
    }
}

// ===== DISPLAY VEHICLES IN DASHBOARD =====
function displayVehicles(vehicles) {
    const vehicleList = document.getElementById("vehicle-list");
    vehicleList.innerHTML = ""; // Clear previous data

    vehicles.forEach(vehicle => {
        const item = document.createElement("div");
        item.className = "vehicle-card";
        item.innerHTML = `
            <h3>${vehicle.model}</h3>
            <p>Number: ${vehicle.number}</p>
            <p>Bookings: ${vehicle.bookings.length}</p>
        `;
        vehicleList.appendChild(item);
    });
}

// ===== EVENT LISTENERS FOR FORMS =====
document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("vehicle-form");

    if (form) {
        form.addEventListener("submit", (e) => {
            e.preventDefault();
            const model = document.getElementById("model").value;
            const number = document.getElementById("number").value;
            addVehicle(model, number);
            form.reset();
        });
    }

    if (document.getElementById("vehicle-list")) {
        fetchVehicles();
    }
});
