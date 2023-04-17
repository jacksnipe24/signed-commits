function hanoiTower(num, fromRod, toRod, auxRod) {
  if (num === 1) {

    console.log(`Move disk 1 from rod ${fromRod} to rod ${toRod}`);
    return;
  }



  hanoiTower(num - 1, fromRod, auxRod, toRod);




  console.log(`Move disk ${num} from rod ${fromRod} to rod ${toRod}`);
  hanoiTower(num - 1, auxRod, toRod, fromRod);
}


hanoiTower(3, "A", "C", "B"); // Example usage
