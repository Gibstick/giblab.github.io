 <script src="/js/problem-2.8.js"></script>
 <style>
 .mono-addon {
   font-family: monospace;
 }
 </style>

# Stat 230 Problem 2.8 Simulation

See also [this blog post](http://cwang.me/blog/2015/05/12/stat-230-problem-professor-x-s-evil-grading-scheme/).

This page lets you write out the body of a function that implements a strategy for the below secenario, and then quickly test it by running a simulation with a given number of trials.

<p style="margin-left:2em">Anonymous professor X has an integer (1 ≤ m ≤ 9) in mind and asks two students, Allan and Beth to pick numbers between 1 and 9. Whichever is closer to m gets 90% and the other 80% in STAT 230. If they are equally close, they both get 85%. If the professor’s number and that of Allan are chosen purely at random and Allen announces his number out loud, describe a sample space and a strategy which leads Beth to the highest possible mark.</p>

The function you supply takes 3 parameters:

  - *n*: Allan's number
  - *min*, *max*: the inclusive range containing the professor's number.

The function can make use of <code>randBetween(a, b)</code> which returns a random integer from the range [*a*, *b*].

The default strategy is to just pick randomly.

 <form id="sim-params" name="sim-params" onsubmit="runSim(); return false;">
    <div class="form-group">
      <label for="function-body">Function body in JS:</label><br/>
      <div class="input-group" style="min-width:480px">
        <span class="input-group-addon mono-addon">function bethStrategy(n, min, max) {</span>
        <input type="text" id="function-body" class=
        "form-control" placeholder="return randBetween(min, max);"/>
        <span class="input-group-addon mono-addon">}</span>
      </div>
    </div>
    <div class="form-inline">
      <div class="form-group">
        <label for="num-trials">Number of trials (fewer than 1m):</label> <input type=
        "number" id="num-trials" class="form-control" placeholder="10000" min="1" max=
        "1000000" />
      </div>
      <div class="form-group">
        <label for="min-num">Min:</label> <input type="number" id="min-num" class=
        "form-control" placeholder="1" />
      </div>
      <div class="form-group">
        <label for="max-num">Max:</label> <input type="number" id="max-num" class=
        "form-control" placeholder="9" />
      </div>
      <div class="button">
        <button type="submit" class="btn btn-primary">Run
        Simulation</button>
      </div>
    </div>
  </form>

## Results

<table class="table table-bordered table-hover narrowtable" id="results-table"
  style="max-width:200px">
  <tr>
    <th>Outcome (Betty's Grade)</th>
    <th>Probability</th>
  </tr>
  <tr>
    <td>80%</td>
    <td id="prob-80"><br></td>
  </tr>
  <tr>
    <td>85%</td>
    <td id="prob-85"><br></td>
  </tr>
  <tr>
    <td>90%</td>
    <td id="prob-90"></td>
  </tr>
</table>

<strong>Expected value: </strong><results-average id="results-average"></results-average>%
