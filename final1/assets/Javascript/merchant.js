document.addEventListener("DOMContentLoaded", function() {
    initializeAddButtons();
    attachEventListeners();
});

function attachEventListeners() {
    document.body.addEventListener("click", function(event) {
        if (event.target.classList.contains("addButton")) {
            const quantityElement = event.target.parentElement.previousElementSibling;
            let quantity = parseInt(quantityElement.textContent);
            quantity++;
            quantityElement.textContent = quantity;
            console.log("Product quantity increased");
        } else if (event.target.classList.contains("deleteButton")) {
            const productRow = event.target.parentElement.parentElement;
            productRow.remove();
            console.log("Product deleted");
        }
    });
}

function initializeAddButtons() {
    // 取得 .add 按鈕元素並分別處理每個 .goods 區塊
    const addButtons1 = document.querySelectorAll('.goods1 .add');
    const addButtons2 = document.querySelectorAll('.goods2 .add');
    const addButtons3 = document.querySelectorAll('.goods3 .add');

    // 處理第一個 .goods 區塊
    addButtons1.forEach(addButton => {
        addButton.addEventListener('click', function() {
            handleAddButtonClick(addButton, '.goods1');
        });
    });

    // 處理第二個 .goods 區塊
    addButtons2.forEach(addButton => {
        addButton.addEventListener('click', function() {
            handleAddButtonClick(addButton, '.goods2');
        });
    });

    // 處理第三個 .goods 區塊
    addButtons3.forEach(addButton => {
        addButton.addEventListener('click', function() {
            handleAddButtonClick(addButton, '.goods3');
        });
    });
}

function handleAddButtonClick(addButton, goodsClass) {
    
    // 先刪除原本的新增按鈕
    var addButtonRow = addButton.parentNode.parentNode;
    addButtonRow.parentNode.removeChild(addButtonRow);

    var historyTable = document.querySelector(goodsClass + ' .goods_history');

    // 建立輸入框元素
    var imgInput = document.createElement('input');
    imgInput.type = 'text';
    imgInput.id = 'imgInput';
    imgInput.placeholder = '商品圖片 URL';

    var nameInput = document.createElement('input');
    nameInput.type = 'text';
    nameInput.id = 'nameInput';
    nameInput.placeholder = '商品名稱';

    var priceInput = document.createElement('input');
    priceInput.type = 'number';
    priceInput.id = 'priceInput';
    priceInput.placeholder = '單價';

    var quantityInput = document.createElement('input');
    quantityInput.type = 'number';
    quantityInput.id = 'quantityInput';
    quantityInput.placeholder = '總數';

    // 建立表單元素
    var formRow = document.createElement('tr');

    var imgInputTd = document.createElement('td');
    imgInputTd.classList.add('input-container');
    imgInputTd.appendChild(imgInput);
    formRow.appendChild(imgInputTd);

    var nameInputTd = document.createElement('td');
    nameInputTd.classList.add('input-container');
    nameInputTd.appendChild(nameInput);
    formRow.appendChild(nameInputTd);

    var priceInputTd = document.createElement('td');
    priceInputTd.classList.add('input-container');
    priceInputTd.appendChild(priceInput);
    formRow.appendChild(priceInputTd);

    var quantityInputTd = document.createElement('td');
    quantityInputTd.classList.add('input-container');
    quantityInputTd.appendChild(quantityInput);
    formRow.appendChild(quantityInputTd);
    
    //tr,td
    var buttonRow = document.createElement('tr');
    var buttonTd = document.createElement('td');
    buttonTd.colSpan = '4';

    // 儲存按鈕
    var submitButton = document.createElement('input');
    submitButton.type = 'button';
    submitButton.value = '儲存';
    submitButton.classList.add('button', 'saveButton');
    submitButton.addEventListener('click', function() {
        handleSaveButtonClick(imgInput, nameInput, priceInput, quantityInput, historyTable, formRow, buttonRow, goodsClass);
    });

    // 取消按鈕
    var cancelButton = document.createElement('input');
    cancelButton.type = 'button';
    cancelButton.value = '取消';
    cancelButton.classList.add('button', 'cancelButton');
    cancelButton.addEventListener('click', function() {
        formRow.parentNode.removeChild(formRow);
        buttonRow.parentNode.removeChild(buttonRow);
        createAddButton(historyTable, goodsClass);
    });

    buttonTd.appendChild(submitButton);
    buttonTd.appendChild(cancelButton);
    buttonRow.appendChild(buttonTd);
    historyTable.appendChild(formRow);
    historyTable.appendChild(buttonRow);
}

function handleSaveButtonClick(imgInput, nameInput, priceInput, quantityInput, historyTable, formRow, buttonRow, goodsClass) {
    var imgSrc = imgInput.value;
    var productName = nameInput.value;
    var price = priceInput.value;
    var quantity = quantityInput.value;

    var newRow = document.createElement('tr');

    // 新增商品圖片
    var imgTd = document.createElement('td');
    var imgDiv = document.createElement('div');
    imgDiv.classList.add('goods_and_img');
    var img = document.createElement('img');
    img.src = imgSrc;
    img.alt = productName;
    img.classList.add('goods_img');
    imgDiv.appendChild(img);
    imgDiv.appendChild(document.createTextNode(productName));
    imgTd.appendChild(imgDiv);
    newRow.appendChild(imgTd);

    // 新增商品價格
    var priceTd = document.createElement('td');
    priceTd.textContent = 'NT.' + price;
    newRow.appendChild(priceTd);

    // 新增商品數量
    var quantityTd = document.createElement('td');
    quantityTd.textContent = quantity;
    newRow.appendChild(quantityTd);

    // 新增修改按鈕元素
    var reviseTd = document.createElement('td');
    var addButton = document.createElement('input');
    addButton.type = 'button';
    addButton.value = '新增';
    addButton.name = 'revise';
    addButton.classList.add('button', 'addButton');
    var deleteButton = document.createElement('input');
    deleteButton.type = 'button';
    deleteButton.value = '刪除';
    deleteButton.name = 'revise';
    deleteButton.classList.add('button', 'deleteButton');
    reviseTd.appendChild(addButton);
    reviseTd.appendChild(document.createTextNode('\u00A0'));
    reviseTd.appendChild(deleteButton);
    newRow.appendChild(reviseTd);

    historyTable.appendChild(newRow);

    formRow.parentNode.removeChild(formRow);
    buttonRow.parentNode.removeChild(buttonRow);

    createAddButton(historyTable, goodsClass);
}

function createAddButton(historyTable, goodsClass) {
    var addButtonRow = document.createElement('tr');
    var addButtonTd = document.createElement('td');
    addButtonTd.colSpan = '4';
    addButtonTd.style.textAlign = 'right';

    var addButton = document.createElement('input');
    addButton.type = 'button';
    addButton.value = '+';
    addButton.classList.add('button', 'add');
    addButton.addEventListener('click', function() {
        handleAddButtonClick(addButton, goodsClass);
    });

    addButtonTd.appendChild(addButton);
    addButtonRow.appendChild(addButtonTd);
    historyTable.appendChild(addButtonRow);
}



//新增的js

function handleDeleteButtonClick(button) {
    const productRow = button.parentElement.parentElement;
    const productID = /* 獲取商品 ID 的程式碼 */;

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "merchant.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            productRow.style.display = "none";
            // 更新商品列表
            updateProductList();
        }
    };
    xhr.send("action=delete&productID=" + productID);
}

function handleSaveButtonClick(imgInput, nameInput, priceInput, quantityInput, historyTable, formRow, buttonRow, goodsClass) {
    const imgUrl = imgInput.value;
    const productName = nameInput.value;
    const price = priceInput.value;
    const inventory = quantityInput.value;

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "merchant.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            formRow.parentNode.removeChild(formRow);
            buttonRow.parentNode.removeChild(buttonRow);
            createAddButton(historyTable, goodsClass);
            // 更新商品列表
            updateProductList();
        }
    };
    xhr.send("action=add&productID=" + encodeURIComponent(productName) + "&imgUrl=" + encodeURIComponent(imgUrl) + "&price=" + price + "&inventory=" + inventory);
}

function updateProductList() {
    // 發送 AJAX 請求獲取商品列表
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "getProducts.jsp", true);
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            const products = JSON.parse(this.responseText);
            // 更新商品列表的 HTML
            updateProductListHTML(products);
        }
    };
    xhr.send();
}

function updateProductListHTML(products) {
    // 更新商品列表的 HTML 程式碼
}