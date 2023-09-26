/**
 * 
 */

// 페이지 로드 시 사이드바 높이 설정
function setSidebarHeight() {
    const sidebar = document.getElementById("sidebar");
    const windowHeight = window.innerHeight;
    const navbarHeight = document.querySelector(".navbar").offsetHeight;
    const sidebarHeight = windowHeight - navbarHeight;
    sidebar.style.height = `${sidebarHeight}px`;
}

// 페이지 로드 및 리사이즈 이벤트에 대한 이벤트 핸들러 등록
window.addEventListener("load", setSidebarHeight);
window.addEventListener("resize", setSidebarHeight);
