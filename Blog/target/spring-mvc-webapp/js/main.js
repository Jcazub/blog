$(document).ready(function () {

    $('#search-categories-btn').click(function (event) {
        
        window.location.replace("http://localhost:8080/Blog/");
        
        $.ajax({
            type: 'POST',
            url: 'search/categories',
            data: JSON.stringify({
                categoryName: $('#category-search').val(),
                categoryDesc: $('#category-search').val()
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            success: function (data) {
                //clear errors

                fillCategories(data);
            },
            error: function () {
                $('#errorMessages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service.  Please try again later.'));
            }
        });
    }); //search catergories end

    $('[data-toggle="tooltip"]').tooltip();

    $('#search-posts-btn').click(function (event) {
        
        
        
        $.ajax({
            type: 'POST',
            url: 'search/posts',
            data: JSON.stringify({
                title: $('#post-search').val(),
                tagName: $('#post-search').val()
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            'dataType': 'json',
            success: function (data) {
                //clear errors

                filterPosts(data);
            },
            error: function () {
                $('#errorMessages')
                        .append($('<li>')
                                .attr({class: 'list-group-item list-group-item-danger'})
                                .text('Error calling web service.  Please try again later.'));
            }
        });
    });

//TAG CLOUD SCRIPTS
    $("#tagcloud a").tagcloud();

    $('#tagForm').submit(function () {
        $("#tagcloud a").tagcloud({
            size: {
                start: parseInt($('#minFont').val()),
                end: parseInt($('#maxFont').val()),
                unit: $('#unit').val()
            },
            color: {
                start: "#" + $('#startColour').val(),
                end: "#" + $('#endColour').val()
            }
        })
        return false;
    });
});

function fillCategories(data) {
    $("#index-categories").empty();

    var catList = $("#index-categories");

    $.each(data, function (index, category) {
        var name = category.name;

        var list = '<a href="#" class="list-group-item">' + name + '</a>';
        catList.append(list);
    });
}

function filterPosts(data) {
    $("#index-posts").html("");

    var postList = $('#index-posts');

    $.each(data, function (index, post) {
        var appending = '<div class="col-lg-6 col-md-6">' +
                '<aside>' +
                '<img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive">' +
                '<div class="content-title">' +
                '<div class="text-center">' +
                '<h3><a href="#">' + post.title + '</a></h3>' +
                '</div>' +
                '</div>' +
                '<div class="content-footer">' +
                '<img class="user-small-img" src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg">' +
                '<span style="font-size: 16px;color: #fff;">' + post.user.userName + '</span>' +
                '<span class="pull-right">' +
                '<a href="#" data-toggle="tooltip" data-placement="left" title="Comments"><i class="fa fa-comments" ></i> 30</a>' +
                '<a href="#" data-toggle="tooltip" data-placement="right" title="Loved"><i class="fa fa-heart"></i> 20</a>' +
                '</span>' +
                '<div class="user-ditels">' +
                '<div class="user-img"><img src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg" class="img-responsive"></div>' +
                '<span class="user-full-ditels">' +
                '<h3>' + post.user.userName + '</h3>' +
                '<p>Web & Graphics Disigner</p>' +
                '</span>' +
                '<div class="social-icon">' +
                '<a href="#"><i class="fa fa-facebook" data-toggle="tooltip" data-placement="bottom" title="Facebook"></i></a>' +
                '<a href="#"><i class="fa fa-twitter" data-toggle="tooltip" data-placement="bottom" title="Twitter"></i></a>' +
                '<a href="#"><i class="fa fa-google-plus" data-toggle="tooltip" data-placement="bottom" title="Google Plus"></i></a>' +
                '<a href="#"><i class="fa fa-youtube" data-toggle="tooltip" data-placement="bottom" title="Youtube"></i></a>' +
                '<a href="#"><i class="fa fa-github" data-toggle="tooltip" data-placement="bottom" title="Github"></i></a>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</aside>' +
                '</div>';

        postList.append(appending);
    });
}

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    }
}

