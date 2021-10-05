//============================== menu =========================
let actionButton = document.getElementById('actionButton');
actionButton.onclick = () => target.scrollTop = 400;

let target = document.getElementById('target');
target.onscroll = () => console.log(target.scrollTop);

window.scrollBlue = function () {
  console.log('hello');
  const blueLeft = document.getElementById("map").getBoundingClientRect().left;
  const blueTop = document.getElementById("map").getBoundingClientRect().top;
  window.scrollTo({
      left: blueLeft,
      top: blueTop,
      behavior: 'smooth'
  });
};

//============================== footer =========================
document.addEventListener('DOMContentLoaded', function(){
  const pagetopBtn = document.querySelector('page-top');
  if (!pagetopBtn){ return false;}
  pagetopBtn.addEventListener('click', scroll_to_top);
  function scroll_to_top(){
    window.scroll({
      top: 0, 
      behavior: 'smooth'
    });
  };
});
