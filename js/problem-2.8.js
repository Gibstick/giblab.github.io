
/**
 * Returns a random integer in [min, max]
 */
function randBetween(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}

/**
 * Run a simulation consisting of num_trials trials, with each experiment
 * generating numbers in [min_num, max_num], and using the optional strategy
 * function strat as the method for choosing a number based on Allan's guess
 */
function runTrials(num_trials, min_num, max_num, strat) {
  'use strict'
  var num_occurrences = [0, 0, 0];

  strat = strat || function(n, min, max) {return randBetween(min_num, max_num)};

  for (var i = 0; i < num_trials; i++) {
    var prof = randBetween(min_num, max_num);
    var allan = randBetween(min_num, max_num);
    var betty = strat(allan, min_num, max_num);
    num_occurrences[0] += (Math.abs(allan - prof) > Math.abs(betty - prof));
    num_occurrences[1] += (Math.abs(allan - prof) == Math.abs(betty - prof));
    num_occurrences[2] += (Math.abs(allan - prof) < Math.abs(betty - prof));
  }

  return num_occurrences.map(function(x) {
    return x / num_trials;
  });
}

/**
 * Returns a function for the strategy used to pick a number.
 * The function signature is strat(n, min, max)
 */
function customStrat(body) {
  return new Function("n", "min", "max", body + ";");
}

/**
 * onClick for the Run Simulation button. It gathers data from the form fields
 * and runs the simulation
 */
function runSim(){
  var function_body = document.getElementById("function-body").value || "return n;";
  var num_trials = document.getElementById("num-trials").value || 10000;
  if (num_trials > 100000) num_trials = 1000000;
  var min = document.getElementById("min-num").value || 1;
  var max = document.getElementById("max-num").value || 9;
  var strat = customStrat(function_body);

  var results = runTrials(num_trials, min, max, strat);

  document.getElementById("prob-80").innerHTML = results[0];
  document.getElementById("prob-85").innerHTML = results[1];
  document.getElementById("prob-90").innerHTML = results[2];

  document.getElementById("results-average").innerHTML = results[0]*80 + results[1] * 85 + results[2] * 90;
}
