<?php
$teryt = new SimpleXMLElement(file_get_contents('podzial_terytorialny.xml'));

$wojewodztwo = [];
$powiat = [];
$gmina = [];
$inne = [];

foreach ($teryt->catalog->row as $row) {
  $col = $row->col;
  switch ($col[5]) {
    case 'województwo':
      $wojewodztwo[intval($col[0])] = $col[4];
      break;
    default:
      if(preg_match('/powiat/i',$col[5])===1){
        $powiat[intval($col[1])] = [$col[4],intval($col[0])];
      }elseif(preg_match('/(gmina|miasto|wiejski)/i',$col[5])===1){
        $count = sizeof($gmina);
        if( $count == 0 || strcmp($gmina[$count-1][0],$col[4]) != 0 ){
          $gmina[] = [$col[4],intval($col[1])];
        }
      }else{
        $inne[] = [$col[4],intval($col[1])];
      }
  }
}

$query = [];
foreach($wojewodztwo as $index => $woj){
  $query[] = "({$index},'{$woj}')";
}
$query = implode(',',$query);
echo "INSERT INTO wojewodztwa VALUES {$query};\n";

$query = [];
foreach($powiat as $index => $pow){
  $query[] = "({$index},'{$pow[0]}',{$pow[1]})";
}
$query = implode(',',$query);
echo "INSERT INTO powiaty VALUES {$query};\n";

$query = [];
foreach($gmina as $index => $gmi){
  $query[] = "({$index},'{$gmi[0]}',{$gmi[1]})";
}
$block_size = 500;
for($i=0;$i*$block_size<sizeof($query);$i++){
  $query_part = implode(',',array_slice($query,$i*$block_size,$block_size));
  echo "INSERT INTO gminy VALUES {$query_part};\n";
}