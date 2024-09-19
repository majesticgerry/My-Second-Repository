// jvavscript for A4
// make plots calc
// used https://jsfiddle.net/reaglin/auw79/

// calculate
document.addEventListener("DOMContentLoaded", function () {
  document.getElementById("calculate").addEventListener("click", function () {
    let a = parseFloat(document.getElementById("a").value);
    let r = parseFloat(document.getElementById("r").value) / 100;
    let x = parseFloat(document.getElementById("x").value);

    // math
    let result = a * Math.pow(1 + r, x);

    // display results
    document.getElementById(
      "resultDisplay"
    ).innerText = `Result at ${x}: f(x) = ${result.toFixed(2)}`;

    // values for each time interval
    let valuesHTML = "<ul>";
    for (let i = 0; i <= x; i++) {
      let fx = a * Math.pow(1 + r, i);
      valuesHTML += `<li>f(${i}) = ${fx.toFixed(2)}</li>`;
    }
    valuesHTML += "</ul>";
    document.getElementById("valueDisplay").innerHTML = valuesHTML;
  });

  // plot button
  document.getElementById("plot").addEventListener("click", function () {
    let a = parseFloat(document.getElementById("a").value);
    let r = parseFloat(document.getElementById("r").value) / 100;
    let x = parseFloat(document.getElementById("x").value);

    // plot data
    let data = [];
    for (let i = 0; i <= x; i++) {
      let fx = a * Math.pow(1 + r, i);
      data.push([i, fx]);
    }

    // highcharts plot
    Highcharts.chart("container", {
      chart: {
        type: "line",
      },
      title: {
        text: "Exponential Growth",
      },
      xAxis: {
        title: {
          text: "Time (x)",
        },
      },
      yAxis: {
        title: {
          text: "Growth (fx)",
        },
      },
      series: [
        {
          name: "Exponential Growth",
          data: data,
        },
      ],
    });
  });
});
