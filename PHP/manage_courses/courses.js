$(document).ready(init);

function init(){
    $(".actions").on("change",function(){show_row(this);});
}

function show_row(combo) {
    var val=$(combo).val().trim().toLowerCase();
    var course_id=$(combo).attr("data-course-id");
    var submit_id="submit_"+course_id;
    var row_id="row_"+course_id;
    var title_id="title_"+course_id;
    var des_id="description_"+course_id;
    var editables=[title_id,des_id];
    make_editable(editables,val=="edit");
    if (val != "") {
        $("#"+submit_id).val($(combo).val());
        $("#"+row_id).attr("class", "shown");
    }
    else {
        $("#"+row_id).attr("class","hidden");
    }
}

function make_editable(array,flag){
    for(var i=0;i<array.length;i++){
        $("#"+array[i]).prop("readOnly",!flag);
        $("#"+array[i]).attr("class",flag?"editable":"uneditable");
    }
}


