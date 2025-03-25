function togglePassword(inputId, iconElement) {
  const input = document.getElementById(inputId);
  if (input.type === "password") {
    input.type = "text";
    iconElement.classList.remove("fa-eye");
    iconElement.classList.add("fa-eye-slash");
  } else {
    input.type = "password";
    iconElement.classList.remove("fa-eye-slash");
    iconElement.classList.add("fa-eye");
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("mobileModal");
  const openModalBtn = document.getElementById("openModal");
  const cancelBtn = document.querySelector(".modal__button--cancel");
  const stayOnSiteBtn = document.querySelector(".modal__button-logout--stay");
  modal.style.display = "none";

  openModalBtn.addEventListener("click", function (event) {
    event.preventDefault();
    modal.style.display = "flex";
  });

  cancelBtn.addEventListener("click", function () {
    modal.style.display = "none";
  });

  window.addEventListener("click", function (event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  });
});
