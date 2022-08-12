let nav = document.querySelector('.navigator')

window.onscroll = function () {
    let height = document.documentElement.scrollTop
    if (height > 300) {
        nav.classList.add('show')
    } else {
        nav.classList.remove('show')
    }
}