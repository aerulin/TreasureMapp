const geolocate = () => {
  const localisation = document.getElementById('local-validation');

  localisation.addEventListener('click', (event) => {
    const challengeId = localisation.getAttribute('data-challengeId')
    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      const csrfToken = document.querySelector("[name='csrf-token']").content
      var crd = pos.coords;

      fetch(`${challengeId}/validate`, {
        method: "POST",
        headers: {
          "X-CSRF-Token": csrfToken,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ lat: crd.latitude, lon: crd.longitude })
      })
      .then(response => response.json())
      .then(data => {
        if (data.location) {
          window.location.href = data.location
        }
      })
    }

    function error(err) {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    }

    navigator.geolocation.getCurrentPosition(success, error, options);
  });
};

export { geolocate };
