<?php

$array = file('day1.txt');

$solution1 = null;

foreach ($array as $firstKey => $firstValue) {
  if ($solution1) { continue; }
  foreach ($array as $secondKey => $secondValue) {
    if (($firstValue + $secondValue == 2020) && ($firstKey != $secondKey)) { $solution1 = $firstValue * $secondValue; }
  }
}
echo("$solution1\n");

$solution2 = null;

foreach ($array as $firstKey => $firstValue) {
  if ($solution2) { continue; }
  foreach ($array as $secondKey => $secondValue) {
    foreach ($array as $thirdKey => $thirdValue) {
      if (($firstValue + $secondValue + $thirdValue == 2020) &&
          ($firstKey != $secondKey) &&
          ($thirdKey != $secondKey) && ($thirdKey != $firstKey)) {
         $solution2 = $firstValue * $secondValue * $thirdValue; 
        }
    }
  }
}

echo("$solution2\n");