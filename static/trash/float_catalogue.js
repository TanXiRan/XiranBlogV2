$(function () {
    let editor = editormd.markdownToHTML("unique_content_id", {
        width: "100%",
        height: "100%",
        path: "/static/editor-md/lib/",
    })
})

let floatCatalog = document.querySelector('.catalog')
let top1 = 0
top1 = $(floatCatalog).offset().top - 80

window.onscroll = function () {
    let height = document.documentElement.scrollTop
    if (height >= top1) {
        floatCatalog.classList.add('float')
    } else {
        floatCatalog.classList.remove('float')
    }
}