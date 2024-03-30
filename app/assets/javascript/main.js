async function myCopyContent() { 
    try { 
        var copyText = window.location.href 
        await navigator.clipboard.writeText(copyText); 
        var link = document.getElementById("link_copied"); 
        link.style.visibility = "visible" 
        setTimeout(function(){ 
        var link = document.getElementById("link_copied"); 
        link.style.visibility = "hidden" 
        }, 1000); 
 
    } catch (err) { 
        console.error('Failed to copy: ', err); 
    } 
} 
 
async function like_post(post_id) { 
    const myHeaders = new Headers(); 
     
    myHeaders.append("Content-Type", "application/json"); 
    const raw = JSON.stringify({ 
      "user_id": user_id 
    }); 
 
    const requestOptions = { 
      method: "POST", 
      headers: myHeaders, 
      body: raw, 
      redirect: "follow" 
    }; 
 
    fetch(`http://127.0.0.1:3000/api/v1/posts/${post_id}/likes`, requestOptions) 
      .then((response) => response.text()) 
      .then((result) => { 
        post_liked = !post_liked 
        taggle_like() 
 
      }) 
      .catch((error) => console.error(error)); 
} 
 
async function delete_post(post_id) { 
  const myHeaders = new Headers(); 
   
  myHeaders.append("Content-Type", "application/json"); 
  const raw = JSON.stringify({ 
    "user_id": user_id 
  }); 
 
  const requestOptions = { 
    method: "DELETE", 
    headers: myHeaders, 
    body: raw, 
    redirect: "follow" 
  }; 
 
  fetch(`http://127.0.0.1:3000/api/v1/posts/${post_id}/likes`, requestOptions) 
    .then((response) => response.text()) 
    .then((result) => { 
      post_liked = !post_liked 
      taggle_like() 
    }) 
    .catch((error) => console.error(error)); 
}