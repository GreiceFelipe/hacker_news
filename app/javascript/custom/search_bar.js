searchBar = function() { 
    let input = document.getElementById('searchbar').value 
    input = input.toLowerCase(); 
    let titles = document.getElementsByClassName('title'); 

    for (let i = 0; i < titles.length; i++) { 
        let card =  titles[i].parentNode.parentNode
        if (!titles[i].innerHTML.toLowerCase().includes(input)) { 
            card.style.display="none"; 
        } 
        else { 
            card.removeAttribute("style");                  
        } 
    } 
} 