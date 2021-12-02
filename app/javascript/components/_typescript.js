import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#text-bubble', {
    strings: ["Hi, i'm Carlos !"],
    typeSpeed: 40,
    loop: true,
    showCursor: false,
  });
}
export { loadDynamicBannerText };
