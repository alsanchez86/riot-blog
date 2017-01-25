<list>
	<div each={item, i in data}>
		{item}
	</div>

	<script>
		var self = this
		self.data = []

		xmlhttp = new XMLHttpRequest()
		url = "http://blog.agresebe.com/api/posts?format=json";

		xmlhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
        var myArr = JSON.parse(this.responseText);
        myFunction(myArr);
    	}
		};
		xmlhttp.open("GET", url, true);
		xmlhttp.send();

		function myFunction(arr) {
    	var out = "";
    	var i;
    	for(i = 0; i < arr.length; i++) {
        out += '<a href="' + arr[i].url + '">' +
        arr[i].display + '</a><br>';
    	}
			console.log(out)

    // document.getElementById("id01").innerHTML = out;
	}
  </script>

  <style>
  </style>
</list>
