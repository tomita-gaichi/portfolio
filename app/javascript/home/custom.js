//============================== menu =========================
const scrollBlue = function () {
  const blueLeft = document.getElementById("information").getBoundingClientRect().left;
  const blueTop = document.getElementById("information").getBoundingClientRect().top;
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
