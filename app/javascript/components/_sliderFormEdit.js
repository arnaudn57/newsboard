

const sliderFormEdit = () => {
  // const btn = document.getElementById('user_available_time');
  // console.log(btn.value);
  const slider = document.querySelector('input[type="range"]');
  const value = slider.value;
  const output = document.querySelector('output[type="range"]');
  const valueOutput = output.value;
  slider.addEventListener('input', event => {
    value = valueOutput;
  })
  console.log(slider)
}

export {sliderFormEdit};
