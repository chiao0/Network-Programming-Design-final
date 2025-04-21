function handleEnter(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
    document.getElementById("searchForm").submit();
  }
}