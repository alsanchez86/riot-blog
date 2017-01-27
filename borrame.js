var request;
request = new XMLHttpRequest();
request.open('GET', 'main.json', true);
request.send();

request.onload = function(event) { // <-- Add event argument
  var dat;
  dat = JSON.parse(event.target.responseText); // <-- and use event.target to get the response text

  dat.forEach(function(data) {
    req = new XMLHttpRequest();
    req.open('GET', data.postid + '.json', true);
    req.onload = function(event) { // <-- Add event argument
      info = JSON.parse(event.target.responseText); // <-- and use event.target to get the response text
      var cat = info.category;
      var catl = cat.length;
      var ti = '';
      for (i = 0; i < catl; i++) {
        ti += '<a href="category.html?id=' + cat[i].replace(" ", "-") + '">' + cat[i] + '</a>';
        if (i < catl - 1) {
          ti += ', ';
        }
      }
      document.getElementsByClassName('main-content')[0].innerHTML += '<div class="post"><h2><a href="/post.html?id=' + info.postid + '">' + info.title + '</a></h2><p>' + info.excerpt + '...</p><div class="meta"><a href="/author.html?id=' + info.author.replace(" ", "-") + '">' + info.author + '</a> in ' + ti + ' <i class="link-spacer"></i> ' + info.month + ' ' + info.date + ', ' + info.year + ' <i class="link-spacer"></i> <i class="fa fa-bookmark"></i> ' + info.time + ' min read </div></div>';
    };
    req.send(); // <-- You need to send every inner request, otherwise the HTTP call is never made
  });
};
