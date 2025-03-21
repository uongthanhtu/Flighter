function renderSeats() {
  const container = document.getElementById("seat-container");
  container.innerHTML = "";
  seats.forEach((seat) => {
    const seatDiv = document.createElement("div");
    seatDiv.classList.add(
      "seat",
      seat.status.toLowerCase(),
      seat.fareClass.toLowerCase()
    );
    const input = document.createElement("input");
    input.classList.add("hidden");
    input.type = "checkbox";
    input.name = "selectedSeats";
    input.dataset.seat = seat.seatNumber;
    input.value = seat.seatID;
    input.id = seat.seatID;
    input.disabled = seat.status === "Booked";
    input.onchange = updateSummary;

    const label = document.createElement("label");
    label.htmlFor = seat.seatID;
    label.textContent = seat.seatNumber;
    label.classList.add("seat__select");
    label.onmouseenter = () => showSeatInfo(seat);
    label.onmouseleave = () => clearSeatInfo();

    seatDiv.appendChild(input);
    seatDiv.appendChild(label);
    container.appendChild(seatDiv);
  });
}

function updateSummary() {
  const selectedSeats = Array.from(
    document.querySelectorAll("input[name='selectedSeats']:checked")
  ).map((input) => input.dataset.seat);
  document.getElementById("selected-seats").textContent =
    selectedSeats.join(", ");
  const totalPrice = selectedSeats.reduce((total, seatNumber) => {
    const seat = seats.find((s) => s.seatNumber === seatNumber);
    return total + (seat ? seat.price : 0);
  }, 0);
  document.getElementById("total-price").textContent = totalPrice;
}

function showSeatInfo(seat) {
  const seatInfo = document.getElementById("seat-info");
  seatInfo.innerHTML = `
                <p class="seat-info__detail"><strong>Seat Number:</strong> ${seat.seatNumber}</p>
                <p class="seat-info__detail"><strong>Status:</strong> ${seat.status}</p>
                <p class="seat-info__detail"><strong>Seat Type:</strong> ${seat.fareClass}</p>
                <p class="seat-info__detail"><strong>Price:</strong> ${seat.price}VNĐ</p>
            `;
}

function clearSeatInfo() {
  document.getElementById("seat-info").textContent =
    "Hover over chair to see information";
}

console.log("Seats data:", seats);

renderSeats();
const prevButton = document.getElementById("prev-btn");
prevButton.onclick = (e) => {
  e.preventDefault();
  history.back();
};
