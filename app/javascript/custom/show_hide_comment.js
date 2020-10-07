showHideComment = function(comment_id, button_id) {
    let button = document.getElementById(button_id)
    let comment_block = document.getElementById(comment_id)

     if (button.innerText == "+Show most relevant comments") {
        button.innerText = "-Hide most relevant comments"
        comment_block.removeAttribute("style");
     } else {
        button.innerText = "+Show most relevant comments"
        comment_block.style.display="none";
     }
}
