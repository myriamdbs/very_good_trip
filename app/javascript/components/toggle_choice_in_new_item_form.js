const toggleChoiceInNewItemForm = () => {
  const radioButton = document.querySelector("#item_shared_false");
  const formToHide = document.querySelector(".item_user_in_charge");
  const radioButtonYes = document.querySelector("#item_shared_true");
  if (radioButton && formToHide) {
    radioButton.addEventListener("change", (event) => {
      formToHide.classList.toggle("d-none");
    });
    radioButtonYes.addEventListener("change", (event) => {
      formToHide.classList.toggle("d-none");
    });
  }
};

export { toggleChoiceInNewItemForm };
