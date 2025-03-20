function togglePasswordVisibility(inputId, iconId) {
  const passwordInput = document.getElementById(inputId);
  const toggleIcon = document.getElementById(iconId);

  toggleIcon.addEventListener("click", function () {
    if (passwordInput.type === "password") {
      passwordInput.type = "text";
      toggleIcon.classList.remove("fa-eye");
      toggleIcon.classList.add("fa-eye-slash");
    } else {
      passwordInput.type = "password";
      toggleIcon.classList.remove("fa-eye-slash");
      toggleIcon.classList.add("fa-eye");
    }
  });
}

togglePasswordVisibility("password", "togglePassword1");
togglePasswordVisibility("password-confirm", "togglePassword2");

document
  .getElementById("registrationForm")
  .addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn chặn form gửi đi mặc định

    // Lấy giá trị từ các trường input
    const firstName = document.getElementById("firstName").value;
    const lastName = document.getElementById("lastName").value;
    const email = document.getElementById("email").value;
    const dob = document.getElementById("dob").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    // Kiểm tra xem mật khẩu và xác nhận mật khẩu có khớp nhau không
    if (password !== confirmPassword) {
      alert("Passwords do not match.");
      return;
    }

    // Kiểm tra xem các điều khoản và chính sách đã được chấp nhận chưa
    const termsChecked = document.getElementById("terms").checked;
    const privacyChecked = document.getElementById("privacy").checked;

    if (!termsChecked || !privacyChecked) {
      alert("Please accept the terms and conditions and privacy policy.");
      return;
    }

    // Nếu tất cả đều hợp lệ, bạn có thể gửi dữ liệu đi hoặc thực hiện các hành động khác
    alert("Registration successful!");
    console.log({
      firstName,
      lastName,
      email,
      dob,
      password,
    });

    // Reset form sau khi đăng ký thành công
    document.getElementById("registrationForm").reset();
  });
