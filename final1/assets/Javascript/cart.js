document.addEventListener('DOMContentLoaded', () => {
    let stepNumber = 1;
    const stepDisplay = document.getElementById('stepNumber');
    const sections = ['.checkInfo', '.checkPay', '.checkAll'].map(selector => document.querySelector(selector));
    const [prevButton, nextButton] = [document.getElementById('prevButton'), document.getElementById('nextButton')];
    const form = document.getElementById('checkoutForm');

    const showStep = (step) => {
        sections.forEach((section, index) => section.style.display = (index + 1) === step ? 'block' : 'none');
        stepDisplay.textContent = stepNumber;
        prevButton.style.display = step > 1 ? 'inline-block' : 'none';
        nextButton.textContent = step === 3 ? '結帳' : '下一步';
    };

    prevButton.addEventListener('click', () => {
        if (stepNumber > 1) showStep(--stepNumber);
    });

    nextButton.addEventListener('click', (event) => {
        if (stepNumber < 3) {
            showStep(++stepNumber);
        } else {
            form.submit();
        }
    });

    showStep(stepNumber);
});

document.addEventListener('DOMContentLoaded', function () {
    var deleteButtons = document.querySelectorAll('.deleteButton');

    deleteButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            // 刪除商品區塊
            var productBlock = button.closest('.pro');
            productBlock.remove();
			var form = document.getElementById('Delform');
			form.submit();
        });
    });
});

function clearPlaceholder(input) {
    if (input.value === input.defaultValue) {
        input.value = '';
    }
}


function updateDisplay() {

    const shipOptions = document.getElementsByName('ship');
    let selectedShip = '';
    for (const option of shipOptions) {
        if (option.checked) {
            selectedShip = option.value;
            break;
        }
    }


    const payOptions = document.getElementsByName('pay');
    let selectedPay = '';
    for (const option of payOptions) {
        if (option.checked) {
            selectedPay = option.value;
            break;
        }
    }


    document.getElementById('shippingDisplay').innerText = selectedShip;
    document.getElementById('paymentDisplay').innerText = selectedPay;
}


