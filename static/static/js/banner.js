// // // 轮播图
// // // 获取轮播图的div盒子
// let banners = document.querySelectorAll('.dynamic_shuffle')
// let interval = parseInt(banners[0].getAttribute('banner_interval'))
// let sentences = document.querySelectorAll('.rotating-sentence')
//
// let b_length = banners.length
// let b_index = 0
// let b_timer = null
// clearInterval(b_timer)
//
// setInterval(() => {
//
//     if (b_index === b_length) {
//         b_index = 0
//     }
//     for (var i = 0; i < b_length; i++) {
//         banners[i].style.opacity = 0
//     }
//     // for (let banner of banners) {
//     //     banner.style.opacity = 0
//     // }
//     console.log(banners)
//
//     banners[b_index].style.opacity = 1
//     b_index++
//     // console.log(banners[b_index])
//
//     if (interval === 0) {
//         clearInterval(b_timer)
//     }
//
// }, interval * 1000)
//
// let sen_length = sentences.length
// let sen_index = 0
// let sen_timer = null
// setInterval(() => {
//     sen_index++
//     if (sen_index === sen_length) {
//         sen_index = 0
//     }
//
//     for (let sentence of sentences) {
//         sentence.style.opacity = 0
//     }
//
//     sentences[sen_index].style.opacity = 1
//     console.log(sentences[sen_index])
//
//
//     if (interval === 0) {
//         clearInterval(sen_timer)
//     }
//
// }, interval * 1000)

//
// let banners = document.querySelectorAll('.dynamic_shuffle')
// // console.log(banners)
// if (banners.length !== 0) {
//     const interval = Number(banners[0].getAttribute('banner_interval'))
//     let timer = null
//     let length = banners.length
//     let index = 0
//     clearInterval(timer)
//     timer = setInterval(() => {
//
//         if (index === length) {
//             index = 0
//         }
//         // for (var i = 0; i < length; i++) {
//         //     banners[i].style.opacity = 0
//         // }
//         // console.log(banners)
//         for (let banner of banners) {
//             banner.style.opacity = 0
//             // console.log(banner)
//         }
//         // console.log(banners)
//
//         banners[index].style.opacity = 1
//         index++
//
//         if (interval === 0) {
//             clearInterval(timer)
//         }
//     }, interval * 1000)
//
// }


// 轮播图
// 获取轮播图的div盒子
let banners = document.querySelectorAll('.dynamic_shuffle')
let interval = parseInt(banners[0].getAttribute('banner_interval'))
let sentences = document.querySelectorAll('.rotating-sentence')
let b_length = banners.length
let index = 0
let timer = null
clearInterval(timer)

setInterval(() => {

    if (index === b_length) {
        index = 0
    }
    for (let i = 0; i < b_length; i++) {
        banners[i].style.opacity = 0
        sentences[i].style.opacity = 0
    }

    banners[index].style.opacity = 1
    sentences[index].style.opacity = 1

    index++

    if (interval === 0) {
        clearInterval(timer)
    }

}, interval * 1000)



