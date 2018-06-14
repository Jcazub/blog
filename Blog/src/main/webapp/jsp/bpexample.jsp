<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>jQuery Tagcloud.js: Simple Tag Cloud Generator</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
        <style>
            #tagcloud a {
                text-decoration: none;
                color: white;
                display: inline-block;
                padding: 5px;
                margin: 0 7px 7px 0;
                border-radius: 5px;
            }

            sup {
                padding-left: 2px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>jQuery Tagcloud.js: Simple Tag Cloud Generator</h1>
            <div id="tagcloud">
                <a href="#" rel='4'><span>C++<sup>4</sup></span></a>
                <a href="#" rel='2'><span>Java<sup>2</sup></span></a>
                <a href="#" rel='5'><span>Python<sup>5</sup></span></a>
                <a href="#" rel='5'><span>javascript<sup>5</sup></span></a>
                <a href="#" rel='4'><span>react<sup>4</sup></span></a>
                <a href="#" rel='3'><span>AngularJs<sup>3</sup></span></a>
                <a href="#" rel='2'><span>tensorflow<sup>2</sup></span></a>
                <a href="#" rel='9'><span>caffe<sup>3</sup></span></a>
                <a href="#" rel='1'><span>theano<sup>1</sup></span></a>
                <a href="#" rel='10'><span>keras<sup>4</sup></span></a>
                <a href="#" rel='11'><span>torch<sup>2</sup></span></a>
                <a href="#" rel='12'><span>shell<sup>4</sup></span></a>
                <a href="#" rel='13'><span>haskell<sup>1</sup></span></a>
                <a href="#" rel='14'><span>jQuery<sup>2</sup></span></a>
                <a href="#" rel='15'><span>algorithms<sup>4</sup></span></a>
                <a href="#" rel='4'><span>LeetCode<sup>4</sup></span></a>
                <a href="#" rel='5'><span>Hackerrank<sup>3</sup></span></a>
                <a href="#" rel='3'><span>Codewars<sup>3</sup></span></a>
                <a href="#" rel='16'><span>GeeksforGeeks<sup>3</sup></span></a>
                <a href="#" rel='4'><span>Superhero.js<sup>2</sup></span></a>
                <a href="#" rel='4'><span>Pure<sup>2</sup></span></a>
                <a href="#" rel='4'><span>UIKit<sup>3</sup></span></a>
                <a href="#" rel='4'><span>Foundation<sup>2</sup></span></a>
                <a href="#" rel='4'><span>Semantic UI<sup>3</sup></span></a>
                <a href="#" rel='3'><span>Bitbucket<sup>2</sup></span></a>
                <a href="#" rel='3'><span>scikit-learn<sup>5</sup></span></a>
                <a href="#" rel='2'><span>pandas<sup>2</sup></span></a>
                <a href="#" rel='2'><span>jekyll<sup>3</sup></span></a>
                <a href="#" rel='2'><span>kaggle<sup>1</sup></span></a>
                <a href="#" rel='1'><span>medium<sup>2</sup></span></a>
                <a href="#" rel='1'><span>Vue<sup>1</sup></span></a>
                <a href="#" rel='1'><span>d3.js<sup>4</sup></span></a>
                <a href="#" rel='1'><span>jquery<sup>3</sup></span></a>
                <a href="#" rel='1'><span>Backbone<sup>2</sup></span></a>
                <a href="#" rel='1'><span>git<sup>2</sup></span></a>
                <a href="#" rel='10'><span>svn<sup>1</sup></span></a>
                <a href="#" rel='15'><span>Coursera<sup>1</sup></span></a>
                <a href="#" rel='15'><span>edX<sup>2</sup></span></a>
                <a href="#" rel='4'><span>Udacity<sup>4</sup></span></a>
                <a href="#" rel='8'><span>treehouse<sup>3</sup></span></a>
                <a href="#" rel='4'><span>mongodb<sup>4</sup></span></a>
                <a href="#" rel='2'><span>data science<sup>6</sup></span></a>
                <a href="#" rel='2'><span>SQL<sup>3</sup></span></a>
                <a href="#" rel='3'><span>lasagne<sup>3</sup></span></a>
                <a href="#" rel='6'><span>scala<sup>2</sup></span></a>
                <a href="#" rel='6'><span>Spark<sup>6</sup></span></a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/tags/tagcloud.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script> 
        <script>
            $("#tagcloud a").tagcloud();
        </script>
        
    </body>
</html>
