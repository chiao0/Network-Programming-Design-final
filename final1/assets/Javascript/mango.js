// 圖片切換、數量增減
document.addEventListener('DOMContentLoaded', () => {
    const thumbnails = document.querySelectorAll('.thumbnail');
    const mainImage = document.getElementById('mainImage');
    const upButton = document.getElementById('upButton');
    const downButton = document.getElementById('downButton');
    const submitForm = document.getElementById('submit-form');
    const quantityInput = document.querySelector('.product-quantity');
    const minusButton = document.getElementById('minus');
    const plusButton = document.getElementById('plus');
    let scrollIndex = 0;
    let quantity = parseInt(quantityInput.value, 10);
    const stock = parseInt(document.querySelector('.stock span').textContent, 10);

    function updateSelectedThumbnail() {
        thumbnails.forEach((thumbnail, index) => {
            if (index === scrollIndex) {
                thumbnail.classList.add('selected');
            } else {
                thumbnail.classList.remove('selected');
            }
        });
    }

    thumbnails.forEach((thumbnail, index) => {
        thumbnail.addEventListener('click', () => {
            mainImage.src = thumbnail.src;
            scrollIndex = index;
            updateSelectedThumbnail();
            updateButtons();
        });
    });

    upButton.addEventListener('click', () => {
        if (scrollIndex > 0) {
            scrollIndex--;
            mainImage.src = thumbnails[scrollIndex].src;
            updateSelectedThumbnail();
            updateButtons();
        }
    });

    downButton.addEventListener('click', () => {
        if (scrollIndex < thumbnails.length - 1) {
            scrollIndex++;
            mainImage.src = thumbnails[scrollIndex].src;
            updateSelectedThumbnail();
            updateButtons();
        }
    });

    function updateButtons() {
        upButton.disabled = scrollIndex === 0;
        downButton.disabled = scrollIndex === thumbnails.length - 1;

        if (upButton.disabled) {
            upButton.querySelector('iconify-icon').classList.add('disabled-icon');
        } else {
            upButton.querySelector('iconify-icon').classList.remove('disabled-icon');
        }

        if (downButton.disabled) {
            downButton.querySelector('iconify-icon').classList.add('disabled-icon');
        } else {
            downButton.querySelector('iconify-icon').classList.remove('disabled-icon');
        }
    }

    updateButtons();
    updateSelectedThumbnail();

    minusButton.addEventListener('click', () => {
        if (quantity > 1) {
            quantity--;
            quantityInput.value = quantity;
        }
    });

    plusButton.addEventListener('click', () => {
        if (quantity < stock) {
            quantity++;
            quantityInput.value = quantity;
        } else {
            alert('已達庫存上限');
        }
    });

    submitForm.addEventListener('submit', (e) => {
        if (quantity > stock) {
            e.preventDefault();
            alert('商品庫存不足，無法加入購物車');
        }
    });
});




// 內容切換

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.tab-radio').forEach(tabRadio => {
        tabRadio.addEventListener('change', function() {
            var tabId = this.id;
            document.querySelectorAll('.tab-content').forEach(tabContent => {
                tabContent.classList.remove('active');
                tabContent.classList.add('hidden');
            });
            var activeTabContent = document.getElementById(tabId + '-content');
            if (activeTabContent) {
                activeTabContent.classList.remove('hidden');
                activeTabContent.classList.add('active');
            }
        });
    });

    const defaultCheckedRadio = document.querySelector('.tab-radio:checked');
    if (defaultCheckedRadio) {
        defaultCheckedRadio.dispatchEvent(new Event('change'));
    }
});








