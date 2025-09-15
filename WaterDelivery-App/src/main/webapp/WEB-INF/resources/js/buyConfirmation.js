document.addEventListener("DOMContentLoaded", function () {
  let selectedPayment = null;

  // force hide error message on load
  document.getElementById("errorMsg").style.display = "none";

  // when user clicks a pay option
  document.querySelectorAll(".pay-option").forEach(item => {
    item.addEventListener("click", function (e) {
      e.preventDefault();
      selectedPayment = this.textContent.trim();
      document.getElementById("payBtn").textContent = selectedPayment;
      document.getElementById("errorMsg").style.display = "none";
    });
  });

  // confirm button click
  document.getElementById("confirmBtn").addEventListener("click", function (e) {
    if (!selectedPayment) {
      e.preventDefault();
      document.getElementById("errorMsg").style.display = "block";
    }
  });
});
