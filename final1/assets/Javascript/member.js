function toggleEditMode() {
    const name = document.getElementById('name');
    const birth = document.getElementById('birth');
    const phone = document.getElementById('phone');
    const address = document.getElementById('address');
    const email = document.getElementById('email');
    const editName = document.getElementById('editName');
    const editBirth = document.getElementById('editBirth');
    const editPhone = document.getElementById('editPhone');
    const editAddress = document.getElementById('editAddress');
    const editEmail = document.getElementById('editEmail');

    editName.value = name.textContent;
    editBirth.value = birth.textContent;
    editPhone.value = phone.textContent;
    editAddress.value = address.textContent;
    editEmail.value = email.textContent;
    // 頁面切換
    profile.style.display = 'none';
    editForm.style.display = 'block';
}

function saveChanges(event) {
    event.preventDefault();
    
    const name = document.getElementById('name');
    const birth = document.getElementById('birth');
    const phone = document.getElementById('phone');
    const address = document.getElementById('address');
    const email = document.getElementById('email');
    const editName = document.getElementById('editName');
    const editBirth = document.getElementById('editBirth');
    const editPhone = document.getElementById('editPhone');
    const editAddress = document.getElementById('editAddress');
    const editEmail = document.getElementById('editEmail');
   
    
    name.textContent = editName.value;
    birth.textContent = editBirth.value;
    phone.textContent = editPhone.value;
    address.textContent = editAddress.value;
    email.textContent = editEmail.value;

    // 更新頁面
    profile.style.display = 'block';
    editForm.style.display = 'none';
}

function openForm() {
    
    var originalText = document.querySelector('.mes');
    originalText.style.display = 'none';

    // 顯示表單
    var form = document.getElementById('hiddenForm');
    form.style.display = 'block';
}




