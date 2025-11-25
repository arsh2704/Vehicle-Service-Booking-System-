
      const userId = 3; // Change this dynamically if needed (e.g., from query params)
      const apiUrl = `http://localhost:8080/api/dashboard?userId=${userId}`;

      async function loadDashboard() {
        try {
          const res = await fetch(apiUrl);
          const data = await res.json();

          const currentUser = data.users.find((u) => u.id === userId);
          const isAdmin = currentUser.role === "ADMIN";

          // User Info
          const userDiv = document.getElementById("user-info");
          userDiv.innerHTML = isAdmin
            ? generateUsersTable(data.users)
            : generateUserDetails(currentUser);

          // Vehicle Info
          const vehicleDiv = document.getElementById("vehicle-info");
          vehicleDiv.innerHTML = isAdmin
            ? generateVehiclesTable(data.vehicles, data.users)
            : generateUserVehicle(data.vehicles, userId, data.users);


          // Feedback Info
          const feedbackDiv = document.getElementById("feedback-info");
          feedbackDiv.innerHTML = isAdmin
            ? generateFeedbacksTable(data.feedbacks, data.users)
            : generateUserFeedbacks(data.feedbacks, userId);
        } catch (error) {
          console.error("Failed to load dashboard:", error);
        }
      }

      function generateUsersTable(users) {
        return `
        <table>
          <tr><th>ID</th><th>Username</th><th>Email</th><th>Phone</th><th>Role</th></tr>
          ${users
            .map(
              (u) => `
            <tr>
              <td>${u.id}</td>
              <td>${u.username}</td>
              <td>${u.email}</td>
              <td>${u.phone}</td>
              <td>${u.role}</td>
            </tr>
          `
            )
            .join("")}
        </table>
      `;
      }

      function generateUserDetails(user) {
        return `
        <p><strong>ID:</strong> ${user.id}</p>
        <p><strong>Username:</strong> ${user.username}</p>
        <p><strong>Email:</strong> ${user.email}</p>
        <p><strong>Phone:</strong> ${user.phone}</p>
        <p><strong>Role:</strong> ${user.role}</p>
      `;
      }
function generateVehiclesTable(vehicles, users) {
  return `
    <table>
      <tr><th>ID</th><th>Make</th><th>Model</th><th>Year</th><th>License</th><th>User</th></tr>
      ${vehicles
        .map((v) => {
          // Find the user who owns this vehicle
          const owner = users.find(u => u.vehicles.some(uv => uv.id === v.id));
          const username = owner ? owner.username : "N/A";

          return `
            <tr>
              <td>${v.id}</td>
              <td>${v.make}</td>
              <td>${v.model}</td>
              <td>${v.year}</td>
              <td>${v.licensePlate}</td>
              <td>${username}</td>
            </tr>
          `;
        })
        .join("")}
    </table>
  `;
}


      function generateUserVehicle(vehicles, userId) {
  const user = users.find(u => u.id === userId);
  if (!user || !user.vehicles || user.vehicles.length === 0) {
    return "<p>No vehicle associated.</p>";
  }

  return user.vehicles
    .map(v => `
      <p><strong>Make:</strong> ${v.make}</p>
      <p><strong>Model:</strong> ${v.model}</p>
      <p><strong>Year:</strong> ${v.year}</p>
      <p><strong>License Plate:</strong> ${v.licensePlate}</p>
    `).join("<hr>");
}

      function generateFeedbacksTable(feedbacks) {
  return `
    <table>
      <tr><th>ID</th><th>Rating</th><th>Comment</th><th>Customer</th></tr>
      ${feedbacks
        .map((f) => `
          <tr>
            <td>${f.id}</td>
            <td>${f.rating}</td>
            <td>${f.comment}</td>
            <td>${f.customer?.username || "Unknown"}</td>
          </tr>
        `)
        .join("")}
    </table>
  `;
}


      function generateUserFeedbacks(feedbacks, userId) {
  const userFeedbacks = feedbacks.filter(f => f.customer && f.customer.id === userId);

  if (userFeedbacks.length === 0) {
    return "<p>No feedback submitted yet.</p>";
  }

  return `
    <table>
      <tr><th>ID</th><th>Rating</th><th>Comment</th></tr>
      ${userFeedbacks
        .map(f => `
          <tr>
            <td>${f.id}</td>
            <td>${f.rating}</td>
            <td>${f.comment}</td>
          </tr>
        `)
        .join("")}
    </table>
  `;
}

      loadDashboard();
