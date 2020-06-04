const toggleChoiceInNewItemForm = () => {
  const toggleButton = document.querySelector("#item_shared");
  const formToHide = document.querySelector(".item_user_in_charge");
  if (toggleButton) {
    toggleButton.addEventListener("change", (event) => {
      if (formToHide.style.display === "block") {
        formToHide.style.display = "none";
      } else {
        formToHide.style.display = "block";
      };
    });
  }
};

export { toggleChoiceInNewItemForm };
