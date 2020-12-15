const fs = require('fs');

solution1 = function(lines) {
  let solution =  null
  lines.forEach(function(firstLine) {
    if (solution) return
    firstLineN = Number(firstLine)
    lines.forEach(function(secondLine) {
      secondLineN = Number(secondLine)
      if ((firstLineN != secondLineN) && 
          (firstLineN + secondLineN == 2020)) solution = firstLineN * secondLineN
    })
  })
  console.log(solution)
}

solution2 = function(lines) {
  let solution =  null
  lines.forEach(function(firstLine) {
    if (solution) return
    firstLineN = Number(firstLine)
    lines.forEach(function(secondLine) {
      secondLineN = Number(secondLine)
      lines.forEach(function(thirdLine) {
        thirdLineN = Number(thirdLine)
        if ((firstLineN != secondLineN) && (firstLineN != thirdLineN) && (thirdLineN != secondLineN) &&
            (firstLineN + secondLineN + thirdLineN == 2020)) solution = firstLineN * secondLineN * thirdLineN
      })
    })
  })
  console.log(solution)
}

fs.readFile('day1.txt', (err, data) => { 
  if (err) throw err; 
  solution1(data.toString().split("\n")); 
  solution2(data.toString().split("\n")); 
}) 
