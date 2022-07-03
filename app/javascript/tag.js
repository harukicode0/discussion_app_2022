document.addEventListener("DOMContentLoaded", () => {
  const tagNameInput = document.querySelector("#tag_name");
  if (tagNameInput) {
    const inputElement = document.getElementById("tag_name");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/rooms/tag_search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            searchResult.appendChild(childElement);

            // 高さが200px以上となったときスクロールを追加する;
            if (searchResult.clientHeight >= 200) {
              console.log(searchResult.clientHeight);
              searchResult.style.height = 200 + "px";
              searchResult.style.overflow = scroll;
            }

            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("tag_name").value =
                clickElement.textContent;
              while (searchResult.lastChild) {
                searchResult.removeChild(searchResult.lastChild);
                searchResult.style.height = "";
              }
            });
          });
        }
      };
    });
  }
});
