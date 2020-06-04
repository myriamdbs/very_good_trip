const inputStyle = () => {
  const input = document.querySelector("#item_name")
  if (input) {
    const returnStyle = document.querySelector("#click-listener")
    input.addEventListener("click", (event) => {
    input.classList.add("style_bigger")
    });
  };
};

export { inputStyle }
