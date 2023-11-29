/* ドロップダウン */
document.addEventListener("turbo:load", function () {
  const dropdownBtn = document.getElementById("btn");
  const dropdownMenu = document.getElementById("dropdown");
  const toggleArrow = document.getElementById("arrow");

  const toggleDropdown = function () {
    dropdownMenu.classList.toggle("show");
    toggleArrow.classList.toggle("arrow");
  };

  dropdownBtn.addEventListener("click", function (e) {
    e.stopPropagation();
    toggleDropdown();
  });

  document.addEventListener("click", function (e) {
    if (!dropdownBtn.contains(e.target) && !dropdownMenu.contains(e.target)) {
      if (dropdownMenu.classList.contains("show")) {
        toggleDropdown();
      }
    }
  });
});



/* ローディングアニメーション */
 
  window.addEventListener('load', function() {
    const spinner = document.getElementById('loading');
    spinner.style.display = 'flex'; // アニメーション実行前に表示
    setTimeout(function() {
      spinner.style.display = 'none'; // アニメーション後に非表示
    }, 4000); // アニメーション時間（ここでは1秒）を考慮して適切な時間を設定
  });
  

  window.addEventListener('load', function() {
    const content = document.getElementById('content');
    content.style.opacity = '0';
  
    // 読み込み完了後、要素を徐々に表示
    setTimeout(function() {
      content.style.opacity = '1';
    }, 4000); // 遅延を加えて実行される時間を遅らせる（例えば100ミリ秒）
  }); 



  /* スクロールアップボタン */

document.addEventListener("turbo:load", function () {
const scroll_to_top_btn = document.querySelector('#scroll-to-top-btn');

scroll_to_top_btn.addEventListener( 'click' , scroll_to_top );

function scroll_to_top(){
  window.scroll({top: 0, behavior: 'smooth'});
};

window.addEventListener( 'scroll' , scroll_event );

function scroll_event(){
  if(window.pageYOffset > 800){
    scroll_to_top_btn.style.opacity = '1';
  }else if(window.pageYOffset < 800){
    scroll_to_top_btn.style.opacity = '0';
  }
  };
});