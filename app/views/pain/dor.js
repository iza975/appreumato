document.addEventListener("DOMContentLoaded", function () {
    const painLocationSelect = document.getElementById("pain-location");
    const otherLocationContainer = document.getElementById("other-location-container");
    const otherLocationInput = document.getElementById("other-location");

    function toggleOtherLocationField() {
        if (painLocationSelect.value === "outro") {
            otherLocationContainer.style.display = "block";
            otherLocationInput.required = true;
        } else {
            otherLocationContainer.style.display = "none";
            otherLocationInput.required = false;
        }
    }

    painLocationSelect.addEventListener("change", toggleOtherLocationField);
});
