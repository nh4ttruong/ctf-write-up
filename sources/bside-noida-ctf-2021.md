---
title: BSides Noida CTF 2021
tags: [write-up, ctf, bsidenoidactf]
style: fill
color: primary
description: Write-up in the BSides Noida CTF 2021.
---

Website: [https://ctf.bsidesnoida.in/](https://ctf.bsidesnoida.in/)

## Misc/Psst

### Challenge

This challenge:

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/MiscPsst/statement.png)

After download, we have a [tar file](https://github.com/nh4ttruong/ctf-write-up/blob/main/sources/bside-noida-ctf-2021/MiscPsst/psst.tar.gz)

### Solution

After I had extracted it, I had a folder which contain some files in folder. I used search tool in Ubuntu to filter ".txt" and had this result:

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/MiscPsst/folder.png)

The content in that files which joined is the flag. Therefore, I write a [small bashscript](https://github.com/nh4ttruong/ctf-write-up/blob/main/sources/bside-noida-ctf-2021/MiscPsst/script.sh) below to make it easy:

```shell
#!/bin/bash

i="0"
res=""
while [ $i -lt 70 ]
do
path="readme_${i}.txt"
temp=$( cat $path )
res="$res$temp"
i=$[i + 1]
done
echo $res
```

And we got the flag!!!!

### Flag

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/MiscPsst/flag.png)

## Misc/My Artwork

### Statement

This challenge:

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/myartwork/statement.png)

Here is code -> [Code](https://github.com/nh4ttruong/ctf-write-up/blob/main/sources/bside-noida-ctf-2021/myartwork/art.TURTLE)

### Solution

After searching for which type of code, I known that the code is Logo's turtle programming language. It will show graphic by graphic. So, I was try to compile it online by [Colormen](https://www.calormen.com/jslogo/) and got the flag.

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/myartwork/compile.gif)

### Flag

>**BSNoida{CODE_IS_BEAUTY_BEAUTY_IS_CODE}**

## Web/babyweb

### Statement

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/babyweb/chal.png)

Source [baby_web.zip here](https://github.com/nh4ttruong/ctf-write-up/blob/main/sources/bside-noida-ctf-2021/babyweb/baby_web.zip) and *index.html* below:

```html
<!DOCTYPE html>
<html>
<head>
  <title>BSides CTF Challs</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <style>
    * {
  font-family: sans-serif; /* Change your font family */
}

.content-table {
  border-collapse: collapse;
  margin: 70px 50px;
  width: 90%;
  font-size: 1.0em;
  min-width: 400px;
  border-radius: 5px 5px 0 0;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
  background-color: #009879;
  color: #ffffff;
  text-align: left;
  font-weight: bold;
}

.content-table th,
.content-table td {
   max-width: 55px;
  text-align:justify;
  word-break:keep-all;
  padding: 12px 15px;
}

.content-table tbody tr {
  border-bottom: 1px solid #dddddd;
}

.content-table tbody tr:nth-of-type(even) {
  background-color: #f3f3f3;
}

.content-table tbody tr:last-of-type {
  border-bottom: 2px solid #009879;
}

.content-table tbody tr.active-row {
  font-weight: bold;
  color: #009879;
}

.header {
  text-align: center;
  position: relative;
  margin: 50px auto;
}
h2 {
  font-family: arial;
  color: #333;
  font-size: 40px;
  text-align: center;
  margin: 0 30px;
  text-transform: uppercase;
}
span {
  display: inline-block;
  position: absolute;
  background: #faa;
  height: 3px;
  left: 50%;
}
span.top {
  width: 70px;
  top: 20px;
}
span.bottom {
  width: 120px;
  top: 35px;
}
span.left {
  transform: translateX(-350px);
}
span.bottom.left {
  transform: translateX(-400px);
}
span.right {
  transform: translateX(280px);
}

</style>
</head>
<body>
  
  <div class="header">
  <span class="top right"></span>
  <span class="top left"></span>
  <h2>BSides CTF Challs</h2>
  <span class="bottom right"></span>
  <span class="bottom left"></span>
  <form method="GET">
  <input type="numer" name="chall_id" style="margin-top: 5%;" placeholder="ID">
  <button type="submit">Search Challs</button>
  </form>
</div>

  <table class="content-table">
  <thead>
    <tr>
      <th>ID</th>
      <th>Title</th>
      <th>Description</th>
      <th>Category</th>
      <th>Author</th>
      <th>Points</th>
    </tr>
    </thead>
    <tbody>
<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

class MyDB extends SQLite3 {
    function __construct() {
        $this->open('./karma.db');
    }
}

$db = new MyDB();
if (!$db) {
    echo $db->lastErrorMsg();
} else {

    if (isset($_GET['chall_id'])) {
      $channel_name = $_GET['chall_id'];
    $sql = "SELECT * FROM CTF WHERE id={$channel_name}";
    $results = $db->query($sql);
    while($row = $results->fetchArray(SQLITE3_ASSOC) ) {
    echo "<tr><th>".$row['id']."</th><th>".$row['title']."</th><th>".$row['description']."</th><th>".$row['category']."</th><th>".$row['author']."</th><th>".$row['points']."</th></tr>";
    }  
    }else{
      echo "<tr><th>-</th><th>-</th><th>-</th><th>-</th><th>-</th><th>-</th></tr>";
    }
    
}
?>

</tbody>
</table>
</body>
</html>
```

Web interface:

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/babyweb/web.png)

### Solution

The website will return the infomation when user type the challenge ID ```?chall_id=```

Looking at the attached source and index.html, the all query will be saved in the *karma.db* file. Try to check this file by add ```karma.db``` into the pay load after query some chall_id. Immediately, I had a new [*karma.db*](https://github.com/nh4ttruong/ctf-write-up/blob/main/sources/bside-noida-ctf-2021/babyweb/karma.db). Open it and we got the flag.

### Flag

![](https://raw.githubusercontent.com/nh4ttruong/ctf-write-up/main/sources/bside-noida-ctf-2021/babyweb/flag.png)

>**BSNoida{4_v3ry_w4rm_w31c0m3_2_bs1d35_n01d4}**
