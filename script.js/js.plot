// jvavscript for A4
// make plots calc
// used https://jsfiddle.net/reaglin/auw79/

document.getElementById("plot").addEventListener("click", function () {
  let a = parseFloat(document.getElementById("a").value);
  let r = parseFloat(document.getElementById("r").value) / 100;
  let x = parseFloat(document.getElementById("x").value);

  // Generate data for the plot
  let labels = [];
  let data = [];
  for (let i = 0; i <= x; i++) {
    labels.push(i);
    data.push(a * Math.pow(1 + r, i));
  }

  // Create the chart
  let ctx = document.getElementById("growthChart").getContext("2d");
  new Chart(ctx, {
    type: "line",
    data: {
      labels: labels,
      datasets: [
        {
          label: "Exponential Growth",
          data: data,
          borderColor: "rgba(75, 192, 192, 1)",
          fill: false,
        },
      ],
    },
    options: {
      scales: {
        x: {
          title: {
            display: true,
            text: "Time (x)",
          },
        },
        y: {
          title: {
            display: true,
            text: "f(x)",
          },
        },
      },
    },
  });
});
